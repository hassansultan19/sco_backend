<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Models\UserPackage;
use App\Models\Package;
use App\Models\Payment;

class PayPalController extends Controller
{
    private function getAccessToken(): string
    {
        try {
            $headers = [
                'Content-Type'  => 'application/x-www-form-urlencoded',
                'Authorization' => 'Basic ' . base64_encode('AXe8IX9mXy0sA2KcqbBgyDzUiQVRl4vT4M1BwOCm3mkzLDpqryK2zF1jFB9h5_6uiQzaA6UHyGXE9ZoZ' . ':' . 'EBIHjAJwTOS1QmzHsWOaDlD-El5rpUBY62bsMMHh0L_jxFpiLF3LjpWYWuGoNH95GIcvix_Q9lqnCsho'),
            ];

            $response = Http::withHeaders($headers)
                            ->asForm()
                            ->post('https://sandbox.paypal.com/v1/oauth2/token', [
                                'grant_type' => 'client_credentials',
                            ]);

            if ($response->failed()) {
                \Log::error('PayPal Access Token Request Failed', ['response' => $response->body()]);
                throw new \Exception('Unable to fetch PayPal access token.');
            }

            return json_decode($response->body())->access_token;
        } catch (\Exception $e) {
            \Log::error('PayPal Access Token Request Failed', ['message' => $e->getMessage()]);
            throw $e;
        }
    }

    public function createPayment(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required|exists:packages,id',
            ], [
                'id.exists' => 'The selected package does not exist.',
            ]);

            $package = Package::find($request->id);
            $headers = [
                'Content-Type'  => 'application/json',
               'PayPal-Request-Id' => '7b92603e-77ed-4896-8e78-5dea2050476a',
                'Authorization' => 'Bearer ' . $this->getAccessToken(),
            ];

            $response = Http::withHeaders($headers)
                            ->post('https://sandbox.paypal.com/v2/checkout/orders', [
                                "intent" => "CAPTURE",
                                "purchase_units" => [
                                    [
                                        "amount" => [
                                            "currency_code" => 'GBP',
                                            "value" => $package->price,
                                        ],
                                    ],
                                ],
                                "application_context" => [
                                    "return_url" => "http://localhost:5173/success?packageId={$package->id}", // Success URL
                                    "cancel_url" => "http://localhost:5173/cancel",  // Cancel URL
                                ],
                            ]);

            if ($response->failed()) {
                \Log::error('PayPal Order Creation Failed', ['response' => $response->body()]);
                return response()->json([
                    'status' => 'error',
                    'message' => 'Unable to create PayPal order. Please try again later.',
                ], 500);
            }

            $responseBody = json_decode($response->body(), true);

            return response()->json([
                'status' => 'success',
                'redirect_url' => $responseBody['links'][1]['href'], // PayPal approval link
            ]);
        } catch (\Exception $e) {
            \Log::error('Exception during PayPal order creation', ['message' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
            return response()->json([
                'status' => 'error',
                'message' => 'An unexpected error occurred. Please try again later.',
            ], 500);
        }
    }

    public function capturePayment(Request $request)
    {
        try {
            $request->validate([
                'token' => 'required|string',
                'user_id' => 'required|exists:users,id',
                'package_id' => 'required|exists:packages,id',
            ], [
                'token.required' => 'Payment token is required.',
                'user_id.exists' => 'The selected user does not exist.',
                'package_id.exists' => 'The selected package does not exist.',
            ]);
    
            $package = Package::find($request->package_id);
    
            if (!$package) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Package not found.',
                ], 404);
            }
    
            // Check if the user already has the package
            $existingUserPackage = UserPackage::where('user_id', $request->user_id)
                                              ->where('package_id', $request->package_id)
                                              ->where('status', 'active')
                                              ->first();
    
            if ($existingUserPackage) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'This user already has the selected package.',
                ], 400);
            }
    
            // Verify PayPal transaction by token (transaction ID)
            $paypalResponse = $this->verifyPaypalTransaction($request->token);
    
            if ($paypalResponse['status'] !== 'success') {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Invalid or failed PayPal transaction.',
                ], 400);
            }
    
            // Create a new UserPackage entry if it doesn't already exist
            $userPackage = UserPackage::create([
                'user_id' => $request->user_id,
                'package_id' => $request->package_id,
                'start_date' => now(),
                'status' => 'active',
            ]);

       

    
            // Create a new Payment entry using the retrieved package price
            $transaction = Payment::create([
                'user_package_id' => $userPackage->id,
                'transaction_id' => $request->token,
                'amount' => $package->price,
                'status' => 'completed',
            ]);
    
            return response()->json([
                'status' => 'success',
                'data' => [
                    'amount' => $transaction->price,
                    'package_name' => $package->name,

                    'transaction_id' => $transaction->transaction_id,
                ],
                'message' => 'Payment completed successfully.',
            ]);

        } catch (\Exception $e) {
            \Log::error('Exception during PayPal payment capture', ['message' => $e->getMessage(), 'trace' => $e->getTraceAsString()]);
            return response()->json([
                'status' => 'error',
                'message' =>  $e->getMessage(),
            ], 400);
        }
    }
    
    private function verifyPaypalTransaction($token)
    {
        try {
            $accessToken = $this->getAccessToken(); 
    
            $response = Http::withHeaders([
                'Content-Type' => 'application/json',
               'PayPal-Request-Id'=> '7b92603e-77ed-4896-8e78-5dea2050476a',
                'Authorization' => 'Bearer ' . $accessToken,
            ])->get("https://sandbox.paypal.com/v2/checkout/orders/{$token}/authorize");
    
            \Log::error('PayPal Transaction ', ['response' => $response]);
            if ($response->failed()) {
                \Log::error('PayPal Transaction Verification Failed', ['response' => $response->body()]);
                return ['status' => 'error', 'message' => 'Transaction verification failed.'];
            }
    
            $responseBody = json_decode($response->body(), true);
    
            // Check if the transaction was approved
            if (isset($responseBody['status']) && $responseBody['status'] === 'COMPLETED') {
                return ['status' => 'success', 'message' => 'Transaction verified successfully.'];
            }
    
            return ['status' => 'error', 'message' => 'Transaction is not completed or valid.'];
        } catch (\Exception $e) {
            \Log::error('PayPal Transaction Verification Error', ['message' => $e->getMessage()]);
            return ['status' => 'error', 'message' => 'Error during transaction verification.'];
        }
    }
}
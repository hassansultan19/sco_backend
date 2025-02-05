<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Srmklive\PayPal\Services\PayPal as PayPalClient;
use App\Models\UserPackage;
use App\Models\Package;
use App\Models\Payment;
use Illuminate\Support\Facades\Auth;

class PayPalController extends Controller
{
        private function getAccessToken(): string
        {
            $headers = [
                'Content-Type'  => 'application/x-www-form-urlencoded',
                'Authorization' => 'Basic ' . base64_encode('AWsblEkJhuCD3KKCtPZq6J6FAK3lwqlSqDY08g26qarDGyPdKKK9Pll1mJK7nATl-VYI0PN9rDu7U-de'. ':' . 'EL3UtED26xhabRMgoXqw9a1B_XUiS4qyPixUSTqlUj9xZBrBN6niyzcTn-z5eYBBycjKou349Tx2zWVT'),
                
            ];
        
            $response = Http::withHeaders($headers)
                            ->asForm()
                            ->post('https://sandbox.paypal.com/v1/oauth2/token', [
                                'grant_type' => 'client_credentials',
                            ]);

                            \Log::error('PayPal Access Token Request Failed', [
                                'response' => $response->body(),
                            ]);
                            
            if ($response->failed()) {
                \Log::error('PayPal Access Token Request Failed', [
                    'response' => $response->body(),
                ]);
                throw new \Exception('Unable to fetch PayPal access token.');
            }
        
            return json_decode($response->body())->access_token ?? throw new \Exception('Access token not returned.');
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
                    'Content-Type'      => 'application/json',
                    'Authorization'     => 'Bearer ' . $this->getAccessToken(),
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
]

                                ]);
    
                if ($response->failed()) {
                    \Log::error('PayPal Order Creation Failed', [
                        'response' => $response->body(),
                    ]);
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
                \Log::error('Exception during PayPal order creation.', [
                    'message' => $e->getMessage(),
                    'trace' => $e->getTraceAsString(),
                ]);
                return response()->json([
                    'status' => 'error',
                    'message' => 'An unexpected error occurred. Please try again later.',
                ], 500);
            }
        }
    
    
     


        public function capturePayment(Request $request)
        {
            $request->validate([
                'token' => 'required|string', 
                'user_id' => 'required|exists:users,id', // Assuming you have a `users` table
                'package_id' => 'required|exists:packages,id', // Assuming you have a `packages` table
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
        
            $existingUserPackage = UserPackage::where('user_id', $request->user_id)
                                              ->where('package_id', $request->package_id)
                                              ->where('status', "active")
                                              ->first();
        
            if ($existingUserPackage) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'This user already has the selected package.',
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
            Payment::create([
                'user_package_id' => $userPackage->id,
                'transaction_id' => $request->token,
                'amount' => $package->price, // Assuming the price field exists in your `packages` table
                'status' => 'completed',
            ]);
        
            return response()->json([
                'status' => 'success',
                'message' => 'Payment completed successfully.',
            ]);
        }
        

}

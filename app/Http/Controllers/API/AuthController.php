<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Interest;
use Exception;
use Hash;
use Mail;
use Str;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;
use App\Models\OtpVerification;
use App\Mail\OtpMail;
use App\Models\UserInterest;

class AuthController extends Controller
{
    public function getInterests(Request $request)
    {
        try {
            $interests = Interest::where('status', 1)->get();
            return customApiResponse(true, ["interests" => $interests], 'Interests!');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong', 500);
        }
    }
    public function checkUser(Request $request)
    {
        try {
            $user = User::where('email', $request->email)->where('is_user', $request->is_user)->first();
            if (!$user) {
                return customApiResponse(false, [], 'Invalid user credentials!');
            }
            return customApiResponse(true, [$user], 'user.');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong', 500);
        }
    }
    public function login(Request $request)
    {
        try {
            $otpVerification = User::where('email', $request->email)->where('is_user', $request->is_user)->whereNotNull('email_verified_at')->first();
            $user = User::where('email', $request->email)->where('is_user', $request->is_user)->first();

            if (!$user || !Hash::check($request->password, $user->password)) {
                return customApiResponse(false, [], 'Invalid user credentials!', 400);
            }
            if ($user->status == 0) {
                return customApiResponse(false, [], 'Your Account has been locked by Admin! Please Use Help & Support!', 400);
            }
            if (!$otpVerification) {
                $otp = rand(10000, 99999);
                OtpVerification::where('user_id', $user->id)->update(['code' => $otp, 'status' => 0, 'type' => 0, 'expired_at' => now()->addDay()]);
                Mail::to($request->email)->send(new OtpMail($otp, $request->email));
                return customApiResponse(false, [], 'OTP Not Verified.', 422);
            }
            $user['token'] = $user->createToken('token')->plainTextToken;
            return customApiResponse(true, $user, 'login successfully.');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'registerd successfully.', 500);
        }
    }
    public function sendOtpResetPassword(Request $request)
    {
        try {

            $user = User::where('email', $request->email)->where('is_user', $request->is_user)->first();
            if (!$user) {
                return customApiResponse(false, [], 'Invalid user', 400);
            }
            if ($user->provider != "Default") {
                return customApiResponse(false, [], "A Social User Can't Use this Feature", 400);
            }
            if ($user->email_verified_at == null && $request->type == 1) {
                return customApiResponse(false, [], "Please Verify Email First!", 400);
            }
            $otp = rand(10000, 99999);
            $checkOtp = OtpVerification::where('user_id', $user->id)->where('type', $request->type)->first();
            if ($checkOtp) {
                $checkOtp->update(['code' => $otp, 'status' => 0, 'type' => $request->type, "expired_at" => Carbon::now()->addDays(1)]);
            } else {
                OtpVerification::create([
                    'user_id' => $user->id,
                    "code" => $otp,
                    "status" => 0,
                    'type' => $request->type,
                    "expired_at" => Carbon::now()->addDays(1)
                ]);
            }
            Mail::to($user->email)->send(new OtpMail($otp, $user->email));
            return customApiResponse(true, $user, 'OTP sent successfully');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Error', 500);
        }

    }
    public function otpVerify(Request $request)
    {
        try {
            $otpVerification = OtpVerification::where('code', $request->otp)->where('type', $request->type)
                ->where('expired_at', '>=', Carbon::now())
                ->first();

            $user = User::where('email', $request->email)->first();
           
            if (!$user) {
                return customApiResponse(false, [], 'User Not Found!!', 400);
            }
          
            if (!$otpVerification) {
                return customApiResponse(false, [], 'Otp Not Found!', 400);
            }
            if ($user->provider != "Default") {
                return customApiResponse(false, [], "A Social User Can't Use this Feature", 400);
            }

            if ($request->type == 0) {
                User::where('id', $user->id)->update(['email_verified_at' => now()]);
                $otpVerification->update([
                    'status' => 1
                ]);
            }
            $user = User::find($user->id);
            return customApiResponse(true, $user, 'user is verified!');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Error', 500);
        }
    }

    public function resetPassword(Request $request)
    {
        try {
            $input = $request->all();

            $user = User::whereRaw('lower(email) = ?', [$input['email']])->where('is_user', $request->is_user)->first();
            if (!$user) {
                return customApiResponse(false, [], 'User Not Found!!', 400);
            }
            if ($user->provider != "Default") {
                return customApiResponse(false, [], "A Social User Can't Use this Feature", 400);
            }
            if (Hash::check($input['new_password'], $user->password)) {
                return customApiResponse(false, [], "Your Current Password can't be Your New Password", 422);
            }
            $otpVerification = OtpVerification::where('type', 1)
                ->where('user_id', $user->id)->where('status', 0)
                ->first();
            if (!$otpVerification) {
                return customApiResponse(false, [], 'Already Changed Password via OTP!', 400);
            }
            $input['password'] = Hash::make($input['new_password']);
            $user->update(['password' => $input['password']]);
            $otpVerification->update([
                'status' => 1
            ]);
            return customApiResponse(true, $user, 'Reset Password Successfully!');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Error', 500);
        }
    }
    public function socialLogin(Request $request)
    {
        try {
            $decodedPayload = $request->all();
            $token = $decodedPayload['access_token'];
            if (!$token) {
                return customApiResponse(false, [], 'Error! Token is Required!', 400);
            }
            $user = User::whereRaw('email = ?', [$decodedPayload['email']])->first();
            if (empty($user)) {
                User::create([
                    'access_token' => $decodedPayload['access_token'],
                    'provider' => $decodedPayload['provider'],
                    'name' => $decodedPayload['name'],
                    'email' => $decodedPayload['email'],
                    'password' => Hash::make(Str::random(12)),
                    'email_verified_at' => Carbon::now(),
                    "is_user" => $decodedPayload['is_user'],
                    "phone_country_code" => $decodedPayload['phone_country_code'] ?? ""
                ]);
                $user = User::whereRaw('email = ?', [$decodedPayload['email']])->first();
                $user['token'] = $user->createToken('token')->plainTextToken;


                return customApiResponse(true, $user, 'login successfully.');
            } else {
                if ($user->provider == "Default") {
                    return customApiResponse(false, [], 'Already Registered via Email!', 400);
                }
                if ($user->status == 0) {
                    return customApiResponse(false, [], 'Your Account has been locked by Admin! Please Use Help & Support!', 400);
                }
                $user['token'] = $user->createToken('token')->plainTextToken;

                return customApiResponse(true, $user, 'login successfully.');
            }

        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Error', 500);
        }
    }
    public function register(Request $request)
    {
        try {
            $input = $request->all();
            $rules = [
                'email' => 'required|email',
                'password' => 'required',
                'name' => 'required',
                'phone_code' => 'required',
                'phone_number' => 'required',
                'age' => 'required',
                'eye_color' => 'required',
                'height' => 'required',
                'weight' => 'required',
                'burst' => 'required',
                'address' => 'required',
                'is_user' => 'required',
                'main_image' => 'required',
                'latitude'=>'required',
                'longitude'=>'required',
               
            ];

            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $user = User::whereRaw('lower(email) = ?', [$input['email']])->first();
            if ($user) {
                return customApiResponse(false, [], 'Email Already Taken!', 422);
            }
            $input['guid']=Str::uuid();
            $input['password'] = Hash::make($input['password']);
            $user = User::create($input);
            if ($request->file('images')) {
                foreach ($request->file('images') as $photo) {
                    $user->addMedia($photo)->toMediaCollection('images');
                }
            }
            if ($request->file('main_image')) {
                $user->addMedia($request->file('main_image'))->toMediaCollection('main_image');
            }
            if ($request->file('videos')) {
                foreach ($request->file('videos') as $photo) {
                    $user->addMedia($photo)->toMediaCollection('videos');
                }
            }
            $user_interests = json_decode($request->user_interests ?? '[]');
            foreach ($user_interests as $value) {
                UserInterest::create([
                    'user_id' => $user->id,
                    'interest_id' => $value,
                    'status' => 1
                ]);
            }
            $user['token'] = $user->createToken('token')->plainTextToken;
            $otp = rand(10000, 99999);
            $data = [
                'user_id' => $user->id,
                'code' => $otp,
                'expired_at' => now()->addDay(),
                'status' => 0,
                'type' => 0
            ];
            OtpVerification::create($data);
            Mail::to($input['email'])->send(new OtpMail($otp, $input['email']));
            return customApiResponse(true, $user, 'Registerd Successfully.');
        } catch (Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }

    }
}

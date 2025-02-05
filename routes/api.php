<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\EscortController;
use App\Http\Controllers\API\TestimonialController;
use App\Http\Controllers\API\PackageController;
use App\Http\Controllers\API\UserPackageController;
use App\Http\Controllers\API\PayPalController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'auth'], function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('check', [AuthController::class, 'checkUser']);
    Route::post('social-login', [AuthController::class, 'socialLogin']);
    Route::post('send-otp', [AuthController::class, 'sendOtpResetPassword']);
    Route::post('verify-otp', [AuthController::class, 'otpVerify']);
    Route::post('reset-password', [AuthController::class, 'resetPassword']);
    Route::get('interests', [AuthController::class, 'getInterests']);
});
Route::group(['prefix' => 'escort'], function () {
    Route::get('featured', [EscortController::class, 'featured']);
    Route::get('normal', [EscortController::class, 'normal']);
    Route::get('all', [EscortController::class, 'all']);
    Route::get('getById/{guid}', [EscortController::class, 'getByID']);
    Route::get('getRelated/{guid}', [EscortController::class, 'getRelated']);
    Route::get('search', [EscortController::class, 'search']);
    Route::post('booking', [EscortController::class, 'booking']);
    Route::get('get-bookings', [EscortController::class, 'bookingList']);
    Route::post('update-password', [EscortController::class, 'updatePassword']);
    Route::post('update-featured', [EscortController::class, 'updateFeatured']);
    Route::post('update-profile',[EscortController::class,'update']);
});
Route::group(['prefix' => 'testimonial'], function () {
    Route::get('/', [TestimonialController::class, 'index']);
});
Route::group(['prefix' => 'enquiry'], function () {
    Route::post('/store', [TestimonialController::class, 'contact']);
});
Route::group(['prefix' => 'feedback'], function () {
    Route::post('/store', [EscortController::class, 'storeFeedback']);
    Route::get('/user/{id}', [EscortController::class, 'getAllFeedbacks']);
    Route::get('/escort', [EscortController::class, 'getAllEscortFeedbacks']);
    Route::post('update-status/{id}',[EscortController::class,'updateStatus']);
    Route::post('delete/{id}',[EscortController::class,'delete']);
    Route::get('/admin',[EscortController::class,'getAllAdminFeedbacks']);
});

Route::group(['prefix' => 'admin'], function () {
    Route::group(['prefix' => 'escorts'],function(){
        Route::get('featured', [EscortController::class, 'featured']);
        Route::get('normal', [EscortController::class, 'normal']);
        Route::get('in-active', [EscortController::class, 'inActive']);
    });
    Route::group(['prefix' => 'testimonial'],function(){
        Route::get('/', [TestimonialController::class, 'indexAdmin']);
        Route::get('/getById/{id}', [TestimonialController::class, 'getById']);
        Route::post('create',[TestimonialController::class,'create']);
        Route::post('update/{id}',[TestimonialController::class,'update']);
        Route::post('update-status/{id}',[TestimonialController::class,'updateStatus']);
    });
    Route::group(['prefix' => 'enquiry'],function(){
        Route::get('/', [TestimonialController::class, 'indexEnquiry']);
    });
    Route::group(['prefix' => 'packages'],function(){
        Route::get('/', [PackageController::class, 'indexAdmin']);
        Route::get('/getById/{id}', [PackageController::class, 'getById']);
        Route::post('create',[PackageController::class,'create']);
        Route::post('update/{id}',[PackageController::class,'update']);
        Route::post('update-status/{id}',[PackageController::class,'updateStatus']);
    });


    
        



    Route::middleware('auth:sanctum')->group(function () {
        // Create a new user package
        Route::post('/user-packages', [UserPackageController::class, 'store']);
    
        // Retrieve all user packages
        Route::get('/user-packages', [UserPackageController::class, 'index']);
    
        // Retrieve a single user package by ID
        Route::get('/user-packages/{id}', [UserPackageController::class, 'show']);
    });


Route::post('/paypal/create-payment', [PayPalController::class, 'createPayment']);
Route::post('/paypal/capture-payment', [PayPalController::class, 'capturePayment']);
   
});



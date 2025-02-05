<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Feedback;
use App\Models\UserBooking;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use App\Models\UserInterest;

class EscortController extends Controller
{
    public function featured(Request $request)
    {
        try {
            $now = Carbon::now();
            $total = User::where('status', 1)->where('featured', 1)->where('featured_until', '>', $now)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $categories = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 1)->where('featured', 1)->where('featured_until', '>', $now)->orderBy('created_at','DESC')->skip($skip)->take($page_size)->get();
            foreach ($categories as $value) {
                $featuredUntil = Carbon::parse($value->featured_until);
                $remaining = abs($featuredUntil->diffInSeconds($now));
                $value->remaining = (int) $remaining;
                $value->main_image = $value->getFirstMediaUrl('main_image');
                $value->images=array_values($value->getMedia('images')->toArray());
                $value->videos = array_values($value->getMedia('videos')->toArray());
            }
            return customApiResponse(true, ["escorts" => $categories, "pagination" => $pagination], 'Featured Escorts!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function normal(Request $request)
    {
        try {
            $total = User::where('status', 1)->where('featured', 0)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $categories = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 1)->where('featured', 0)->orderBy('created_at','DESC')->skip($skip)->take($page_size)->get();
            foreach ($categories as $value) {
                $value->main_image = $value->getFirstMediaUrl('main_image');
                $value->images=array_values($value->getMedia('images')->toArray());
                $value->videos = array_values($value->getMedia('videos')->toArray());
            }
            return customApiResponse(true, ["escorts" => $categories, "pagination" => $pagination], 'Featured Escorts!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function inActive(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'You are not Logged In!', 400);
            }
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }
            $total = User::where('status', 0)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $categories = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 0)->orderBy('created_at','DESC')->skip($skip)->take($page_size)->get();
            foreach ($categories as $value) {
                $value->main_image = $value->getFirstMediaUrl('main_image');
                $value->images=array_values($value->getMedia('images')->toArray());
                $value->videos = array_values($value->getMedia('videos')->toArray());
            }
            return customApiResponse(true, ["escorts" => $categories, "pagination" => $pagination], 'In-Active Escorts!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    // public function all(Request $request)
    // {
    //     try {
    //         $total = User::where('status', 1)->count();
    //         $page = $request->page ?? 1;
    //         $page_size = $request->page_size ?? 10;
    //         $skip = $page_size * ($page - 1);
    //         $total_pages = ceil($total / $page_size);
    //         $pagination = [
    //             'total' => $total,
    //             'page' => $page,
    //             'page_size' => $page_size,
    //             'total_pages' => $total_pages,
    //             'remaining' => $total_pages - $page,
    //             'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
    //             'prev_page' => $page > 1 ? $page - 1 : 1,
    //         ];
    //         $categories = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 1)->orderBy('created_at','DESC')->skip($skip)->take($page_size)->get();
    //         foreach ($categories as $value) {
    //             $value->main_image = $value->getFirstMediaUrl('main_image');
    //             $value->images=array_values($value->getMedia('images')->toArray());
    //             $value->videos = array_values($value->getMedia('videos')->toArray());
    //         }
    //         return customApiResponse(true, ["escorts" => $categories, "pagination" => $pagination], 'Featured Escorts!');
    //     } catch (\Exception $e) {
    //         return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
    //     }
    // }

    public function all(Request $request)
    {
        try {
            // Get latitude, longitude, and radius from query parameters
            $latitude = $request->query('latitude');
            $longitude = $request->query('longitude');
            $radius = $request->query('radius', 1000); // Default radius: 50 meters
    
         
            $radius_km = $radius / 1000;
    
            // Check if latitude and longitude are provided
            if (is_null($latitude) || is_null($longitude)) {
                return customApiResponse(false, [], 'Latitude and Longitude are required!', 400);
            }
    
            // Get the total count of users within the radius
            $total = User::where('status', 1)
                ->whereNotNull('latitude')
                ->whereNotNull('longitude')
                ->selectRaw("
                    (6371 * acos(
                        cos(radians(?)) * cos(radians(latitude)) 
                        * cos(radians(longitude) - radians(?)) 
                        + sin(radians(?)) * sin(radians(latitude))
                    )) AS distance", [$latitude, $longitude, $latitude])
                ->having('distance', '<=', $radius_km)
                ->count();
    
            // Pagination
            $page = $request->query('page', 1);
            $page_size = $request->query('page_size', 10);
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
    
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : null,
                'prev_page' => $page > 1 ? $page - 1 : null,
            ];
    
            // Fetch users within the radius and order them by closest distance
            $users = User::with(['media', 'userInterest', 'userInterest.interest'])
                ->where('status', 1)
                ->whereNotNull('latitude')
                ->whereNotNull('longitude')
                ->selectRaw("
                    id, name, latitude, longitude,
                    (6371 * acos(
                        cos(radians(?)) * cos(radians(latitude)) 
                        * cos(radians(longitude) - radians(?)) 
                        + sin(radians(?)) * sin(radians(latitude))
                    )) AS distance", [$latitude, $longitude, $latitude])
                ->having('distance', '<=', $radius_km)
                ->orderBy('distance', 'ASC') // Sort by closest distance
                ->skip($skip)
                ->take($page_size)
                ->get();
    
            // Process media for each user
            foreach ($users as $user) {
                $user->main_image = $user->getFirstMediaUrl('main_image');
                $user->images = array_values($user->getMedia('images')->toArray());
                $user->videos = array_values($user->getMedia('videos')->toArray());
            }
    
            return customApiResponse(true, ["escorts" => $users, "pagination" => $pagination], 'Users Near You!');
        } catch (\Exception $e) {
            return customApiResponse(false, [], 'Something Went Wrong!', 500);
        }
    }
    public function getByID($guid, Request $request)
    {
        try {
            $user = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 1)->where('guid', $guid)->first();
            if (!$user) {
                return customApiResponse(false, [], 'Escort Not Found', 400);
            }
            $user->main_image = $user->getFirstMediaUrl('main_image');
            $user->images=array_values($user->getMedia('images')->toArray());
            $user->videos = array_values($user->getMedia('videos')->toArray());
            return customApiResponse(true, ["escort" => $user], 'Escort Detail!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function getRelated($guid, Request $request)
    {
        try {
            $user = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 1)->where('guid', $guid)->first();
            if (!$user) {
                return customApiResponse(false, [], 'Escort Not Found', 400);
            }
            $interestIds = $user->userInterest->pluck('interest_id')->toArray();
            $relatedUsers = User::with(['media', 'userInterest', 'userInterest.interest'])
                ->where('status', 1)
                ->whereHas('userInterest', function ($query) use ($interestIds) {
                    $query->whereIn('interest_id', $interestIds);
                })
                ->where('id', '!=', $user->id)
                ->orderBy('created_at','DESC')
                ->get();

            if ($relatedUsers->isEmpty()) {
                return customApiResponse(false, [], 'No Related Found!', 200);
            }
            return customApiResponse(true, $relatedUsers, 'Related!', 200);
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }

    public function search(Request $request)
    {
        try {
            $users = User::with(['media', 'userInterest', 'userInterest.interest'])->where('status', 1);
    
            // Apply filters if provided
            if (!empty($request->sex) && $request->sex != "undefined" && $request->sex != "null") {
                $users = $users->where('sex', '=', $request->sex);
            }
            if (!empty($request->age) && $request->age != "undefined" && $request->age != "null") {
                $users = $users->where('age', '=', $request->age);
            }
            if (!empty($request->address) && $request->address != "undefined" && $request->address != "null") {
                $users = $users->where('address', 'LIKE', '%' . $request->address . '%');
            }
    
            if (!empty($request->zip_code) && $request->zip_code !== "undefined" && $request->zip_code !== "null") {
                if (is_numeric($request->zip_code)) {
                    // If zip_code is numeric, search in zip_code
                    $users = $users->where('zip_code', 'LIKE', '%' . $request->zip_code . '%');
                } else {
                    // If zip_code is a string, search in city
                    $users = $users->where('city', 'LIKE', '%' . $request->zip_code . '%');
                }
            }
    
            if (!empty($request->name) && $request->name != "undefined" && $request->name != "null") {
                $users = $users->whereHas('interests', function ($query) use ($request) {
                    $query->where('name', 'LIKE', '%' . $request->name . '%');
                });
            }
    
            // Pagination setup
            $page_size = (int) $request->get('per_page', 9); // Default 9 items per page
            $users = $users->orderBy('created_at', 'DESC')->paginate($page_size);
    
            // Calculate custom pagination data
            $total = $users->total();
            $current_page = $users->currentPage();
            $total_pages = $users->lastPage();
            $pagination = [
                'total' => $total,
                'page' => $current_page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $current_page,
                'next_page' => $total_pages > $current_page ? $current_page + 1 : null,
                'prev_page' => $current_page > 1 ? $current_page - 1 : null,
            ];
    
            // Response
            return customApiResponse(true, [
                'users' => $users->items(), // Paginated data
                'pagination' => $pagination,
            ], 'Search!', 200);
    
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    
    public function booking(Request $request)
    {
        try {
            $input = $request->all();
            $rules = [
                'email' => 'required|email',
                'name' => 'required',
                'phone_code' => 'required',
                'phone_number' => 'required',
                'message' => 'required',
                'guid' => 'required'
            ];

            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $user = User::where('status', 1)->where('guid', $input['guid'])->first();
            if (!$user) {
                return customApiResponse(false, [], 'Escort Not Found', 400);
            }
            UserBooking::create([
                "guid" => $input['guid'],
                "name" => $input['name'],
                "email" => $input['email'],
                "phone_code" => $input['phone_code'],
                "phone_number" => $input['phone_number'],
                "message" => $input['message'],
            ]);
            return customApiResponse(true, [], 'Booking Created! You will be contacted Shortly!', 200);
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function bookingList(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'You are not Logged In!', 400);
            }
            $total = UserBooking::where('guid', $user->guid)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $bookings = UserBooking::where('guid', $user->guid)->orderBy('created_at', 'DESC')->skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["bookings" => $bookings, "pagination" => $pagination], 'Featured Escorts!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function update(Request $request)
    {
        try {
            $input = $request->all();
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'You are not Logged In!', 400);
            }
            $rules = [
                'name' => 'required',
                'phone_code' => 'required',
                'phone_number' => 'required',
                'age' => 'required',
                'eye_color' => 'required',
                'height' => 'required',
                'weight' => 'required',
                'burst' => 'required',
                'address' => 'required',
                'main_image' => 'required',
                'sex' => 'required'
            ];
            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $user->name = $input['name'];
            $user->phone_code = $input['phone_code'];
            $user->phone_number = $input['phone_number'];
            $user->age = $input['age'];
            $user->eye_color = $input['eye_color'];
            $user->height = $input['height'];
            $user->weight = $input['weight'];
            $user->burst = $input['burst'];
            $user->address = $input['address'];
            $user->sex = $input['sex'];
            $user->save();
            if ($request->hasFile('main_image')) {
                if ($user->hasMedia('main_image')) {
                    $user->getFirstMedia('main_image')->delete();
                }
                $user->addMediaFromRequest('main_image')->toMediaCollection('main_image');
            }
            if ($request->file('videos')) {
                foreach ($request->file('videos') as $photo) {
                    $user->addMedia($photo)->toMediaCollection('videos');
                }
            }
            if ($request->file('images')) {
                foreach ($request->file('images') as $photo) {
                    $user->addMedia($photo)->toMediaCollection('images');
                }
            }
            if ($request->has('deleted_files')) {
                $deletedFiles = json_decode($request->deleted_files ?? '[]');
                foreach ($deletedFiles as $value) {
                    $media = Media::find($value);
                    if ($media) {
                        $media->delete();
                    }
                }
            }
            if ($request->has('deleted_video_files')) {
                $deletedFiles = json_decode($request->deleted_video_files ?? '[]');
                foreach ($deletedFiles as $value) {
                    $media = Media::find($value);
                    if ($media) {
                        $media->delete();
                    }
                }
            }
            $user_interests = json_decode($request->user_interests ?? '[]');
            UserInterest::where('user_id', $user->id)->delete();
            foreach ($user_interests as $value) {
                UserInterest::create([
                    'user_id' => $user->id,
                    'interest_id' => $value,
                    'status' => 1
                ]);
            }
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function updatePassword(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            if ($user->provider != "Default") {
                return customApiResponse(false, [], "A Social User Can't Use this Feature", 400);
            }
            if (!Hash::check($request->old_password, $user->password)) {
                return customApiResponse(false, [], 'Old password does not match!', 400);
            }
            $validator = Validator::make($request->all(), [
                'old_password' => 'required',
                'password' => 'required|confirmed',
            ]);
            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Old password does not match!', 400);
            }
            if ($request->old_password == $request->password) {
                return customApiResponse(false, [], 'New password can\'t be the same as Old One!', 400);
            }
            $user->password = Hash::make($request->password);
            $user->save();

            return customApiResponse(true, $user, 'Password Updated Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Error', 500);
        }
    }
    public function updateFeatured(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            $user->featured = 1;
            $date = date("Y-m-d");
            $mod_date = strtotime($date . "+ " . $request->days . " days");
            $user->featured_until = date("Y-m-d h:i:s", $mod_date);
            $user->save();
            return customApiResponse(true, $user, 'Featured Updated Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Error', 500);
        }
    }
    public function storeFeedback(Request $request)
    {
        try {
            $input = $request->all();
            $rules = [
                'name' => 'required',
                'user_id' => 'required',
                'rating' => 'required'
            ];
            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            Feedback::create($input);
            return customApiResponse(true, [], 'Feedback Added Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function getAllFeedbacks(Request $request, $id)
    {
        try {
            $total = Feedback::where('is_deleted', 0)->where('user_id', $id)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $categories = Feedback::where('is_deleted', 0)->where('user_id', $id)->orderBy('created_at', 'DESC')->skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["feedbacks" => $categories, "pagination" => $pagination], 'Feedbacls!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function getAllEscortFeedbacks(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'You are not Logged In!', 400);
            }
            $total = Feedback::where('is_deleted', 0)->where('user_id', $user->id)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $categories = Feedback::where('is_deleted', 0)->where('user_id', $user->id)->orderBy('created_at', 'DESC')->skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["feedbacks" => $categories, "pagination" => $pagination], 'Feedbacls!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function getAllAdminFeedbacks(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'You are not Logged In!', 400);
            }
            $now = Carbon::now();
            $total = Feedback::where('is_deleted', 0)->count();
            $page = $request->page ?? 1;
            $page_size = $request->page_size ?? 10;
            $skip = $page_size * ($page - 1);
            $total_pages = ceil($total / $page_size);
            $pagination = [
                'total' => $total,
                'page' => $page,
                'page_size' => $page_size,
                'total_pages' => $total_pages,
                'remaining' => $total_pages - $page,
                'next_page' => $total_pages > $page ? $page + 1 : $total_pages,
                'prev_page' => $page > 1 ? $page - 1 : 1,
            ];
            $categories = Feedback::where('is_deleted', 0)->orderBy('created_at', 'DESC')->skip($skip)->take($page_size)->get();
            foreach ($categories as $value) {
                $getUser=User::with('media')->find($value->user_id);
                $featuredUntil = Carbon::parse($getUser->featured_until);
                $remaining = abs($featuredUntil->diffInSeconds($now));
                $getUser->remaining = (int) $remaining;
                $getUser->main_image = $getUser->getFirstMediaUrl('main_image');
                $getUser->images=array_values($getUser->getMedia('images')->toArray());
                $getUser->videos = array_values($getUser->getMedia('videos')->toArray());
                $value->user=$getUser;
            }
            return customApiResponse(true, ["feedbacks" => $categories, "pagination" => $pagination], 'Feedbacls!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function updateStatus(Request $request, $id)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            $testimonial = Feedback::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Feedback Not Found!', 404);
            }
            $testimonial->update([
                "status" => $testimonial->status == 1 ? 0 : 1
            ]);
            return customApiResponse(true, [], 'Feedback Status Updated Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function delete(Request $request, $id)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            $testimonial = Feedback::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Feedback Not Found!', 404);
            }
            $testimonial->update([
                "is_deleted" => $testimonial->is_deleted == 1 ? 0 : 1
            ]);
            return customApiResponse(true, [], 'Feedback Deleted!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
}
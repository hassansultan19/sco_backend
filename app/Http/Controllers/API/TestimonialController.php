<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;
use App\Models\Enquiry;
use Illuminate\Support\Facades\Validator;

class TestimonialController extends Controller
{
    public function indexEnquiry(Request $request)
    {
        try {
            $total = Enquiry::count();
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
            $testimonial = Enquiry::skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["enquiry" => $testimonial, "pagination" => $pagination], 'Enquiries!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        } 
    }
    public function indexAdmin(Request $request)
    {
        try {
            $total = Testimonial::where('status', 1)->count();
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
            $testimonial = Testimonial::with('media')->where('status', 1)->skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["testimonials" => $testimonial, "pagination" => $pagination], 'Testimonials!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }

    }
    public function index(Request $request)
    {
        try {
            $total = Testimonial::where('status', 1)->count();
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
            $testimonial = Testimonial::with('media')->where('status', 1)->skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["testimonials" => $testimonial, "pagination" => $pagination], 'Testimonials!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }

    }
    public function contact(Request $request)
    {
        try {
            $input = $request->all();
            $rules = [
                'email' => 'required|email',
                'name' => 'required',
                'phone_number' => 'required',
                'message' => 'required',
            ];

            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            Enquiry::create([
                "name" => $input['name'],
                "email" => $input['email'],
                "phone_number" => $input['phone_number'],
                "message" => $input['message']
            ]);
            return customApiResponse(true, [], 'Enquiry Created Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function create(Request $request)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }
            $input = $request->all();
            $rules = [
                'name' => 'required',
                'rating' => 'required|numeric|min:1',
                'message' => 'required',
            ];
            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $testimonial=Testimonial::create([
                "name" => $input['name'],
                "rating" => $input['rating'],
                "message" => $input['message']
            ]);
            if ($request->hasFile('image')) {
                $testimonial->addMediaFromRequest('image')->toMediaCollection('image');
            }
            return customApiResponse(true, [], 'Testimonial Created Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function getById(Request $request,$id)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }
            
            $testimonial=Testimonial::with('media')->find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Testimonial Not Found!', 404);
            }
            
            return customApiResponse(true, ["testimonial"=>$testimonial], 'Testimonial!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function update(Request $request,$id)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }
            $input = $request->all();
            $rules = [
                'name' => 'required',
                'rating' => 'required|numeric|min:1',
                'message' => 'required',
            ];
            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $testimonial=Testimonial::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Testimonial Not Found!', 404);
            }
            $testimonial->update([
                "name" => $input['name'],
                "rating" => $input['rating'],
                "message" => $input['message']
            ]);
            if ($request->hasFile('image')) {
                if ($testimonial->hasMedia('image')) {
                    $testimonial->getFirstMedia('image')->delete();
                }
                $testimonial->addMediaFromRequest('image')->toMediaCollection('image');
            }
            return customApiResponse(true, [], 'Testimonial Updated Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function updateStatus(Request $request,$id)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }
            $testimonial=Testimonial::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Testimonial Not Found!', 404);
            }
            $testimonial->update([
                "status" => $testimonial->status==1?0:1
            ]);
            return customApiResponse(true, [], 'Testimonial Status Updated Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
}

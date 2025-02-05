<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Package;
use Illuminate\Support\Facades\Validator;

class PackageController extends Controller
{
    public function indexAdmin(Request $request)
    {
        try {
            $total = Package::count();
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
            $testimonial = Package::skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["packages" => $testimonial, "pagination" => $pagination], 'Packages!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }

    }
    public function index(Request $request)
    {
        try {
            $total = Package::where('status', 1)->count();
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
            $testimonial = Package::where('status', 1)->skip($skip)->take($page_size)->get();
            return customApiResponse(true, ["packages" => $testimonial, "pagination" => $pagination], 'Packages!');
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
                'title' => 'required',
                'price' => 'required|numeric|min:1',
                'duration' => 'required|numeric|min:1',
            ];
            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $testimonial = Package::create([
                "title" => $input['title'],
                "price" => $input['price'],
                "duration" => $input['duration'],
                "description" => $input['description'] ?? "",
            ]);
            return customApiResponse(true, [], 'Package Created Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function update(Request $request, $id)
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
                'title' => 'required',
                'price' => 'required|numeric|min:1',
                'duration' => 'required|numeric|min:1',
            ];
            $validator = Validator::make($input, $rules);

            if ($validator->fails()) {
                return customApiResponse(false, $validator->errors(), 'Validation Error', 422);
            }
            $testimonial = Package::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Package Not Found!', 404);
            }
            $testimonial->update([
                "title" => $input['title'],
                "price" => $input['price'],
                "duration" => $input['duration'],
                "description" => $input['description'] ?? "",
                "status" => $input['status'] ?? $testimonial->status,
            ]);
            return customApiResponse(true, [], 'Package Updated Successfully!');
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
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }
            $testimonial = Package::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Package Not Found!', 404);
            }
            $testimonial->update([
                "status" => $testimonial->status == 1 ? 0 : 1
            ]);
            return customApiResponse(true, [], 'Package Status Updated Successfully!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
    public function getById(Request $request, $id)
    {
        try {
            $user = $request->user('sanctum');
            if (!$user) {
                return customApiResponse(false, [], 'Log In First!', 400);
            }
            if ($user->is_user != 2) {
                return customApiResponse(false, [], 'You are not an Admin!', 400);
            }

            $testimonial = Package::find($id);
            if (!$testimonial) {
                return customApiResponse(false, [], 'Package Not Found!', 404);
            }

            return customApiResponse(true, ["package" => $testimonial], 'Package!');
        } catch (\Exception $e) {
            return customApiResponse(false, $e->getMessage(), 'Something Went Wrong!', 500);
        }
    }
}

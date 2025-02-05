<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\UserPackage;
use Illuminate\Http\Request;

class UserPackageController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    public function store(Request $request)
    {
        $user = auth()->user();

        $validated = $request->validate([
            'package_id' => 'required|exists:packages,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',
            'status' => 'required|string',
            'description' => 'nullable|string|max:255',
        ]);

        $validated['user_id'] = $user->id;

        $userPackage = UserPackage::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'User package created successfully!',
            'data' => $userPackage,
        ], 201);
    }

    public function index()
    {
        $user = auth()->user();

        $userPackages = UserPackage::with(['user', 'package'])
            ->where('user_id', $user->id)
            ->get();

        return response()->json([
            'success' => true,
            'message' => 'User packages retrieved successfully!',
            'data' => $userPackages,
        ]);
    }

    public function show($id)
    {
        $user = auth()->user();

        $userPackage = UserPackage::with(['user', 'package'])
            ->where('user_id', $user->id)
            ->findOrFail($id);

        return response()->json([
            'success' => true,
            'message' => 'User package retrieved successfully!',
            'data' => $userPackage,
        ]);
    }
}

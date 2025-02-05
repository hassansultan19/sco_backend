<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\UserPackage;
use App\Notifications\PackageExpiredNotification;
use Carbon\Carbon;

class ExpirePackages extends Command
{
    protected $signature = 'packages:expire';
    protected $description = 'Expire user packages based on their duration and start date';
    public function handle()
    {
        \Log::info('ExpirePackages command started at: ' . now());
    
        $activePackages = UserPackage::with('user') // Load the associated user
                                     ->where('status', 'active')
                                     ->get();
    
        if ($activePackages->isEmpty()) {
            \Log::info('No active packages found.');
            return;
        }
    
        foreach ($activePackages as $package) {
            \Log::info("Processing UserPackage ID: {$package->id}");
    
            $startDate = Carbon::parse($package->start_date);
            $duration = $package->package->duration;
    
            // Add exactly the duration (in days) to the start date to calculate end date
            $endDate = $startDate->copy()->addDays($duration); // We add 2 days from the startDate
    
            // Log for debugging
            \Log::info("Start Date: {$startDate->toDateString()}, End Date: {$endDate->toDateString()}, Duration: {$duration} days");
    
            // Check if today is greater than or equal to the expiration date
            if (Carbon::today()->greaterThanOrEqualTo($endDate)) {
                $package->update(['status' => 'expired']);
                \Log::info("UserPackage ID {$package->id} marked as expired.");
            } else {
                \Log::info("UserPackage ID {$package->id} is not yet expired.");
            }
        }
    }
    
    
}

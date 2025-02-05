<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */

     protected $commands = [
        Commands\ExpirePackages::class,
    ];
    protected function schedule(Schedule $schedule): void
    {
        // Schedule the featured:update command to run daily
        $schedule->command('featured:update')->daily();
        \Log::info('Scheduler running...'); // Log every minute
        // Schedule the packages:expire command to run every minute
       
            $schedule->command('packages:expire')->everyMinute();
           
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }

    /**
     * Register custom artisan commands.
     */
   
}

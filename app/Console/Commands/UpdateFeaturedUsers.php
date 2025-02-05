<?php

namespace App\Console\Commands;

use App\Http\Controllers\API\EscortController;
use Illuminate\Console\Command;

class UpdateFeaturedUsers extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'featured:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $controller = new EscortController();
        $controller->cronFeatured(new \Illuminate\Http\Request());
        \Log::info("HELLLOOOOO");
        $this->info('Featured users updated successfully');
    }
}

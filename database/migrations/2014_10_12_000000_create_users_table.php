<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('guid')->nullable();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('phone_country_code')->nullable();
            $table->string('phone_code')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('address')->nullable();
            $table->string('city')->nullable();
            $table->string('state')->nullable();
            $table->string('country')->nullable();
            $table->string('zip_code')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->string('age');
            $table->string('eye_color');
            $table->string('height');
            $table->string('weight');
            $table->string('burst');
            $table->longText('about')->nullable();
            $table->tinyInteger('is_user')->default(0);
            $table->tinyInteger('status')->default(1);
            $table->enum('provider', ['Default', 'Google', 'Facebook', 'Apple'])->default('Default');
            $table->text('fcm_token')->nullable();
            $table->longText('access_token')->nullable();
            $table->string('remember_token', 100)->nullable();
            $table->tinyInteger('featured')->default(0);
            $table->string('featured_until')->nullable();
            $table->string('sex')->nullable();
            $table->text('hair_color')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};

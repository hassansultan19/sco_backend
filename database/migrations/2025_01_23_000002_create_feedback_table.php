<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeedbackTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('feedback', function (Blueprint $table) {
            $table->id(); // Auto-incrementing unsigned bigint for 'id'
            $table->unsignedBigInteger('user_id'); // Foreign key for 'user_id'
            $table->integer('rating'); // Rating column
            $table->tinyInteger('status')->default(0); // Status column with default 0
            $table->tinyInteger('is_deleted')->default(0); // Is_deleted column with default 0
            $table->string('name'); // Name column
            $table->text('message')->nullable(); // Message column, nullable
            $table->timestamps(); // Adds 'created_at' and 'updated_at' columns

            // Optional: Add a foreign key constraint if required
            // $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('feedback');
    }
}

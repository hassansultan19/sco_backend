<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('packages', function (Blueprint $table) {
            $table->id(); // UNSIGNED BIGINT PRIMARY KEY
            $table->string('title', 255); // VARCHAR(255), NOT NULL
            $table->text('description')->nullable(); // TEXT, DEFAULT NULL
            $table->decimal('price', 10, 2); // DECIMAL(10, 2), NOT NULL
            $table->integer('duration'); // INT(11), NOT NULL
            $table->tinyInteger('status')->default(1); // TINYINT(4), DEFAULT 1
            $table->timestamps(); // CREATED_AT and UPDATED_AT timestamps
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('packages');
    }
};

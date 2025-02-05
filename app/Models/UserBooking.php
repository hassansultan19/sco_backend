<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserBooking extends Model
{
    use HasFactory;

    protected $fillable = ['guid', 'name', 'email', 'phone_code', 'phone_number','message'];

    public function user()
    {
        return $this->belongsTo(User::class, 'guid');
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Payment extends Model{
    use HasFactory;

    protected $fillable = ['user_package_id','transaction_id','amount','status'];
     // Relationship to UserPackage
     public function Package()
     {
         return $this->belongsTo(Package::class, 'user_package_id');
     }
 
     // Relationship to User (indirectly via UserPackage)
     public function user()
     {
         return $this->userPackage->user();
     }

}
 
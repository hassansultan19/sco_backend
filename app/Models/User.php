<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class User extends Authenticatable implements HasMedia
{
    use HasApiTokens, HasFactory, Notifiable,InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone_country_code',
        'phone_number',
        'phone_code',
        'status',
        'provider',
        'access_token',
        'fcm_token',
        'address',
        'city',
        'state',
        'country',
        'zip_code',
        'latitude',
        'longitude',
        'age',
        'eye_color',
        'height',
        'weight',
        'burst',
        'about',
        'is_user',
        'featured',
        'featured_until',
        'guid',
        'sex',
        'hair_color'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];
    
        protected $appends = ['rating'];


    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function userInterest() 
    {
        return $this->hasMany(UserInterest::class);   
    }
      public function getRatingAttribute()
    {
        $totalRatings = Feedback::where('user_id', $this->id)->where('is_deleted',0)->sum('rating');
        $ratingsCount = Feedback::where('user_id', $this->id)->where('is_deleted',0)->count();
        if ($ratingsCount == 0) {
            return "0";
        }
        return number_format($totalRatings / $ratingsCount, 2);
    }

    public function packages()
    {
        return $this->belongsToMany(Package::class, 'user_packages')
                    ->withPivot('start_date', 'end_date', 'status')
                    ->withTimestamps();
    }
    
}

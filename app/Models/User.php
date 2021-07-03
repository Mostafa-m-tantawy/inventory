<?php

namespace App\Models;

use App\Http\Traits\baseTrait;
use App\Models\hr\HrEmployee;
use App\Models\inventory\Store;
use App\Models\inventory\Supplier;
use App\Scopes\restaurantScope;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens,Notifiable,HasRoles,baseTrait,SoftDeletes;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function supplier(){
        return $this->hasOne(Supplier::class);
    }

    public function store(){
        return $this->belongsTo(Store::class)->with('user');
    }


    public function canAny(array $permissions)
    {
        foreach($permissions as $e){

            if($this->can($e)) return true;
        }

        return false;
    }
}

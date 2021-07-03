<?php

namespace App\Models\inventory;


use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Scopes\restaurantScope;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Supplier extends Model
{
    use baseTrait, restaurantScopeTrait, SoftDeletes;


    public function purchases()
    {
        return $this->hasMany(Purse::class);
    }

//
//    public function payment()
//    {
//        return $this->hasMany(Payment::class, 'receiver_id');
//    }
    public function payment()
    {
        return $this->morphMany(Payment::class, 'receiver');
    }


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_supplier')->withPivot('vat')->orderBy('name');
    }


    public function refunds()
    {
        return $this->hasMany(RefundProduct::class);
    }


    public function getNameAttribute()
    {

        return $this->user->name;
    }


    public function getCanDeletedAttribute()
    {
        if ($this->purchases->count() > 0 || $this->payment->count() > 0) {
            return false;
        }
        return true;
    }


}


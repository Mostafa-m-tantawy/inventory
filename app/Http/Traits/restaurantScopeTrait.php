<?php
namespace App\Http\Traits;


use App\Models\inventory\Store;
use App\Scopes\restaurantScope;

trait restaurantScopeTrait {

    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope(new restaurantScope());

        static::creating(function ($model) {
            $model->store_id = auth()->user()->store_id;
        });

    }
    protected static function booted()
    {
        static::addGlobalScope(new restaurantScope);
    }


public  function restaurant(){
        return $this->belongsTo(Store::class);
}
}

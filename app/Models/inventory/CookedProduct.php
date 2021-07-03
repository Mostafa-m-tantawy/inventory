<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Scopes\restaurantScope;
use Illuminate\Database\Eloquent\Model;

class CookedProduct extends Model
{
    use baseTrait,restaurantScopeTrait;

    public function cookable(){
        return $this->morphTo();
    }

public function department(){

    return $this->belongsTo(Department::class);
}
public function product(){

    return $this->belongsTo(Product::class);
}
}

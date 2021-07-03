<?php

namespace App;

use App\Http\Traits\restaurantScopeTrait;
use Illuminate\Database\Eloquent\Model;

class PackageRestaurant extends Model
{
protected $table='package_restaurant';

public function package(){
    return $this->belongsTo(Package::class);
}
    //
}

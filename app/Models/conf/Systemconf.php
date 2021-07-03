<?php

namespace App\Models\conf;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Scopes\restaurantScope;
use Illuminate\Database\Eloquent\Model;

class Systemconf extends Model
{    use restaurantScopeTrait;
protected $table='system_confs';
    protected $fillable=['name','value','store_id'];


}

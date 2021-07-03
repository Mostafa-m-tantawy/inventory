<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use Illuminate\Database\Eloquent\Model;

class InventoryCountDetails extends Model
{
    use  baseTrait,restaurantScopeTrait;}

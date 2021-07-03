<?php
namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use App\Scopes\restaurantScope;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Purse extends Model
{    use uploadFileTrait, baseTrait,restaurantScopeTrait;

    public function supplier()
    {
        return $this->belongsTo(Supplier::class,'supplier_id');
    }

    public function pursesProducts()
    {
        return $this->hasMany(PursesProduct::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function restaurant()
    {
        return $this->belongsTo(Store::class,'store_id');
    }



//    public function getTotalAttribute()
//    {
//
//        return $this->pursesProducts->sum(function($t){
//            return ($t->quantity * $t->unit_price)+($t->quantity * $t->unit_price)*($t->vat/100);
//
//        });
//
//    }
    public function getSubTotalAttribute()
    {

        return $this->pursesProducts->sum(function($t){return $t->sub_total;});

    }
    public function getProductDiscountAttribute()
    {

        return $this->pursesProducts->sum(function($t){return $t->discount;});

    }
    public function getTotalAttribute()
    {

        return $this->pursesProducts->sum(function($t){return $t->total;})-$this->discount;

    }

    public function getVatAttribute()
    {
        return $this->pursesProducts->sum(function($t){
            return($t->vat_value);
        });

    }
}

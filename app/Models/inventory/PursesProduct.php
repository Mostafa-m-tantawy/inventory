<?php
namespace App\Models\inventory;


use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use Illuminate\Database\Eloquent\Model;

class PursesProduct extends Model
{    use restaurantScopeTrait;

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function purse()
    {
        return $this->belongsTo(Purse::class);
    }
    public function getTotalAttribute()
    {
        return $this->sub_total+($this->vat_value) -$this->discount;

    }
    public function getSubTotalAttribute()
    {
        return ($this ->quantity * $this->unit_price);

    }

    public function getDiscountAttribute()
    {
        return $this->sub_total*($this->discount_percentage/100);

    }
    public function getVatValueAttribute()
    {
        return ($this->sub_total-$this->discount)*($this->vat/100);

    }
}

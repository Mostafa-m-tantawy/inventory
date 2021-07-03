<?php

namespace App\Models\crm;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Models\pos\OrderPayment;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use baseTrait, restaurantScopeTrait;

    public function payments()
    {

        return $this->hasMany(ClientAccount::class, 'client_id');

    }

    public function orderPayments()
    {

        return $this->hasMany(OrderPayment::class, 'client_id');

    }

    public function getHisMoneyAttribute()
    {

        return $this->payments()->sum('amount')-$this->orderPayments()->sum('amount');

    }

}

<?php

namespace App\Models\conf;

use App\Http\Traits\restaurantScopeTrait;
use App\Models\hr\HrEmployee;
use Illuminate\Database\Eloquent\Model;

class Safe extends Model
{use restaurantScopeTrait;
    public  function employee(){
        return $this->belongsTo(HrEmployee::class,'employee_id');
    }

    public function getActiveSafeAttribute(){
        $notTransferd=SafePayments::where('safe_id','<>',null)->where('status',0)->first();
        if($notTransferd==null ||$notTransferd->safe_id==$this->id)
       return true;

       return false;
    }

    public static function active(){
        $notTransferd=SafePayments::where('safe_id','<>',null)->where('status',0)->first();
        if($notTransferd)
       return $notTransferd->safe;

       return false;
    }
}

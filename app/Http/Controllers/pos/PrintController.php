<?php

namespace App\Http\Controllers\pos;

use App\Http\Controllers\Controller;
use App\Models\pos\Order;
use Illuminate\Http\Request;
use niklasravnsborg\LaravelPdf\Facades\Pdf as PDF;

class PrintController extends Controller
{
    public function __construct()
    {        $this->middleware(['module:sales']);

        $this->middleware(['permission:print department'],['only'=>['department']]);
        $this->middleware(['permission:print client'],['only'=>['client']]);
     }


    public function client($id){
        $order=Order::findOrFail($id);
        return view('pos.print.order_client')->with(compact('order'));


    }

    public function department($id,$department_id){
        $order=Order::with(['orderDetails'=>function($q)use($department_id){
            $q->WhereHas('dishSize',function($qq)use($department_id){
                $qq->WhereHas('dish',function($qqq)use($department_id){
                    $qqq->where('department_id',$department_id);
                });
            });
        }])->findOrFail($id);
        return view('pos.print.order_department')->with(compact('order'));

//        $pdf = PDF::loadView('pos.print.order_department', ['order'=>$order]);
//        return $pdf->download('invoice.pdf');
//        return view('pos.print.order_client')->with(compact('order'));

    }
}

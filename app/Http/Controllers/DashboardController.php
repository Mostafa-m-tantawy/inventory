<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\cost\Dish;
use App\Http\Traits\SyncDatabase;
use App\Models\pos\Order;
use App\Models\pos\OrderDetails;
use App\Models\inventory\Product;
use App\Models\inventory\Store;
use App\Models\State;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


use Mike42\Escpos\CapabilityProfile;
use Mike42\Escpos\PrintConnectors\DummyPrintConnector;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;
use Mike42\Escpos\Printer;

class DashboardController extends Controller
{
    public function __construct()
    {
//        $this->middleware(['permission:cost dashboard'],['only'=>['salesDashboard']]);
//        $this->middleware(['permission:hr dashboard'],['only'=>['hrDashboard']]);
//        $this->middleware(['permission:pos dashboard'],['only'=>['posDashboard']]);
//        $this->middleware(['permission:stock dashboard'],['only'=>['stockDashboard']]);
    }


    public function dashboard(Request $request)
    {

        return redirect()->action('DashboardController@stockDashboard');

    }
    public function salesDashboard(Request $request)
    {


        if($request->range) {
                // lenght 10 date = (01/01/2001) =10
                $from = substr($request->range, 0, 10);
                // start  13 date = (01/01/2001 */*)=13
                $to = substr($request->range, 13, 10);
            }else{

                // lenght 10 date = (01/01/2001) =10
                $from = \Carbon\Carbon::today()->format('Y-m-d');
                // start  13 date = (01/01/2001 */*)=13
                $to = \Carbon\Carbon::today()->format('Y-m-d');

            }

       ///  order  details
            $orders = Order::whereBetween('created_at', [$from.' 00:00:00', $to.' 23:59:59'])->get();
        $total = $orders->sum('grossTotal');
        $sup_total = $orders->sum('SupTotal');
        $vat = $orders->sum('vat');
        $service = $orders->sum('Service');;
        $coupon= $orders->sum('CouponValue');;
        $discount= $orders->sum('discount');;
        $delivery= $orders->sum('delivery');;

        ///top sales dishes
            $orderdetails= OrderDetails::select('dish_size_id', DB::raw('SUM(quantity) as total_points'))
                ->whereBetween('created_at', [$from.' 00:00:00', $to.' 23:59:59'])
                ->groupBy('dish_size_id')
                ->orderByDESC('total_points')
                ->get();


//dd($orderdetails[0]->dishSize);


        return view('veltrix.cost.salesDashboard')
            ->with(compact('total','sup_total',
            'vat','service','orderdetails',
            'from','to','delivery','discount','coupon'

            ));
    }

    public function stockDashboard(Request $request)
    {

        State::all();
        State::pluck('name','id');
        $state=State::where('country_id',1)->pluck('name','id');


        if($request->range) {
        // lenght 10 date = (01/01/2001) =10
        $from = substr($request->range, 0, 10);
        // start  13 date = (01/01/2001 */*)=13
        $to = substr($request->range, 13, 10);
    }else{

        // lenght 10 date = (01/01/2001) =10
        $from = \Carbon\Carbon::today()->format('Y-m-d');
        // start  13 date = (01/01/2001 */*)=13
        $to = \Carbon\Carbon::today()->format('Y-m-d');

    }


        $restaurant = Auth::user()->store;
        $payments = $restaurant->paySupplier()->whereDate('created_at', '>=',$from.' 00:00:00')
            ->whereDate('created_at', '<=',$to.' 23:59:59')->get();
        $purchases = $restaurant->purchases()->whereDate('created_at', '>=',$from.' 00:00:00')
            ->whereDate('created_at', '<=',$to.' 23:59:59')->get();
        $refunds = $restaurant->refunds()->whereDate('created_at', '>=',$from.' 00:00:00')
            ->whereDate('created_at', '<=',$to.' 23:59:59')->get();


        /// stock
        $products=Product::all()->filter(function ($value, $key) {
            return $value['quantity'] <= $value['reorder_point'];
        });

//        return view('frontend.stockDashboard')
        return view('veltrix.inventory.stockDashboard')
            ->with(compact('products','from','to','restaurant'
            ,'payments','purchases','refunds'

        ));;

    }
    public function hrDashboard(Request $request)
    {

        if($request->range) {
        // lenght 10 date = (01/01/2001) =10
        $from = substr($request->range, 0, 10);
        // start  13 date = (01/01/2001 */*)=13
        $to = substr($request->range, 13, 10);
    }else{

        // lenght 10 date = (01/01/2001) =10
        $from = \Carbon\Carbon::today()->format('Y-m-d');
        // start  13 date = (01/01/2001 */*)=13
        $to = \Carbon\Carbon::today()->format('Y-m-d');

    }
        return view('hr.hrDashboard') ->with(compact(
            'from','to'

        ));;

    }



    public function posDashboard(Request $request)
    {
       if($request->range) {
        // lenght 10 date = (01/01/2001) =10
        $from = substr($request->range, 0, 10);
        // start  13 date = (01/01/2001 */*)=13
        $to = substr($request->range, 13, 10);
    }else{
        // lenght 10 date = (01/01/2001) =10
        $from = \Carbon\Carbon::today()->format('Y-m-d');
        // start  13 date = (01/01/2001 */*)=13
        $to = \Carbon\Carbon::today()->format('Y-m-d');
    }

        $orders = Order::whereDate('created_at', '>=',$from.' 00:00:00')
            ->whereDate('created_at', '<=',$to.' 23:59:59')->get();

        $closedOrders=$orders->where('status','closed')->count();
        $openOrders=$orders->where('status','<>','closed')->count();

        $cash=$orders  ->sum('cash');;
        $credit_card=$orders  ->sum('CreditCard');;
        $check=$orders  ->sum('Check');;
        $account=$orders  ->sum('account');;
        $total_payment=$cash+$credit_card+$check+$account;


        $total = $orders->sum('grossTotal');
        $sup_total = $orders->sum('SupTotal');
        $vat = $orders->sum('vat');
        $service = $orders->sum('Service');;
        $coupon= $orders->sum('CouponValue');;
        $discount= $orders->sum('discount');;
        $delivery= $orders->sum('delivery');;

        return view('pos.dashboard') ->with(compact(
            'from','to','closedOrders','openOrders','orders',
            'check','cash','credit_card','account','delivery','total_payment',
            'sup_total','vat','service','coupon','total','discount'

        ));;

    }

    public function download(Request $request)
    {
        return response()->download($request->url);
    }


    public function changLang(Request $request)
    {
        $acceptLang = ['en','ar'];
        $lang = in_array($request->lang, $acceptLang) ? $request->lang : 'ar';

//        $request->session()->forget('lang');

        if($lang=='ar'){
            session(['lang' => 'ar']);
            App::setLocale('ar');


        }
        else{
            session(['lang' => 'en']);
            App::setLocale('en');


        }


        return back();

    }
    public function cashierDashboard()
    {


        return view('cashier.dashboard');

    }
}

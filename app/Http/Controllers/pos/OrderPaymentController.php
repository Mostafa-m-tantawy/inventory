<?php

namespace App\Http\Controllers\pos;

use App\Http\Controllers\Controller;
use App\Models\pos\Order;
use App\Models\pos\OrderPayment;
use App\Models\conf\Safe;
use App\Models\conf\SafePayments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;

class OrderPaymentController extends Controller
{
    public function __construct()
    {        $this->middleware(['module:sales']);

        $this->middleware(['permission:create order payment'], ['only' => ['store']]);
        $this->middleware(['permission:delete order payment'], ['only' => ['destroy']]);
    }

    /**
     * Display a listing payments .
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->range) {
            // lenght 10 date = (01/01/2001) =10
            $from = substr($request->range, 0, 10);
            // start  13 date = (01/01/2001 */*)=13
            $to = substr($request->range, 13, 10);
        } else {

            // lenght 10 date = (01/01/2001) =10
            $from = \Carbon\Carbon::today()->format('Y-m-d');
            // start  13 date = (01/01/2001 */*)=13
            $to = \Carbon\Carbon::today()->format('Y-m-d');

        }

        $payments = SafePayments::whereBetween('updated_at', [$from . ' 00:00:00', $to . ' 23:59:59'])->get();
        return view('veltrix.inventory.reports')->with(compact('payments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();

            $data = $request->all();
            $order = Order::findOrFail($request->order_id);
            $order->demand;
            $payment = new OrderPayment();

            if (round($request->amount) >= round($order->demand)) {
                $request['paid'] = $request->amount;
                $request['remaining'] = $request->amount - $order->demand;
                $request->amount = $order->demand;
            } else {
                $request['paid'] = $request->amount;
                $request['remaining'] = 0;

            }
            if ($payment->validate($data)) {

                $safe = Safe::where('employee_id', Auth::user()->employee->id)->first();
                if ($safe) {
                    if (Safe::active() == $safe || Safe::active() == false) {
                        $payment->store_id = Auth::user()->store->id;
                        $payment->employee_id = Auth::user()->employee->id;
                        $payment->order_id = $request->order_id;
                        $payment->amount = $request->amount;
                        $payment->remaining = $request->remaining;
                        $payment->paid = $request->paid;
                        $payment->method = $request->payment_method;
                        if ($payment->method == 'account') {
                            $payment->client_id = $request->client_id;
                        }

                        $payment->note = $request->note;
                        if ($payment->save()) {
                            $safePayment = new SafePayments;
                            $safePayment->store_id = Auth::user()->store->id;
                            $safePayment->amount = $request->amount;
                            $safePayment->remaining = $request->remaining;
                            $safePayment->paid = $request->paid;

                            $safePayment->paymentable_id = $request->order_id;
                            $safePayment->paymentable_type = Order::class;
                            $safePayment->employee_id = Auth::user()->employee->id;

                            $safePayment->safe_id = $safe->id;
                            $safePayment->method = $request->payment_method;
                            if ($safePayment->method == 'account') {
                                $safePayment->client_id = $request->client_id;
                            }
                            $safePayment->save();

                        }
                    } else {
                        return response()->json([__('main.Their is an other active Safe')], '422');
                    }
                } else {
                    return response()->json([__('main.Their is no active Safe Selected For This employee')], '422');
                }

            }
            DB::commit();
            return response()->json('ok', '200');


        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json($exception->getMessage(), '422');

        }


    }    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request,$id)
    {
        try {
            DB::beginTransaction();

            $orderPayment = OrderPayment::findOrFail($id);
            $payment = new OrderPayment();


            $order = Order::findOrFail($orderPayment->order_id);
          ;
            if (round($orderPayment->amount*-1) <= round($order->demand)) {

                if ($orderPayment) {

                $safe = Safe::where('employee_id', Auth::user()->employee->id)->first();
                if ($safe) {
                    if (Safe::active() == $safe || Safe::active() == false) {

                        $payment->store_id = Auth::user()->store->id;
                        $payment->employee_id = Auth::user()->employee->id;
                        $payment->order_id = $orderPayment->order_id;
                        $payment->amount = $orderPayment->amount *-1;
                        $payment->remaining = 0;
                        $payment->paid = $orderPayment->amount *-1;
                        $payment->method = $orderPayment->method;
                        if ($payment->method == 'account') {
                            $payment->client_id = $orderPayment->client_id;
                        }

                        $payment->note = 'refund order payments by'.$orderPayment->amount;
                        if ($payment->save()) {
                            $safePayment = new SafePayments;
                            $safePayment->store_id = Auth::user()->store->id;
                            $safePayment->amount = $orderPayment->amount*-1;
                            $safePayment->remaining = 0;
                            $safePayment->paid = $orderPayment->amount*-1;

                            $safePayment->paymentable_id = $orderPayment->order_id;
                            $safePayment->paymentable_type = Order::class;
                            $safePayment->employee_id = Auth::user()->employee->id;

                            $safePayment->safe_id = $safe->id;
                            $safePayment->method = $orderPayment->method;
                            if ($safePayment->method == 'account') {
                                $safePayment->client_id = $orderPayment->client_id;
                            }
                            $safePayment->save();

                        }
                    } else {
                        toastr()->error(__('main.Their is an other active Safe'));
                        return  redirect()->back();
                    }
                } else {
                    toastr()->error(__('main.Their is no active Safe Selected For This employee'));
                    return  redirect()->back();
                }
            }

            }else{   toastr()->error(__('toastr.amount more than order demand'));
                return  redirect()->back();
            }
            DB::commit();
            toastr()->success(__('toastr.record added successfully'));
            return  redirect()->back();

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
          return  redirect()->back();
        }


    }


    public static function refund($id)
    {
        $order = Order::findOrFail($id);

            $balance = $order->Payment;
            if ($balance > 0) {
                $safe = Safe::where('employee_id', Auth::user()->employee->id)->first();
                if ($safe) {
                    if (Safe::active() == $safe || Safe::active() == false) {

                        foreach ($order->payments as $orderPayment) {

                            $payment = new OrderPayment();
                            $payment->store_id = Auth::user()->store->id;
                            $payment->employee_id = Auth::user()->employee->id;
                            $payment->order_id = $id;
                            $payment->amount = $orderPayment->amount*-1;
                            $payment->remaining = 0;
                            $payment->paid =  $orderPayment->amount*-1;
                            $payment->method = $orderPayment->method;
                            if ($orderPayment->method == 'account') {
                                $payment->client_id = $orderPayment->client_id;
                            }
                            $payment->note = 'refund order payments by'.$orderPayment->amount;
                            if ($payment->save()) {
                                $safePayment = new SafePayments;
                                $safePayment->store_id = Auth::user()->store->id;
                                $safePayment->amount = $orderPayment->amount*-1;
                                $safePayment->remaining =0;
                                $safePayment->paid = $orderPayment->amount*-1;

                                $safePayment->paymentable_id = $id;
                                $safePayment->paymentable_type = Order::class;
                                $safePayment->employee_id = Auth::user()->employee->id;
                                $safePayment->safe_id = $safe->id;
                                $safePayment->method = $orderPayment->method;
                                if ($safePayment->method == 'account') {
                                    $safePayment->client_id = $orderPayment->client_id;
                                }
                                $safePayment->save();

                            }
                        }

                    } else {
                        return ['status'=>false,'message'=>__('main.Their is an other active Safe')];
                    }
                } else {
                    return ['status'=>false,'message'=>__('main.Their is no active Safe Selected For This employee')];
                }

            }else{
                return ['status'=>false,'message'=>__('main.No Balance to refund')];

            }
        return ['status'=>true,'message'=>'ok'];


    }

}

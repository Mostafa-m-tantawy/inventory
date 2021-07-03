<?php

namespace App\Http\Controllers\purchase;

use App\Http\Controllers\Controller;
use App\Models\inventory\Payment;
use App\Models\inventory\Store;
use App\Models\inventory\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:purchase']);
        $this->middleware(['permission:create stock payment'],['only'=>['savePayment']]);
        $this->middleware(['permission:delete stock payment'],['only'=>['deletePayment']]);
    }


    public function savePayment(Request $request)
    {
        try{
            DB::beginTransaction();
            $user = auth()->user();
            $restaurant = $user->store;
            $supplier=Supplier::findOrFail($request->get('receiver_id'));

            $pursesPayment = new Payment();
            $pursesPayment->store_id = Auth::user()->store->id;
            $pursesPayment->payment_amount = $request->get('payment');
            $pursesPayment->sender_id = Auth::user()->store->id;;
            $pursesPayment->sender_type = Store::class;
            $pursesPayment->receiver_id = $request->get('receiver_id');;
            $pursesPayment->receiver_type = Supplier::class;
            $pursesPayment->payment_method = $request->payment_method;
            $pursesPayment->note = $request->note;
            $pursesPayment->due_date = $request->due_date;

            if($pursesPayment->save()){
                supplierCalculates($supplier);
                restaurantCalculates($restaurant);

                if($request->hasfile('files')) {
                    $pursesPayment->upload($request->file('files'));
                }
            }
            DB::commit();
            toastr()->success(__('toastr.record added successfully'));
            return redirect()->back();

        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }

    }



    public  function deletePayment($id){
        try{
            DB::beginTransaction();
            Payment::destroy($id);
            DB::commit();


            toastr()->warning(__('toastr.record deleted successfully'));
            return redirect()->back();

        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());

            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }
    }


}

<?php

namespace App\Http\Controllers\purchase;

use App\Models\Country;
use App\Http\Controllers\Controller;
use App\Http\Requests\purchase\CreateSupplier;
use App\Models\inventory\Supplier;
use App\Models\inventory\Unit;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\Facades\DataTables;

class SupplierController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:purchase']);

        $this->middleware(['permission:index supplier'], ['only' => ['index']]);
        $this->middleware(['permission:create supplier'], ['only' => ['create', 'store']]);
        $this->middleware(['permission:update supplier'], ['only' => ['edit', 'update']]);
        $this->middleware(['permission:delete supplier'], ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suppliers = Supplier::all();
        return view('veltrix.purchase.supplier.index')->with(compact('suppliers'));
        //
    }


    public function datatableData()
    {
        $suppliers = Supplier::query();
        return DataTables::eloquent($suppliers)

            ->addColumn('name', function ($row) {
                return $row->user->name;
            })
            ->addColumn('email', function ($row) {
                return $row->user->email;
            })
            ->addColumn('action', function ($row) {
                $btn = '  <a href="' . url('stock/product/create/' . $row->id) . '"
                           title="products" class="btn btn-primary">' . trans('main.products') . '</a>
                         <a href="' . route('supplier.show', [$row->id]) . '" title="profile" class="btn btn-primary">
                               ' . trans('main.profile') . ' </a>';
                $btn .= '&nbsp;<a href="#" data-url="' . route('supplier.destroy', [$row->id]) . '"
                     class="btn btn-danger" title="' . trans('main.delete') . '" data-toggle="modal" data-target="#deleteModal"
              >' . trans('main.delete') . '</a>';

                return $btn;

            })
            ->rawColumns(['action'])
            ->orderColumns(['purchases_amount', 'refunds_amount', 'paid_amount','credit_amount'], '-:column $1')
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $countries = Country::all();
        return view('veltrix.purchase.supplier.create')->with(compact('countries'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateSupplier $request)
    {
        try {
            DB::beginTransaction();

            $user = new User;
            $user->email = $request->email;
            $user->name = $request->name;
            $user->password = Hash::make(1234);
            $user->store_id = Auth::user()->store->id;
//        $user->city_id = $request->city;
            $user->address = $request->address;
            $user->phone1 = $request->phone1;
            $user->phone2 = $request->phone2;
            $user->phone3 = $request->phone3;

            $user->save();


            $supplier = new Supplier();
            $supplier->start_balance = $request->balance;


            $supplier->user_id = $user->id;
            $supplier->store_id = Auth::user()->store->id;
            $supplier->save();

            DB::commit();

            toastr()->success(__('toastr.record added successfully'));
            return redirect(route('supplier.index'));

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }


        //
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $supplier = Supplier::findOrFail($id);
        $payments = $supplier->payment;
        $countries = Country::all();


        return view('veltrix.purchase.supplier.show')
            ->with(compact('payments', 'supplier', 'countries'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(CreateSupplier $request, $id)
    {
        try {
            DB::beginTransaction();

            $supplier = Supplier::findOrFail($id);
            $user = $supplier->user;

            $supplier->start_balance = $request->balance;
            $supplier->save();

            $user->email = $request->email;
            $user->name = $request->name;
            $user->address = $request->address;
//        $user->city_id = $request->city;
            $user->phone1 = $request->phone1;
            $user->phone2 = $request->phone2;
            $user->phone3 = $request->phone3;
            $user->save();


            DB::commit();

            toastr()->success(__('toastr.record updated successfully'));

            return redirect()->back();

        } catch (\Exception $exception) {

            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();
            $supplier = Supplier::findOrFail($id);
            if ($supplier->canDeleted) {
                User::destroy($supplier->user_id);
                $supplier->delete();
            } else {
                $error = 'supplier has payments or purchases!';
                return redirect()->back()->withErrors($error);
            }
            DB::commit();

            toastr()->warning(__('toastr.record deleted successfully'));
            return redirect()->back();

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());

            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }


    }

    public function printFinancial($id)
    {
        $supplier = Supplier::findOrFail($id);
        $payments = $supplier->payment;


        return view('veltrix.purchase.supplier.print.financial_report')
            ->with(compact('payments', 'supplier'));
    }

}

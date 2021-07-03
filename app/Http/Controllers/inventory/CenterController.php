<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\Center;
use App\Models\inventory\Department;
use App\Http\Controllers\Controller;
use App\Http\Requests\inventory\CreateCenter;
use App\Models\inventory\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CenterController extends Controller
{
    public function __construct()
    {    $this->middleware(['module:inventory']);

//        $this->middleware(['permission:index department'],['only'=>['index']]);
//        $this->middleware(['permission:create department'],['only'=>['create','store']]);
//        $this->middleware(['permission:update department'],['only'=>['edit','update']]);
//        $this->middleware(['permission:show department'],['only'=>['show']]);
//        $this->middleware(['permission:stock department'],['only'=>['stock']]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $centers=Center::all();
        return  view('veltrix.inventory.center.index')->with(compact('centers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateCenter $request)
    {
        try{
            DB::beginTransaction();
            $center=new center();
            $center->name=$request->name;
            $center->description=$request->description;
            $center->store_id=Auth::user()->store->id;
            $center->save();

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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $center= Center::findOrFail($id);
        $products=Product::whereHas('stocks',function ($q)use($center){
                $q->where('stockable_id',$center->id)->where('stockable_type',Center::class);
        })
            ->with(['stocks'=>function($q)use($center){
            $q->where('stockable_id',$center->id)->where('stockable_type',Center::class);
        }])
            ->get();
        return view('veltrix.inventory.center.show')->with(compact('products','center'));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        try{
            DB::beginTransaction();

            $center= Center::findOrFail($id);
            $center->name=$request->name;
            $center->description=$request->description;
            $center->save();

            DB::commit();
            toastr()->success(__('toastr.record updated successfully'));

            return redirect()->back();

        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());

            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function stock(Request $request)
    {
        $restaurant=Auth::user()->store;
        $departments=$restaurant->departments;
        if( $request->isMethod('post')){
           $department=Department::findOrFail($request->department_id);
            $products=Product::whereHas('assignDetails',function ($q)use($department){
                $q->whereHas('assignHeader',function ($qq)use($department){

                    $qq->where('assignable_id',$department->id)->where('assignable_type',Department::class);
                });
            })->get();
            return view('veltrix.inventory.department.stock')->with(compact('department','departments','products'));
        }
        return view('veltrix.inventory.department.stock')->with(compact('departments'));;
    }
}

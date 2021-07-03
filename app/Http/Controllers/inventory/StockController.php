<?php

namespace App\Http\Controllers\inventory;

use App\Http\Controllers\Controller;
use App\Models\inventory\Store;
use App\Models\inventory\Stock;
use App\Models\inventory\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class StockController extends Controller
{
    public function __construct()
    {    $this->middleware(['module:inventory']);

        $this->middleware(['permission:stock restaurant'],['only'=>['index']]);
    }

    /**
     * Current stock
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {

        $store_id=Auth::user()->store->id;

        $stocks=Stock::where('stockable_type',Store::class)
            ->where('stockable_id',$store_id)->with('product')->get();
            return view('veltrix.inventory.stock.index')->with(compact('stocks'));
    }



    public function datatableData(Request $request)
    {
        $store_id=Auth::user()->store->id;
        $stocks=Stock::where('stockable_type',Store::class)->where('stockable_id',$store_id);
        return DataTables::eloquent($stocks)
            ->filter(function ($query) use ($request) {
                if (!is_numeric($request->search['value'])) {

                    $query->where(function ($q) use ($request) {

                        $q ->orWhereHas('product', function ($qq) use ($request) {
                                $qq->where(getAttrName('name'), 'like', "%" . $request->search['value'] . "%");
                            });

                    });
                } else {
                    $query->where(function ($q) use ($request) {
                        $q->orWhere('cost', $request->search['value'])
                            ->orWhere('quantity', $request->search['value']);

                    });
                }
            })
            ->editColumn('product_id', function ($row) {
           return $row->product->lang_name;
            })
            ->orderColumns(['cost','quantity'], '-:column $1')
            ->make(true);
    }



}

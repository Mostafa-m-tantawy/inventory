<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\AssignStockDetails;
use App\Models\inventory\Department;
use App\Exports\DishGuideExport;
use App\Exports\ProductGuide;
use App\Http\Controllers\Controller;
use App\Http\Requests\ImportDishes;
use App\Http\Requests\inventory\CreateProduct;
use App\Imports\DishesImport;
use App\Imports\ProductImport;
use App\Models\inventory\Product;
use App\Models\inventory\ProductCategory;
use App\Models\inventory\PursesProduct;
use App\Models\inventory\RefundProduct;
use App\Models\inventory\RuinedProduct;
use App\Models\inventory\Supplier;
use App\Models\conf\SystemConf;
use App\Models\inventory\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use PHPUnit\Exception;
use Yajra\DataTables\Facades\DataTables;

class ProductDataTablesController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:inventory']);
    }


    public function purchasingDatatableData(Request $request)
    {
        $products = PursesProduct::where('product_id',$request->product_id);

        return DataTables::eloquent($products)
            ->addColumn('supplier', function ($row) {
                return ($row->purse->supplier->user->name);
            })
            ->orderColumns(['unit_price','vat', 'total', 'quantity'], '-:column $1')
            ->toJson();
    }



   public function ruinedDatatableData(Request $request)
    {
        $products = RuinedProduct::where('product_id',$request->product_id);

        return DataTables::eloquent($products)
            ->addColumn('from', function ($row) {
                return ($row->ruinedHeader->ruinedable->name);
            })
            ->orderColumns(['price_unit','note', 'total', 'quantity'], '-:column $1')
            ->toJson();
    }
   public function refundedDatatableData(Request $request)
    {
        $products = RefundProduct::where('product_id',$request->product_id);

        return DataTables::eloquent($products)
            ->addColumn('supplier', function ($row) {
                return ($row->supplier->name);
            })
            ->orderColumns(['unit_price','note', 'total', 'vat', 'quantity'], '-:column $1')
            ->toJson();
    }


    public function assignmentDatatableData(Request $request)
    {
        $products = AssignStockDetails::where('product_id',$request->product_id);

        return DataTables::eloquent($products)
            ->addColumn('sourceable', function ($row) {
                return ($row->assignHeader->sourceable->name);
            })
            ->addColumn('assignable', function ($row) {
                return ($row->assignHeader->assignable->name);
            })
            ->editColumn('product_id', function ($row) {
                return ($row->product->lang_name);
            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y H:i');
            })

            ->orderColumns([ 'created_at', 'quantity'], '-:column $1')
            ->toJson();
    }
}

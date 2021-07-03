<?php

namespace App\Http\Controllers\inventory;

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

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:inventory']);

        $this->middleware(['permission:index product'], ['only' => ['index']]);
        $this->middleware(['permission:create product'], ['only' => ['create', 'store']]);
        $this->middleware(['permission:update product'], ['only' => ['update', 'edit']]);
        $this->middleware(['permission:show product'], ['only' => ['show']]);
        $this->middleware(['permission:delete product'], ['only' => ['destroy']]);
        $this->middleware(['permission:attach product to supplier'], ['only' => ['products']]);
        $this->middleware(['permission:detach product to supplier'], ['only' => ['deleteProduct']]);
    }


    public function index()
    {

        $categories = ProductCategory::all();
        $units = Unit::all();
        return view('veltrix.inventory.products.index')->with(compact('categories', 'units'));
    }

    public function updateAllProducts()
    {
        $products = Product::all();
        foreach ($products as $product) {
            ProductCalculates($product);
        }
    }

    public function datatableData(Request $request)
    {
        $products = Product::with(['category', 'unit']);


        return DataTables::eloquent($products)
            ->filter(function ($query) use ($request) {
                if (!is_numeric($request->search['value'])) {

                    $query->where(function ($q) use ($request) {

                        $q->orWhere(getAttrName('name'), 'like', "%" . $request->search['value'] . "%")
                            ->orWhereHas('category', function ($q) use ($request) {
                                $q->where(getAttrName('name'), 'like', "%" . $request->search['value'] . "%");
                            })
                            ->orWhereHas('unit', function ($q) use ($request) {
                                $q->where('unit', 'like', "%" . $request->search['value'] . "%");
                            });
                    });
                } else {
                    $query->where(function ($q) use ($request) {
                        $q->orWhere('reorder_point', $request->search['value'])
                            ->orWhere('barcode', $request->search['value'])
                            ->orWhere('cost', $request->search['value'])
                            ->orWhere('quantity', $request->search['value']);
                    });
                }
            })
            ->orderColumn('name', function ($query, $order) {
                $query->orderBy(getAttrName('name'), $order);
            })
            ->orderColumn('category', function ($query, $order) {
                $query->orderBy('product_category_id', $order);
            })->orderColumn('unit', function ($query, $order) {
                $query->orderBy('unit_id', $order);
            })
            ->addColumn('category', function ($row) {
                return ($row->category->lang_name);
            })
            ->addColumn('name', function ($row) {
                return ($row->lang_name);
            })
            ->addColumn('unit', function ($row) {
                return ($row->unit->unit);
            })
            ->addColumn('is_prepared', function ($row) {
                $btn = trans('main.no');
                if ($row->is_prepared) {
                    $btn = '
                <a class="btn btn-secondary" href="' . url('stock/product/recipe/' . $row->id) . '">' . trans('main.Recipe') . '</a>
                <a class="btn btn-primary" href="' . url('stock/product/prepare/create/' . $row->id) . '">' . trans('main.Cook') . '</a>
                                           ';
                }
                return $btn;
            })
            ->addColumn('action', function ($row) {
                $btn = ' <a href="' . url('stock/product/' . $row->id) . '"   class="btn btn-warning">' . trans('main.show') . '</a>
                &nbsp;<a href="#"
                   title="update" class="btn btn-info"
                   data-toggle="modal" data-target=".bd-example-modal-lg"
                   data-id="' . $row->id . '"
                   data-name="' . $row->name . '"
                   data-name_ar="' . $row->name_ar . '"
                   data-unit="' . $row->unit_id . '"
                   data-is_stockable="' . $row->is_stockable . '"
                   data-category="' . $row->product_category_id . '"
                   data-is_prepared="' . $row->is_prepared . '"
                   data-barcode="' . $row->barcode . '"
                   data-reorder="' . $row->reorder_point . '" >' . trans('main.edit') . '</a>';
                return $btn;

            })
            ->rawColumns(['action', 'is_prepared'])
            ->orderColumns(['reorder_point', 'barcode', 'cost', 'quantity'], '-:column $1')
            ->toJson();
    }


    public function create()
    {
        $categories = ProductCategory::all();
        $units = Unit::all();

        return view('veltrix.inventory.products.create')->with(compact('categories', 'units'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProduct $request)
    {
        try {
            DB::beginTransaction();

            $product = new Product();
            $product->store_id = Auth::user()->store->id;
            $product->name = $request->name;
            $product->name_ar = $request->name_ar;
            $product->barcode = $request->barcode;
            $product->reorder_point = $request->reorder_point;
            $product->is_prepared = $request->is_prepared;

            if ($request->is_stockable == 'on') {

                $product->is_stockable = 1;
            } else {
                $product->is_stockable = 0;

            }
            $product->product_category_id = $request->category;
            $product->unit_id = $request->unit;
            $product->save();

            DB::commit();

            toastr()->success(__('toastr.record added successfully'));
            return redirect()->back();

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }

    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::findOrFail($id);
        try {

            $restaurant = Auth::user()->store;
            $departments = Department::all();

            if ($product->is_prepared)
                $purchases = $product->prepared;
            else
                $purchases = $product->purchasedProduct;

            $cookes = $product->cooked->where('cookable_type', Product::class);

            $purchased = $purchases->sum('quantity');
            $cooked = $cookes->sum('quantity');
            $assign_to_me = $product->assginedToMe($restaurant);
            $assign_to_other = $product->assginedToOthers($restaurant);
            $refund = $product->refund->sum('quantity');
            $open = $product->openStockProduct->sum('quantity');
            $ruind = $product->ruinedFromMe($restaurant);

            return view('veltrix.inventory.products.show')
                ->with(compact('product', 'departments','open',
                     'assign_to_me', 'assign_to_other', 'refund', 'ruind',

                    'purchased', 'cooked'));


        } catch (\Exception $exception) {
            \Log::debug($exception->getMessage());
            toastr()->error('internal error please try again later!');
            return redirect()->back();

        }

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
    public function update(CreateProduct $request)
    {
        DB::beginTransaction();

        try {
            $product = Product::findOrFail($request->id);
            $product->name = $request->name;
            $product->name_ar = $request->name_ar;
            $product->barcode = $request->barcode;
            $product->reorder_point = $request->reorder_point;

            if ($request->is_stockable == 'on') {

                $product->is_stockable = 1;
            } else {
                $product->is_stockable = 0;

            }
            $product->product_category_id = $request->category;
            $product->unit_id = $request->unit;
            $product->is_prepared = $request->is_prepared;
            $product->save();
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
        //
    }


    public function products(Request $request, $supplier_id)
    {
        $supplier = Supplier::findOrFail($supplier_id);

        if ($request->product_g) {
            foreach ($request->product_g as $newproduct) {

                $supplier->products()->syncWithoutDetaching([$newproduct['product'] => ['vat' => $newproduct['vat']]]);
            }

        }
        $products = Product::where('is_prepared', 0)->get();
        $units = Unit::all();
        return view('veltrix.purchase.supplier.products')
            ->with(compact('units', 'products', 'supplier'));
    }


    public function deleteProduct($id, $supplier_id)
    {
        $product = Product::findOrFail($id);
        $product->supplier()->detach($supplier_id);
        return redirect()->back();
    }


    public function getProductQuantity(Request $request, $id)
    {
        if ($request->type == 'restaurant') {

            $quantity = Product::findOrFail($id)->MainStoreQuantity(Auth::user()->store);

        } else {

            $department = Department::findOrFail($request->id);

            $quantity = Product::findOrFail($id)->departmentquantity($department);

        }

        return response()->json($quantity, 200);

    }


    public function import(ImportDishes $request)
    {

        try {

            $productImport = new ProductImport();

            Excel::import($productImport, request()->file('excel'));
            toastr()->success(__('toastr.record added successfully'));

            return redirect()->back()->with(['excel_errors' => $productImport->failedRules]);


        } catch (\Exception $e) {
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();
        }


    }


    public function ExportGuide()
    {
        return Excel::download(new ProductGuide(), 'Product Guide.xlsx');
    }

}

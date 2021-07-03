<?php

namespace App\Http\Controllers\inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\inventory\CreateProductCategory;
use App\Models\inventory\ProductCategory;
use App\Models\inventory\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;
use Yajra\DataTables\Facades\DataTables;

class ProductCategoryController extends Controller
{

    public function __construct()
    {
        $this->middleware(['module:inventory']);

        $this->middleware(['permission:index product category'], ['only' => ['index']]);
        $this->middleware(['permission:create product category'], ['only' => ['create', 'store']]);
        $this->middleware(['permission:update product category'], ['only' => ['update', 'edit']]);
        $this->middleware(['permission:delete product category'], ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = ProductCategory::all();
        return view('veltrix.inventory.product_category.index')->with(compact('categories'));
    }


    public function datatableData()
    {
        $categories = ProductCategory::query();
        return DataTables::eloquent($categories)
            ->filter(function ($query)  {
                    $query->where(function ($q)  {
                        $q->orWhere(getAttrName('name'), 'like', "%" . request()->search['value'] . "%");
                        $q->orWhere('description', 'like', "%" . request()->search['value'] . "%");
                    });
                })
                ->addColumn('name', function ($row) {
                return ($row->lang_name);
            })
            ->addColumn('description', function ($row) {
                return ($row->description);
            })
            ->addColumn('action', function ($row) {

                $btn = '&nbsp;<a href="#"
                   title="update" class="btn btn-info"
                                           data-toggle="modal" data-target=".bd-example-modal-lg"
                                           data-name_ar="' . $row->name_ar . '"
                                           data-name="' . $row->name . '"
                                           data-id="' . $row->id . '"
                                           data-description="' . $row->description . '"

              >' . trans('main.edit') . '</a>';
                $btn .= '&nbsp;<a href="#" data-url="' . route('product-category.destroy', [$row->id]) . '"
                     class="btn btn-danger" title="' . trans('main.delete') . '" data-toggle="modal" data-target="#deleteModal"
              >' . trans('main.delete') . '</a>';

                return $btn;

            })
            ->rawColumns(['action'])
            ->orderColumns(['description'], '-:column $1')
            ->make(true);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateProductCategory $request)
    {

        try {
            DB::beginTransaction();


            $category = new ProductCategory;
            $category->store_id = Auth::user()->store->id;
            $category->name = $request->name;
            $category->name_ar = $request->name_ar;
            $category->description = $request->description;
            $category->save();

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
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(CreateProductCategory $request)
    {
        try {
            DB::beginTransaction();

            $category = ProductCategory::findOrFail($request->id);
            $category->name = $request->name;
            $category->name_ar = $request->name_ar;
            $category->description = $request->description;
            $category->save();
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
            $category = ProductCategory::findOrFail($id);
            if ($category->canDeleted) {
                $category->delete();

            } else {
                $error = 'category has products!';
                toastr()->error(__('toastr.Error!! please try again'));
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
}

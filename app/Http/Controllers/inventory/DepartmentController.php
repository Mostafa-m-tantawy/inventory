<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\Department;
use App\Models\pos\Hall;
use App\Http\Controllers\Controller;
use App\Http\Requests\inventory\createDepartment;
use App\Models\inventory\Product;
use App\Models\inventory\Stock;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class DepartmentController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:inventory']);
        $this->middleware(['permission:index department'], ['only' => ['index']]);
        $this->middleware(['permission:delete department'], ['only' => ['destroy']]);
        $this->middleware(['permission:create department'], ['only' => ['create', 'store']]);
        $this->middleware(['permission:update department'], ['only' => ['edit', 'update']]);
        $this->middleware(['permission:show department'], ['only' => ['show']]);
        $this->middleware(['permission:stock department'], ['only' => ['stock']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $restaurant = Auth::user()->store;
        $departments = Department::all();
        return view('veltrix.inventory.department.index')->with(compact('restaurant', 'departments'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return DataTables
     */
    public function datatableData()
    {
        $departments = Department::query();
        return DataTables::eloquent($departments)

            ->addColumn('action', function ($row) {

                $btn = '&nbsp;<a href="' . url('stock/department/' . $row->id) . '"   class="btn btn-warning"
                    title="' . trans('main.show') . '">' . trans('main.show') . '</a>';

                $btn .= '&nbsp;<a href="#" data-url="' . route('department.destroy', [$row->id]) . '"
                     class="btn btn-danger" title="' . trans('main.delete') . '" data-toggle="modal" data-target="#deleteModal" >'
                    . trans('main.delete') . '</a>';

                return $btn;

            })
            ->rawColumns(['action'])
            ->orderColumns(['name', 'description'], '-:column $1')
            ->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('veltrix.inventory.department.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(createDepartment $request)
    {

        try {
            DB::beginTransaction();

            $department = new Department();
            $department->name = $request->name;
            $department->description = $request->description;
            $department->center_id = 1;
            $department->save();

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
        $department = Department::findOrFail($id);
        $stocks = Stock::
        where('stockable_type', Department::class)
            ->where('stockable_id', $department->id)
            ->get();

        return view('veltrix.inventory.department.show')->with(compact('stocks', 'department'));

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
    public function update(createDepartment $request, $id)
    {
        try {
            DB::beginTransaction();

            $department = Department::findOrFail($id);
            $department->name = $request->name;
            $department->description = $request->description;
            $department->save();
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

            $department = Department::findOrFail($id);
            if ($department->canDeleted) {
                $department->delete();
            } else {
                toastr()->error(__('toastr.Error!! please try again'));
                return back();
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


    public function stock(Request $request)
    {
        $restaurant = Auth::user()->store;
        $departments = $restaurant->departments;
        if ($request->isMethod('post')) {
            $department = Department::findOrFail($request->department_id);
            $products = Product::whereHas('assignDetails', function ($q) use ($department) {
                $q->whereHas('assignHeader', function ($qq) use ($department) {

                    $qq->where('assignable_id', $department->id)->where('assignable_type', Department::class);
                });
            })->get();
            return view('veltrix.inventory.department.stock')->with(compact('department', 'departments', 'products'));
        }
        return view('veltrix.inventory.department.stock')->with(compact('departments'));;
    }
}

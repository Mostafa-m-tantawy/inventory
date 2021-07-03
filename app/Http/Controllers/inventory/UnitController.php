<?php

namespace App\Http\Controllers\inventory;

use App\Http\Controllers\Controller;
use App\Http\Requests\inventory\CreateUnit;
use App\Models\inventory\Department;
use App\Models\inventory\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class UnitController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:inventory']);

        $this->middleware(['permission:index unit'], ['only' => ['index']]);
        $this->middleware(['permission:create unit'], ['only' => ['create', 'store']]);
        $this->middleware(['permission:update unit'], ['only' => ['edit', 'update']]);
        $this->middleware(['permission:delete unit'], ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $units = Unit::all();
        return view('veltrix.inventory.unit.index')->with(compact('units'));
    }


    public function datatableData()
    {
        $units = Unit::query();
        return DataTables::eloquent($units)

            ->addColumn('action', function ($row) {

                $btn = '&nbsp;<a href="#"
                   title="update" class="btn btn-info"
                                           data-toggle="modal" data-target=".bd-example-modal-lg"
                                           data-unit="'.$row->unit.'"
                                           data-id="'.$row->id.'"
                                           data-child="'.$row->child_unit.'"
                                           data-convert_rate="'.$row->convert_rate.'"

              >' . trans('main.edit') . '</a>';
                $btn .= '&nbsp;<a href="#" data-url="' . route('unit.destroy', [$row->id]) . '"
                     class="btn btn-danger" title="' . trans('main.delete') . '" data-toggle="modal" data-target="#deleteModal"
              >' . trans('main.delete') . '</a>';

                return $btn;

            })
            ->rawColumns(['action'])
            ->orderColumns(['unit','convert_rate','child_unit'], '-:column $1')
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
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateUnit $request)
    {
        try {
            DB::beginTransaction();
            $uint = new Unit();
            $uint->store_id = Auth::user()->store->id;
            $uint->unit = $request->unit;
            $uint->child_unit = $request->child_unit;
            $uint->convert_rate = $request->convert_rate;
            $uint->save();

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
        //
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
    public function update(Request $request, $id)
    {
        try {
            DB::beginTransaction();

            $uint = Unit::findOrFail($id);
            $uint->unit = $request->unit;
            $uint->child_unit = $request->child_unit;
            $uint->convert_rate = $request->convert_rate;
            $uint->save();
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
            $unit = Unit::findOrFail($id);
            if (!$unit->products->count() > 0) {
                $unit->delete();
            } else {
                $error = 'unit has products!';
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

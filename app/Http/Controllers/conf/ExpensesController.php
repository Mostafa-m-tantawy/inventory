<?php

namespace App\Http\Controllers\conf;

use App\Models\conf\Expense;
use App\Http\Controllers\Controller;
use App\Http\Requests\conf\CreateExpensesRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ExpensesController extends Controller
{
    public function __construct()
    {        $this->middleware(['module:sales']);

        $this->middleware(['permission:index expense'],['only'=>['index']]);
        $this->middleware(['permission:create expense'],['only'=>['create','store']]);
//        $this->middleware(['permission:update expense'],['only'=>['edit','update']]);
        $this->middleware(['permission:delete expense'],['only'=>['destroy']]);
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $expenses = Expense::all();
        return view('veltrix.config.expense.index')->with(compact('expenses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('veltrix.config.expense.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreateExpensesRequest $request)
    {


        $expenses = new Expense();
        $expenses->store_id = Auth::user()->store->id;
        $expenses->payment_method = $request->payment_method;
        $expenses->payment_amount = $request->payment_amount;
        $expenses->note = $request->note;

        if ($request->payment_method == 'check') {
            $expenses->due_date = $request->duedate;

        }
        if ($expenses->save()) {

            if ($request->hasfile('files')) {
                $expenses->upload($request->file('files'));
            }
        }
        return redirect()->back();
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Expense::destroy($id);
        return  redirect()->back();
    }
}

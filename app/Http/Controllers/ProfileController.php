<?php

namespace App\Http\Controllers;

use App\Models\inventory\Department;
use App\Models\hr\HrAttendance;
use App\Models\hr\HrEmployee;
use App\Models\hr\HrPayroll;
use App\Models\conf\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    public function __construct()
    {
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $employee=Auth::user();

        return view('profile')->with(compact('employee'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */

    public function update(Request $request)
    {
        $user=Auth::user();


        $request->validate([
            'phone1' =>     ['required' , 'numeric'],
            'phone2' =>     ['nullable' , 'numeric'],
            'phone3' =>     ['nullable' ,'numeric'],
            'address' =>    ['nullable', 'string', 'max:255',]
            ,]);


        $user->address = $request->address;
        $user->phone1 = $request->phone1;
        $user->phone2 = $request->phone2;
        $user->phone3 = $request->phone3;
        $user->save();

        return redirect()->back();

    }
}

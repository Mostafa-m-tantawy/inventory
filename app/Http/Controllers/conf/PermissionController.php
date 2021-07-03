<?php

namespace App\Http\Controllers\conf;

use App\Http\Controllers\Controller;
use App\Http\Requests\conf\CreatePermissionRequest;
use App\Models\conf\Permission;
use App\Models\conf\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PermissionController extends Controller
{

    public function __construct()
    {
        $this->middleware(['permission:index Permission'],['only'=>['index']]);
        $this->middleware(['permission:create Permission'],['only'=>['create','store']]);
        $this->middleware(['permission:update Permission'],['only'=>['edit','update']]);
        $this->middleware(['permission:delete Permission'],['only'=>['destroy']]);
        $this->middleware(['permission:associate Permission role'],['only'=>['association']]);
        $this->middleware(['permission:dissociate Permission role'],['only'=>['dissociation']]);
    }



    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $permissions=Permission::all();
        return  view('veltrix.config.permission.permission.index')->with(compact('permissions'));
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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePermissionRequest $request)
    {

        $permission = Permission::create([
            'name' => $request->name]);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $permission= Permission::findOrFail($id);
        $roles=Role::all();
//        dd($permission->roles,$roles);
        return view('veltrix.config.permission.permission.show')->with(compact('permission','roles'));
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
    public function update(CreatePermissionRequest $request, $id)
    {
        $role = Permission::whereId($id)->update([
            'name' => $request->name]);

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $permission=Permission::findOrFail($id);

        if($permission->roles->count()>0);
        {
            return redirect()->back()->withErrors('Permission has roles!');
        }
        return redirect()->back();

    }    /**
     * association.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function association(Request $request)
    {
        $permission=Permission::findOrFail($request->permission_id);
        $permission->roles()->syncWithoutDetaching($request->role_id);

        return redirect()->back();
    }
    public function dissociation(Request $request,$id)
    {
        $permission=Permission::findOrFail($request->permission_id);
        $permission->roles()->detach($id);

        return redirect()->back();
    }
}

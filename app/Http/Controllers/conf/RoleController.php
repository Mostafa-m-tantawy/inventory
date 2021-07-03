<?php

namespace App\Http\Controllers\conf;

use App\Models\hr\Asset;
use App\Http\Controllers\Controller;
use App\Http\Requests\conf\CreateRoleRequest;
use App\Models\conf\Permission;
use App\Models\conf\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoleController extends Controller
{

    public function __construct()
    {
        $this->middleware(['permission:index role'],['only'=>['index']]);
        $this->middleware(['permission:create role'],['only'=>['create','store']]);
        $this->middleware(['permission:update role'],['only'=>['edit','update']]);
        $this->middleware(['permission:delete role'],['only'=>['destroy']]);
        $this->middleware(['permission:associate role employee'],['only'=>['association']]);
        $this->middleware(['permission:dissociate role employee'],['only'=>['dissociation']]);
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $roles=Role::all();
        return  view('veltrix.config.permission.role.index')->with(compact('roles'));
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
    public function store(CreateRoleRequest $request)
    {


        $role = Role::create([
            'store_id'=>Auth::user()->store->id,
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
        $role= Role::findOrFail($id);
        $permissions=Permission::all()->groupBy('group');
        $rolePermissions=$role->permissions;
//       dd($rolePermissions);
       return view('veltrix.config.permission.role.role_permission')
            ->with(compact('role','permissions','rolePermissions'));

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
    public function update(CreateRoleRequest $request, $id)
    {
        $role = Role::whereId($id)->update([
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
        $role=Role::findOrFail($id);

        if($role->permissions->count()>0);
        {
            return redirect()->back()->withErrors('role has permissions!');
        }
        return redirect()->back();
    }


    public function association(Request $request)
    {
        $role=Role::findOrFail($request->role_id);
        $role->permissions()->sync($request->permission_id);

        return redirect()->back();
    }


    public function dissociation(Request $request,$id)
    {
        $role=Role::findOrFail($request->role_id);
        $role->permissions()->detach($id);

        return redirect()->back();
    }



}

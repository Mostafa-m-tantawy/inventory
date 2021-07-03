<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddLabelRequest;

class LabelsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $labels = collect(trans('main'));


        unset($labels['new_label']);

       return view('labels.index',compact('labels'));
    }

    /**
     * Show the form for creating a settings resource.
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
    public function store(AddLabelRequest $request)
    {
        $languages = [
            'en',
            'ar'
        ];

        foreach ($languages as $language){

           $request_request = ($request->name);
           $request_value = ($request->value);

           file_put_contents(resource_path("lang/".$language."/main.php"),

               str_replace("'new_label'=>'new_label'","'{$request_request}'=>'{$request_value}',\n'new_label'=>'new_label'",
                   file_get_contents(resource_path("lang/".$language."/main.php"))));
       }

      session()->flash('success','Label added successfully.');

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($label_key)
    {

        $label_value = trans('main')[$label_key];
        return response()->json([
            'name' => $label_key,
            'value' => $label_value]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(AddLabelRequest $request, $label_value)
    {
        $language =app()->getLocale();

       file_put_contents(resource_path("lang/".$language."/main.php"),

           str_replace($label_value,$request->value,
               file_get_contents(resource_path("lang/".$language."/main.php"))));

       session()->flash('success','Label updated successfully.');

        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Label $label)
    {
        if($label->delete()){
            session()->flash('success','Label deleted successfully.');
        }
        else{
            session()->flash('error','error occurred with deleting label.');
        }
        return back();
    }
}

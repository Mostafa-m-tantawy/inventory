<?php

namespace App\Http\Requests\purchase;

use App\Supplier;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateSupplier extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {


        $id=$this->route()->parameter('supplier');
        $supplier=0;
        if($id) {
            $supplier = \App\Models\inventory\Supplier::findOrFail($id);
       if($supplier)
           $supplier =   $supplier->user_id;
      }


        return [
            'name' => ['required', 'string', 'max:255',
                Rule::unique('users','name')->where('store_id',Auth::user()->store_id)->ignore($supplier)],
            'email' => ['required', 'string', 'email', 'max:255',
                Rule::unique('users','email')->where('store_id',Auth::user()->store_id)->ignore($supplier)],

            'phone1' => ['required', 'numeric',],
            'phone2' => ['nullable', 'numeric',],
            'phone3' => ['nullable', 'numeric',],
            'address' => ['nullable', 'string', 'max:255',]
        ];
    }
}

<?php

namespace App\Http\Requests\inventory;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateProduct extends FormRequest
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
        $update_id='';
        $update_name_ar='';
        $barcode_id='';
        if(request()->id) {
            $update_id .= ',name,' . request()->id;
            $update_name_ar .= ',name_ar,' . request()->id;
            $barcode_id .= ',barcode,' . request()->id;
        }

        return [
            'name'              => ['required', 'string', 'max:255',
                Rule::unique('products','name')->where('store_id',Auth::user()->store_id)->ignore(request()->id)],
            'name_ar'           => ['nullable', 'string', 'max:255',
                Rule::unique('products','name_ar')->where('store_id',Auth::user()->store_id)->ignore(request()->id)],
            'description'       => ['nullable', 'string', 'max:255'],
            'barcode'           => ['nullable', 'string', 'max:255',
                Rule::unique('products','barcode')->where('store_id',Auth::user()->store_id)->ignore(request()->id)],
            'reorder_point'     => ['nullable', 'numeric'],
            'category'=> ['required'],
            'unit'           => ['required'],
            'is_prepared'           => ['required'],
        ];
    }
}

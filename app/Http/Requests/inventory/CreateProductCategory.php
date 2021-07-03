<?php

namespace App\Http\Requests\inventory;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateProductCategory extends FormRequest
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

        return [
            'name' => ['required', 'string', 'max:255',
                Rule::unique('product_categories', 'name')->where('store_id', Auth::user()->store_id)->ignore(request()->id)],

            'name_ar' => ['nullable', 'string', 'max:255',
                Rule::unique('product_categories', 'name_ar')->where('store_id', Auth::user()->store_id)->ignore(request()->id)],
            'description' => ['nullable', 'string', 'max:255'],

        ];
    }
}

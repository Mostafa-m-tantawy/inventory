<?php

namespace App\Http\Requests\pos;

use Illuminate\Foundation\Http\FormRequest;

class CreateCoupon extends FormRequest
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
            'name'              =>  'required|string',
            'description'       =>  'nullable|string',
            'from'              =>  'required|date',
            'to'                =>  'required|date',
            'percentage'        =>  'required|numeric',

        ];
    }
}

<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateRestaurant extends FormRequest
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
    { $update_id='';
        if(request()->id)
            $update_id .=',name,'.request()->id;

        return [
            'name' => ['required', 'string', 'max:255', 'unique:users'.$update_id],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'confirmed'],
            'phone' => ['required'],
            'address' => ['required'],        ];
    }
}

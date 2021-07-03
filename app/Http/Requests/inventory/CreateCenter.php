<?php

namespace App\Http\Requests\inventory;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateCenter extends FormRequest
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
            if(request()->id)
                $update_id .=',name,'.request()->id;
            return [
                'name' => ['required', 'string',
                    Rule::unique('centers','name')->where('store_id',Auth::user()->store_id)->ignore(request()->id)],
                'description' => ['nullable', 'string'],
            ];

    }
}

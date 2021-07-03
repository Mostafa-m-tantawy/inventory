<?php

namespace App\Http\Requests\conf;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateSafeRequest extends FormRequest
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
            'name' => ['required', 'string',
                Rule::unique('safes','name')->where('store_id',Auth::user()->store_id)->ignore(request()->route('department'))],
            'employee_id' => ['required', 'string',
        Rule::unique('safes','employee_id')->where('store_id',Auth::user()->store_id)->ignore(request()->route('department'))],

        ];
    }
}

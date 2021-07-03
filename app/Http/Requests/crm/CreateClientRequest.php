<?php

namespace App\Http\Requests\crm;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateClientRequest extends FormRequest
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
            'name' => 'required|max:255',
            'phone1' => ['required','max:255',
                Rule::unique('clients','phone1')->where('store_id',Auth::user()->store_id)->ignore(request()->route('client'))],
            'phone2' => ['required','max:255',
                Rule::unique('clients','phone2')->where('store_id',Auth::user()->store_id)->ignore(request()->route('client'))],
            'address' => 'required|max:255',
            'email' => 'nullable | string|max:255',
            'national_id' => 'nullable | string|max:255',
        ];
    }
}

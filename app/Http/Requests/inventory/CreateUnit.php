<?php

namespace App\Http\Requests\inventory;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CreateUnit extends FormRequest
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
                'unit' => ['required', 'string',
                    Rule::unique('units','unit')->where('store_id',Auth::user()->store_id)->ignore(request()->id)],

                'child_unit' => ['required', 'string' ],
                'convert_rate' => ['required', 'numeric' ],

      ];
    }
}

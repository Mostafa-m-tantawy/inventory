<?php

namespace App\Http\Requests\conf;

use Illuminate\Foundation\Http\FormRequest;

class CreateExpensesRequest extends FormRequest
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

            'payment_method' => ['required'],
            'payment_amount' => ['required', 'numeric'],
            'note' => ['nullable', 'string', 'max:255'],
        ];
    }
}

<?php

namespace App\Http\Requests\pos;

use Carbon\Carbon;
use Illuminate\Foundation\Http\FormRequest;

class CreateReservation extends FormRequest
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
            'client_id' => ['required', 'exists:clients,id'],
            'note' => ['nullable', 'string',],
            'start_date' => ['required', 'date', 'after_or_equal:' . Carbon::today()],
            'start_time' => ['required',],
            'duration' => ['nullable',],
            'clients_number' => ['nullable', 'numeric',]
        ];
    }
}

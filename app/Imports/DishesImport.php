<?php

namespace App\Imports;

use App\Models\cost\Dish;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class DishesImport implements WithMultipleSheets, ToArray, WithHeadingRow
{
    use Importable;

    public $failedRules;
    public $identifier;


    public function __construct()
    {
        $this->failedRules = [];
        $this->identifier = [];


    }


    /**
     * @param array $array
     */
    public function array(array $array)
    {
        foreach ($array as $column => $uploadData) {

//            $validator =  new CreateDish( $uploadData);
            $validator = Validator::make($uploadData,[

                'name' => ['required', 'max:255',
                    Rule::unique('dishes', 'name')->where('store_id', Auth::user()->store_id)],
                'name_ar' => ['required', 'max:255',
                    Rule::unique('dishes', 'name_ar')->where('store_id', Auth::user()->store_id)],
                'description' => ['nullable', 'max:255'],
                'dish_category_id' => ['required'],
                'department_id' => ['required'],
                'type' => ['required', Rule::in(['dish', 'side', 'extra'])]
            ]);

            if ($validator->fails()) {
                $this->failedRules[$column + 1]['keys'] = array_keys($validator->errors()->messages());
                $this->failedRules[$column + 1]['messages'] = $validator->errors()->messages();
            } else {
                $this->identifier[] = $uploadData;
            }

        }
        if (count($this->identifier) > 0)
            foreach ($this->identifier as $productRow) {

                $ExcelPath = storage_path('public/excel/'. $productRow['image']);
                if (!file_exists($ExcelPath) &&$productRow['image']) {

                   $newName=date("dmY-his") . str_replace(' ', '', $productRow['image']);;
                    if (!Storage::exists('public/dishes/'.$newName)) {
                        Storage::copy('public/excel/'.$productRow['image'], 'public/dishes/'.$newName);
                    }
                    $productRow['image']='dishes/'.$newName;
                }

                $product = Dish::create($productRow);

            }

    }

    public function sheets(): array
    {
        return [
            0 => $this,
        ];
    }
}

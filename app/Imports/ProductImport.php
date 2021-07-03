<?php

namespace App\Imports;

use App\Models\cost\Dish;
use App\Http\Requests\Cost\CreateDish;
use App\Models\inventory\Product;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class ProductImport implements WithMultipleSheets, ToArray, WithHeadingRow
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

            $validator = Validator::make($uploadData,[

                'name'                  => ['required', 'string', 'max:255', Rule::unique('products','name')->where('store_id',Auth::user()->store_id)],
                'name_ar'               => ['nullable', 'string', 'max:255', Rule::unique('products','name_ar')->where('store_id',Auth::user()->store_id)],
                'description'           => ['nullable', 'string', 'max:255'],
                'barcode'               => ['nullable', 'max:255', Rule::unique('products','barcode')->where('store_id',Auth::user()->store_id)],
                'reorder_point'         => ['nullable', 'numeric'],
                'product_category_id'   => ['required'],
                'unit_id'               => ['required'],
                'is_prepared'           => ['required'],

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
                $productRow=  array_filter( $productRow, 'strlen' );
                $product = Product::create($productRow);

            }

    }

    public function sheets(): array
    {
        return [
            0 => $this,
        ];
    }
}

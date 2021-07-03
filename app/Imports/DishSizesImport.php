<?php

namespace App\Imports;

use App\Models\cost\Dish;
use App\Models\cost\DishSize;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToArray;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class DishSizesImport implements WithMultipleSheets, ToArray, WithHeadingRow
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
                'dish_id' => ['required','numeric','exists:dishes,id'],
                'name' => ['required','string','max:255'],
                'name_ar' => ['nullable','string','max:255'],
                'price' => ['required', 'numeric'],
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
//                dd($productRow);
//                $product = DishSize::create($productRow);
                $size =new  DishSize;
                $size->dish_id =$productRow['dish_id'];
                $size->name =$productRow['name'];
                $size->name_ar =$productRow['name_ar'];
                $size->status =$productRow['status'];
                $size->price =$productRow['price'];
                $size->save();
            }

    }

    public function sheets(): array
    {
        return [
            0 => $this,
        ];
    }
}

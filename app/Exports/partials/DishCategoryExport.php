<?php

namespace App\Exports\partials;

use App\Models\cost\DishCategory;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class DishCategoryExport implements FromCollection,WithTitle,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return DishCategory::select('id','name','name_ar')->get();
    }

    /**
     * @return string
     */
    public function title(): string
    {
return 'Dish-Category';
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return  ['id','name'];
    }
}

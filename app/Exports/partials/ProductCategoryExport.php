<?php

namespace App\Exports\partials;

use App\Models\cost\DishCategory;
use App\Models\inventory\ProductCategory;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class ProductCategoryExport implements FromCollection,WithTitle,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return ProductCategory::select('id','name')->get();
    }

    /**
     * @return string
     */
    public function title(): string
    {
return 'Product-Category';
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return  ['id','name'];
    }
}

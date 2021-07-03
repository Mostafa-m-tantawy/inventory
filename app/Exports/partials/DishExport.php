<?php

namespace App\Exports\partials;

use App\Models\inventory\Department;
use App\Models\cost\Dish;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class DishExport implements FromCollection,WithTitle,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Dish::select('id','name','name_ar')->get();
    }

    /**
     * @return string
     */
    public function title(): string
    {
        return 'Dishes';
    }

    /**
     * @return array
     */
    public function headings(): array
    {
return  ['id','name','name_ar'];
    }
}

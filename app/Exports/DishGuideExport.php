<?php

namespace App\Exports;

use App\Exports\partials\DepartmentExport;
use App\Exports\partials\DishCategoryExport;
use App\Exports\partials\DishImportGuides;
use App\Unit;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;


class DishGuideExport implements WithMultipleSheets
{
    use Exportable;

    public function __construct()
    {
    }

    /**
     * @return array
     */
    public function sheets(): array
    {
        $sheets = [];

            $sheets['Guides'] = new DishImportGuides();
            $sheets['Dish-categories'] = new DishCategoryExport();
            $sheets['Departments'] = new DepartmentExport();

        return $sheets;
    }
}

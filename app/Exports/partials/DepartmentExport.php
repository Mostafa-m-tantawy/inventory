<?php

namespace App\Exports\partials;

use App\Models\inventory\Department;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class DepartmentExport implements FromCollection,WithTitle,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Department::select('id','name')->get();
    }

    /**
     * @return string
     */
    public function title(): string
    {
        return 'Departments';
    }

    /**
     * @return array
     */
    public function headings(): array
    {
return  ['id','name'];
    }
}

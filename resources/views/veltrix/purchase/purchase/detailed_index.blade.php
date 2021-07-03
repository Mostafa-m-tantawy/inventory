@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.purchase detailed')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.purchase detailed')}}</a>
            </li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="{{url('stock/purchase/create')}}"
               class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light">
                <i class="ti ti-plus"></i>
                {{trans('main.new record')}}
            </a>
        </div>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->


    <!-- end row -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!--begin: Datatable -->
                    <table id="datatable-responsive"
                           class="display table table-striped table-bordered " cellspacing="0"
                         style="width:100%">
                        <thead class="thead-dark">
                        <tr>
                            <th> {{trans('main.supplier')}} </th>
                            <th>  {{trans('main.product')}}</th>
                            <th>  {{trans('main.quantity')}}</th>
                            <th>  {{trans('main.price')}}</th>
                            <th>  {{trans('main.vat')}}</th>
                            <th>  {{trans('main.total')}}</th>
                            <th>{{trans('main.created_at')}}</th>
                        </tr>
                        </thead>
                    </table>

                    <!--end: Datatable -->
                </div>

            </div>
        </div>
    </div>


@stop



@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>

        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('purchase.detailed.datatable-data')}}',
            columns: [
                {data: 'supplier', name: 'supplier', searchable: false, orderable: false},
                {data: 'product_id', name: 'product_id', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'unit_price', name: 'unit_price', searchable: true, orderable: true},
                {data: 'vat', name: 'vat', searchable: true, orderable: true},
                {data: 'total', name: 'total', searchable: true, orderable: true},
                {data: 'created_at', name: 'created_at', searchable: true, orderable: true},

            ],
        })
    </script>

    @endsection


    </tr>








@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.index assign')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.index assign')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a
               href="{{url('stock/assign/create')}}"
               class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light" >
                <i class="ti ti-plus"></i>
                {{trans('main.new')}} {{trans('main.record')}}
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
                    <div class="table-responsive">

                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                    @endif
                    <!--begin: Datatable -->
                            <table id="datatable-responsive"
                                   class="display table table-striped table-bordered " cellspacing="0"
                                   style="width:100%">
                                <thead class="thead-dark">
                                <tr>
                                    <th> {{trans('main.from')}}</th>
                                    <th> {{trans('main.to')}}</th>
                                    <th> {{trans('main.product')}}</th>
                                    <th> {{trans('main.quantity')}}</th>
                                    <th>{{trans('main.created_at')}}</th>

                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>

        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('assign.datatable-data')}}',
            columns: [
                {data: 'sourceable', name: 'sourceable', searchable: false, orderable: false},
                {data: 'assignable', name: 'assignable', searchable: false, orderable: false},
                {data: 'product_id', name: 'product_id', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'created_at', name: 'created_at', searchable: true, orderable: true},
            ],
        })
    </script>
@endsection

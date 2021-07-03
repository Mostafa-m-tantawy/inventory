@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.index supplier')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.index supplier')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="{{route('supplier.create')}}"
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
                            <th>{{trans('main.name')}}</th>
                            <th>{{trans('main.email')}}</th>
                            <th>{{trans('main.start balance')}}</th>
                            <th>{{trans('main.purchases_amount')}}</th>
                            <th>{{trans('main.refunds_amount')}}</th>
                            <th>{{trans('main.paid_amount')}}</th>
                            <th>{{trans('main.credit_amount')}}</th>
                            <th>{{trans('main.actions')}}</th>
                        </tr>
                        </thead>
                        <tbody>
{{--                        @foreach($suppliers as $supplier)--}}
{{--                            <tr>--}}
{{--                                <td>{{$supplier->id}}</td>--}}
{{--                                <td>{{$supplier->user->name}}</td>--}}
{{--                                <td>{{$supplier->user->email}}</td>--}}
{{--                                <td>{{$supplier->purchases_amount}}</td>--}}
{{--                                <td>{{$supplier->refunds_amount}}</td>--}}
{{--                                <td>{{$supplier->paid_amount}}</td>--}}
{{--                                <td>{{$supplier->credit_amount}}</td>--}}

{{--                                <td>--}}
{{--                                    <a href="{{url('stock/product/create/'.$supplier->id)}}"--}}
{{--                                       title="products" class="btn btn-primary">--}}
{{--                                        {{trans('main.products')}}--}}

{{--                                    </a>--}}
{{--                                        <a href="{{route('supplier.show',[$supplier->id])}}" title="profile" class="btn btn-primary">--}}
{{--                                           {{trans('main.profile')}}--}}
{{--                                        </a>--}}
{{--                                    @if($supplier->canDeleted)--}}

{{--                                        <form method="post" onsubmit="deleteConfirm(event,'{{trans('main.supplier')}}')"--}}
{{--                                              action="{{route('supplier.destroy',[$supplier->id])}}">--}}
{{--                                            @csrf--}}
{{--                                            @method('DELETE')--}}
{{--                                            <button class="btn btn-danger"> {{trans('main.delete')}}</button>--}}
{{--                                        </form>--}}
{{--                                    @endif--}}
{{--                                </td>--}}
{{--                            </tr>--}}
{{--                        @endforeach--}}

                        </tbody>
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
            ajax: '{{ route('supplier.datatable-data')}}',
            columns: [
                {data: 'name', name: 'name', searchable: false, orderable: false},
                {data: 'email', name: 'email', searchable: true, orderable: true},
                {data: 'start_balance', name: 'start_balance', searchable: true, orderable: true},
                {data: 'purchases_amount', name: 'purchases_amount', searchable: true, orderable: true},
                {data: 'refunds_amount', name: 'refunds_amount', searchable: true, orderable: true},
                {data: 'paid_amount', name: 'paid_amount', searchable: true, orderable: true},
                {data: 'credit_amount', name: 'credit_amount', searchable: true, orderable: true},
                {data: 'action', name: 'action', searchable: false, orderable: false},
            ],
        })
    </script>
@endsection

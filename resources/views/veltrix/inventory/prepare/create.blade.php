@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{ URL::asset('plugins/select2/css/select2.min.css') }}" rel="stylesheet" type="text/css"/>
    <style>
        #wrapper {
            height: 100%;
            overflow: unset !important;
            width: 100%;
        }

        .footer {
            bottom: unset !important;
        }

    </style>
@stop


@section('title')
    {{ trans('main.prepare food') }}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.product')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">   {{ trans('main.prepare food') }}</a>
            </li>
        </ol>
    </div>

@endsection


@section('content')
    <!-- begin:: Content -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <form class="form-horizontal" role="form" action="{{route('product.prepare.cook',[$product->id])}}"
                          id="purses" method="post"
                          enctype="multipart/form-data" data-parsley-validate novalidate>
                        {{csrf_field()}}
                        <div class="row">
                            <div class=" col-6">
                                <table
                                    class=" thead-light compact table table-striped table-bordered " cellspacing="0"
                                    style="width:100%">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th>{{trans('main.name')}}</th>
                                        <th>{{trans('main.recipe')}}</th>
                                        <th>{{trans('main.cook')}}</th>
                                        <th>{{trans('main.stock')}}</th>
                                        <th>{{trans('main.rest')}}</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @foreach($product->recipes as $rec)
                                        <tr>
                                            <td> {{$rec->product->LangName}}</td>
                                            <td class="unit_quantity">{{number_format( $rec->unit_quantity,2)}}  </td>
                                            <td class="cook_quantity">0</td>
                                            <td class="stock_quantity"> {{number_format($rec->product->quantity,2)}}  </td>
                                            <td class="rest_quantity">{{number_format($rec->product->quantity,2)}}   </td>
                                        </tr>
                                    @endforeach

                                    </tbody>
                                </table>

                            </div>
                            <input type="hidden" name="product_id" id="product_id" value="{{$product->id}}">

                            <div class="form-group col-4">

                                <label class=" control-label"
                                       for="example-email"> {{ trans('main.quantity') }} (
                                    <span class="input-group-addon" id="unit">{{$product->unit->unit}} </span>) </label>

                                <div class="input-group ">
                                    <input type="number" id="quantity" name="quantity"
                                           class="form-control"
                                           placeholder="{{ trans('main.quantity') }} ">
                                </div>
                            </div>

                            <div class="form-group col-2">
                                <label class="col-md-2 control-label"></label>
                                <div class="col-md-10">
                                    <button type="submit" class="btn btn-primary">
                                        {{ trans('main.cook') }}
                                    </button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <table id="datatable-responsive"
                        class="display thead-light compact table table-striped table-bordered " cellspacing="0"
                        style="width:100%">
                        <thead class="thead-dark">
                        <tr>
                            <th>{{trans('main.product')}}</th>
                            <th>{{trans('main.quantity')}}</th>
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


@endsection

@section('scripts')

    {{--    <script src="{{ asset('app_js/PrepareController.js') }}"></script>--}}
    @include('scripts.PrepareController')
    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>



    <script>
        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,

            ajax: {
                url: '{{ route('prepare.datatable-data')}}',
                type: "get",
                data: function (d) {
                    d.product_id = "{{$product->id}}";
                },
            },columns: [
                {data: 'name'           , name: 'name'          , searchable: true, orderable: true},
                {data: 'quantity'           , name: 'quantity'          , searchable: true, orderable: true},
                {data: 'created_at'        , name: 'created_at'       , searchable: true, orderable: true},

            ],

        })

    </script>

@endsection

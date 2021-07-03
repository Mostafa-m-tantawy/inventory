@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('vendors/general/bootstrap-daterangepicker/daterangepicker.css')}}" rel="stylesheet"
          type="text/css"/>

    <style>
        .scroll-group {
            max-height: 320px;
            margin-bottom: 10px;
            overflow: scroll;
            -webkit-overflow-scrolling: touch;
        }
    </style>
@stop


@section('title')
    {{trans('main.create ruined product')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a
                    href="javascript:void(0);"> {{trans('main.create ruined product')}}</a></li>
        </ol>
    </div>

@endsection
@section('content')

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col-12">
                            <div class="card-box" id="app">
                                <h4 class="m-t-0 header-title"><b> {{ trans('main.ruined') }}</b></h4>
                                <hr>
                                <form class="form-horizontal" role="form" action="#" id="purses" method="post"
                                      enctype="multipart/form-data" data-parsley-validate novalidate>
                                    {{csrf_field()}}
                                    <div class="row">
                                        <div class="form-group col-4">
                                            <label for=""
                                                   class=" control-label"> {{ trans('main.type') }}</label>
                                            <select name="type" id="type" class="form-control select2 " required>
                                                <option
                                                    value="0"> {{trans('main.select one')}}</option>
                                                <option value="restaurant"> {{ trans('main.restaurant') }} </option>
                                                <option value="department"> {{ trans('main.department') }} </option>

                                            </select>
                                        </div>
                                        <div class="form-group col-4">
                                            <label for=""
                                                   class=" control-label">  {{ trans('main.ruined') }} {{ trans('main.from') }}</label>
                                            <select name="from_stock" id="from_stock" class="form-control  select2"
                                                    required>
                                                <option
                                                    value=""> {{trans('main.select one')}} </option>
                                            </select>
                                        </div>
                                        <div class="form-group col-4">
                                            <label for=""
                                                   class=" control-label"> {{ trans('main.select') }}  {{ trans('main.product') }}</label>
                                            <select name="product" id="product" class="form-control select2" required>
                                                <option
                                                    value=""> {{trans('main.select one')}} </option>

                                            </select>
                                        </div>

                                        <div class="form-group col-3">
                                            <label class=" control-label"
                                                   for="example-email"> {{ trans('main.quantity') }} (
                                                <span class="input-group-addon" id="unit"> </span>) </label>
                                            <div class="input-group ">
                                                <input type="number" required id="quantity" name="quantity"
                                                       class="form-control" step="0.01" min="0"
                                                >
                                            </div>
                                        </div>


                                        <div class="col-3">
                                            <div class="form-group ">
                                                <label class=" control-label"
                                                       for="example-email"> {{ trans('main.cost') }}  </label>
                                                <div class="input-group ">
                                                    <input type="number" readonly id="cost" name="cost"
                                                           class="form-control">
                                                </div>

                                            </div>
                                        </div>
                                        <div class="form-group col-4">
                                            <label class=" control-label"
                                                   for="example-email"> {{ trans('main.note') }}</label>
                                            <div class="input-group ">
                                                <input type="text" id="note" name="note"
                                                       class="form-control">
                                            </div>
                                        </div>


                                        <div class="form-group col-2">
                                            <label class="col-md-2 control-label"></label>
                                            <div class="col-md-10">
                                                <button type="submit" class="btn btn-primary">
                                                    {{ trans('main.add') }}
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </form>

                                <div class="p-20">
                                    <div class="table-responsive">
                                        <table id="datatable-responsive"
                                               class="table table-striped table-bordered dt-responsive nowrap"
                                               cellspacing="0">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th>#</th>
                                                <th>  {{ trans('main.type') }}</th>
                                                <th>  {{ trans('main.ruined') }} {{ trans('main.from') }}</th>
                                                <th> {{ trans('main.product') }}</th>
                                                <th> {{ trans('main.quantity')}}</th>
                                                <th> {{ trans('main.cost')}}</th>
                                                <th> {{ trans('main.action') }}</th>
                                            </tr>
                                            </thead>
                                            <tbody id="pursesDetailsRender">


                                            </tbody>
                                        </table>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script src="{{ url('/filestyle/bootstrap-filestyle.min.js') }}"></script>

    {{--    <script src="{{ url('/app_js/ruinedController.js') }}">--}}
        @include('scripts.ruinedController')

    <script >
    $(document).ready(function () {


        $('#price_math_method').change(function () {
            $('#stock_range_date').css('display', 'none');

            if ($(this).val() == 'avg_price')
                $('#stock_range_date').css('display', 'block');
        });


    })
    </script>

@endsection

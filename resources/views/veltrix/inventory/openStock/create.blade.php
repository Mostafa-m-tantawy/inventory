@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('vendors/general/bootstrap-daterangepicker/daterangepicker.css')}}" rel="stylesheet" type="text/css"/>

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
    {{trans('main.open stock')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);"> {{trans('main.open stock')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')
    <!-- begin:: Content -->

    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">


                <div class="row">
                    <div class="col-12">
                        <div class="card-box" id="app">
                            <h4 class="m-t-0 header-title"><b>  {{ trans('main.open-stock') }}</b></h4>
                            <hr>
                            <form class="form-horizontal" role="form" action="#" id="purses" method="post"
                                  enctype="multipart/form-data" data-parsley-validate novalidate>
                                {{csrf_field()}}
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label for=""
                                               class=" control-label"> {{ trans('main.select') }}  {{ trans('main.product') }}</label>
                                        <select name="product_id" id="product" class="form-control select2" required>
                                            <option value="">{{ trans('main.select') }}  {{ trans('main.product') }}</option>

                                            @foreach($products as $product)
                                                <option value="{{$product->id}}">{{$product->lang_name}}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group col-4">
                                        <label class=" control-label"
                                               for="example-email"> {{ trans('main.quantity') }} (
                                            <span class="input-group-addon" id="unit"> </span>) </label>
                                        <div class="input-group ">
                                            <input type="number" step="0.01" min="0" id="quantity" name="quantity"
                                                   class="form-control"
                                                   placeholder="{{ trans('main.quantity') }} ">
                                         </div>
                                    </div>


                                    <div class="form-group col-4">
                                        <label class=" control-label"
                                               for="example-email"> {{ trans('main.unit') }}  {{ trans('main.price') }}
                                            :</label>
                                        <input type="number" step="0.01" min="0" name="unit_price" class="form-control"
                                               placeholder="{{ trans('main.unit') }}  {{ trans('main.price') }} "
                                               parsley-trigger="change" required id="unitPrice">
                                    </div>


                                    <div class="form-group col-4">
                                        <label for=""
                                               class=" control-label"> {{ trans('main.child') }}  {{ trans('main.unit') }}  {{ trans('main.price') }}
                                        (    <span class="input-group-addon" id="child_unit"> </span>)</label>

                                            <input disabled type="text" id="child_unit_price" name="quantity"
                                                   class="form-control" step="0.01" min="0"
                                                   placeholder=" {{ trans('main.Child Unit Price') }}">

                                    </div>

                                    <div class="form-group col-4">
                                            <label class=" control-label" for="example-email"> {{ trans('main.gross price') }}  </label>
                                            <input disabled type="number" min="1" name="product_name"
                                                   class="form-control" placeholder=" {{ trans('main.gross price') }} " required id="grossPrice">


                                    </div>

                                    <div class="form-group col-4">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-10">
                                            <button type="submit" class="btn btn-primary btn-icon-sm">
                                                {{ trans('main.add now') }}
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </form>

                            <div class="p-20">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th>#</th>
                                            <th> {{ trans('main.product') }}</th>
                                            <th width="100px"> {{ trans('main.quantity') }}</th>
                                            <th width="150px"> {{ trans('main.unit') }}  {{ trans('main.price') }}</th>
                                            <th> {{ trans('main.child') }}  {{ trans('main.unit') }}  {{ trans('main.price') }}</th>
                                            <th> {{ trans('main.gross') }}  {{ trans('main.price') }}</th>
                                            <th width="95px"> {{ trans('main.action') }}</th>
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

{{--    <script src="{{ url('/app_js/PursesController.js') }}"></script>--}}
    @include('scripts.OpenStockController')



@endsection

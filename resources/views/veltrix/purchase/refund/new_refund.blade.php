@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.create refund')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.create refund')}}</a></li>
        </ol>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->


    <!-- end row -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                <div class="row">
                    <div class="col-12">
                        <div class="card-box" id="app">
                            <h4 class="m-t-0 header-title"><b> {{ trans('main.refund') }}</b></h4>
                            <hr>
                            <form class="form-horizontal" role="form" id="purses" method="post"
                                  enctype="multipart/form-data" >
                                {{csrf_field()}}
                                <div class="row">
                                    <div class="form-group col-4">
                                        <label for="" class=" control-label">  {{ trans('main.supplier') }}</label>
                                        <select name="supplier_id" id="supplier_id" class="form-control  select2" required>
                                            <option
                                                value="">  {{ trans('main.select one') }}</option>
                                            @foreach($suppliers as $supplier)
                                                <option value="{{$supplier->id}}">{{$supplier->user->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group col-4">
                                        <label for=""
                                               class=" control-label"> {{ trans('main.select') }}  {{ trans('main.product') }}</label>
                                        <select name="product_id" id="product" class="form-control select2" required>
                                            <option
                                                value="">   {{ trans('main.select one') }}</option>

                                        </select>
                                    </div>

                                    <div class="form-group col-4">
                                        <label class=" control-label"
                                               for="example-email"> {{ trans('main.quantity') }} (
                                            <span class="input-group-addon" id="unit"> </span>) </label>
                                        <div class="input-group ">
                                            <input type="number" id="quantity" name="quantity"
                                                   class="form-control"step="0.01" min="0"
                                                   placeholder="{{ trans('main.quantity') }}">
                                        </div>
                                    </div>


                                    <div class="form-group col-4">
                                        <label class=" control-label"
                                               for="example-email"> {{ trans('main.unit price') }}
                                            :</label>
                                        <input type="number" min="1" name="unit_price" class="form-control"
                                               placeholder="{{ trans('main.unit price') }}"
                                               parsley-trigger="change" maxlength="50" required id="unitPrice">
                                    </div>

                                    <div class="form-group col-4">
                                        <label for="" class=" control-label">{{ trans('main.note') }}</label>
                                        <input  type="text" id="note" name="note"
                                               class="form-control"
                                               placeholder="{{ trans('main.leave note') }}">
                                    </div>

                                    <div class="form-group col-4">
                                        <label class=" control-label" for="example-email"> {{ trans('main.gross') }}  {{ trans('main.price') }}</label>
                                        <input disabled type="number" min="1" name="product_name"
                                               class="form-control" placeholder="{{ trans('main.Gross Price') }}" required id="grossPrice">


                                    </div>

                                    <div class="form-group col-12">
                                        <label class="col-md-2 control-label"></label>
                                        <div class="col-md-10">
                                            <button type="submit" class="btn btn-primary btn-elevate btn-icon-sm">
                                                {{ trans('main.add') }}
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
                                            <th> {{ trans('main.supplier') }}</th>
                                            <th> {{ trans('main.product') }}</th>
                                            <th width="100px"> {{ trans('main.quantity') }}</th>
                                            <th width="150px">{{ trans('main.unit price') }}</th>
                                            <th> {{ trans('main.child unit price') }} </th>
                                            <th> {{ trans('main.gross price') }}</th>
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
    <script src="{{ url('/filestyle/bootstrap-filestyle.min.js') }}"></script>

{{--    <script src="{{ url('/app_js/refundController.js') }}"></script>--}}
    @include('scripts.refundController')



@endsection

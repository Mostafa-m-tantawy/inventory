@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.edit purchase')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.edit purchase')}}</a></li>
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
                    <div class="col-sm-12">
                        <div class="card-box" id="app">

                            <h4 class="m-t-0 header-title"><b> {{ trans('main.purchases') }}</b></h4>
                            <p>

                            </p>

                            <hr>
                            <form class="form-horizontal" role="form"
                                  action="{{url('stock/save-purses-product/'.$purses->id)}}" method="post"
                                  enctype="multipart/form-data" data-parsley-validate novalidate>
                                {{csrf_field()}}

                                <div class="row">

                                    <div class="form-group col-4">
                                        <input type="hidden" value="{{$purses->id}}" id="purses_id">

                                        <label for=""
                                               class=" control-label"> {{ trans('main.select product') }} </label>
                                        <select name="product_id" id="product" class="form-control select2" required>
                                            <option
                                                value=""> {{ trans('main.select product') }} </option>
                                            @foreach($products as $product)
                                                <option data-vat="{{$product->pivot->vat}}"
                                                        value="{{$product->id}}">{{$product->langName}}</option>
                                            @endforeach
                                        </select>
                                        <input type="hidden" id="vat" name="vat">
                                    </div>

                                    <div class="form-group col-4">
                                        <label class=" control-label" for="example-email">
                                            {{ trans('main.quantity') }} (<span class="input-group-addon"
                                                                                id="unit"> {{ trans('main.unit') }}</span>)</label>
                                        <input type="text" id="quantity" name="quantity"step="0.01" min="0"
                                               class="form-control" placeholder="{{ trans('main.quantity') }} " >

                                    </div>

                                    <div class="form-group col-3">
                                        <label class=" control-label"
                                               for="example-email"> {{ trans('main.unit price') }}
                                        </label>
                                        <input type="number" min="1" name="unit_price" class="form-control"
                                               placeholder="{{ trans('main.unit price') }} " required id="unitPrice">
                                    </div>
                                    <div class="form-group col-3">
                                        <label for=""
                                               class=" control-label"> {{ trans('main.percentage_discount') }}%</label>

                                        <input  type="number" id="percentage_discount" name="percentage_discount"
                                                class="form-control" step="0.01" min="0"
                                                placeholder=" {{ trans('main.percentage_discount') }}">

                                    </div>
                                    <div class="form-group col-2">
                                        <label for="" class=" control-label"> {{ trans('main.vat') }}%
                                           </label>
                                        <div class="input-group">
                                            <input disabled type="text" id="vat_value"
                                                   name="vat_value" class="form-control"
                                                   placeholder="{{ trans('main.vat') }}">

                                        </div>
                                    </div> <div class="form-group col-2">
                                        <label for=""
                                               class=" control-label"> {{ trans('main.child unit price') }}
                                            ( <span class="input-group-addon" id="child_unit"> </span>)</label>
                                        <div class="input-group">
                                            <input readonly type="text" id="child_unit_price"
                                                   name="child_unit_price"
                                                   class="form-control"
                                                   placeholder="{{ trans('main.Child Unit Price') }}">

                                        </div>
                                    </div>

                                    <div class="form-group col-2">
                                        <label class=" control-label"
                                               for="example-email"> {{ trans('main.gross price') }}</label>

                                        <div class="input-group">
                                            <input disabled type="number" min="1" name="product_name"
                                                   class="form-control" placeholder="{{ trans('main.gross price') }}  " required
                                                   id="grossPrice">
                                            <span class="input-group-addon"
                                                  id=""></span>
                                        </div>

                                    </div>


                                    <div class="form-group col-3">
                                        <label class="control-label"></label>
                                        <div class="col-md-10">
                                            <button type="submit" class="btn btn-primary btn-elevate btn-icon-sm">
                                                {{ trans('main.purses now') }}

                                            </button>
                                        </div>
                                    </div>

                                </div>

                            </form>

                            <div class="p-20">
                                <div class="table-responsive">
                                    <table id="datatable-responsive"
                                                                       class="display table table-striped table-bordered " cellspacing="0"
                                                                       style="width:100%">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th>#</th>
                                            <th> {{ trans('main.supplier') }}</th>
                                            <th> {{ trans('main.product') }}</th>
                                            <th width="100px"> {{ trans('main.quantity') }}</th>
                                            <th width="150px"> {{ trans('main.unit') }}  {{ trans('main.price') }}</th>
                                            <th> {{ trans('main.discount_percentage') }}</th>
                                            <th> {{ trans('main.vat') }}</th>
                                            <th> {{ trans('main.gross') }}  {{ trans('main.price') }}</th>
{{--                                            <th width="95px"> {{ trans('main.action') }}</th>--}}
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php $count = 1; ?>
                                        @foreach($purses->pursesProducts as $product)
                                            <tr>
                                                <td>{{$loop->index+1}}</td>
                                                <td>{{$purses->supplier->user->name}}</td>
                                                <td>{{$product->product->langName}}</td>
                                                <td>{{$product->quantity}}</td>
                                                <td>{{$product->unit_price}} </td>
                                                <th>{{$product->discount_percentage}}% </th>
                                                <th>{{$product->vat}}% </th>
                                                <th>{{$product->total}} </th>

                                            </tr>
                                        @endforeach


                                        </tbody>
                                    <tfoot>
                                    <tr>
                                        <th colspan="6"></th>
                                        <th class="text-right">{{ trans('main.sup-total') }} :</th>
                                        <th>{{ number_format($purses->sub_total ,2,'.',',')}}</th>
                                    </tr>

                                    <tr>
                                        <th colspan="6"></th>
                                        <th class="text-right">{{ trans('main.discount_percentage') }} :</th>
                                        <th style="color: red">{{ number_format($purses->product_discount,2,'.',',')}}</th>
                                    </tr>

                                    <tr>
                                        <th colspan="6"></th>
                                        <th class="text-right">{{ trans('main.vat') }} :</th>
                                        <th style="color: green">{{ number_format($purses->vat,2,'.',',')}}</th>

                                    </tr>

                                    <tr>
                                        <th colspan="6"></th>
                                        <th class="text-right">{{ trans('main.discount') }} :</th>
                                        <th style="color: red">{{ number_format($purses->discount,2,'.',',')}}</th>

                                    </tr>

                                    <tr>
                                        <th colspan="6"></th>
                                        <th class="text-right">{{ trans('main.total') }} :</th>
                                        <th>{{ number_format($purses->total,2,'.',',')}}</th>

                                    </tr>


                                    </tfoot>
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

{{--    <script src="{{ url('/app_js/PursesUpdateController.js') }}"></script>--}}
@include('scripts.PursesUpdateController')
<script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

<script>
    $('table.display').DataTable({
        responsive: true,
        dom: 'Bflrtip',
        buttons: ['copy', 'excel', 'print'],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "pagingType": "full_numbers",
        @if (App::isLocale('ar'))
        "language": dataTableLocale
        @endif
    });

</script>

<script>
        function confirmDelete(url) {
            var con = confirm(' {{ trans("main.Are you sure, you want to delete this item from this purses ?")}}');
            if (con) {
                //console.log('Confirm');
                //console.log(url);
                location.replace(url);
            } else {
                //console.log('not confirm')
            }
        }
    </script>

<script>
    $(document).ready(function() {
        $('.select2').select2();
    });
</script>

@endsection

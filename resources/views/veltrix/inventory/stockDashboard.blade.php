@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('vendors/general/select2/dist/css/select2.min.css')}}" rel="stylesheet" type="text/css"/>

    <style>
        .scroll-group {
            height: 325px;
            max-height: 325px;
            margin-bottom: 10px;
            overflow: scroll;
            -webkit-overflow-scrolling: touch;
        }
    </style>
@stop


@section('title')
    {{trans('main.stock Dashboard')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);"> {{trans('main.stock Dashboard')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')
    <!-- begin:: Content -->

    <div class="row">
        <div class="col-xl-6">
            <div class="card">
                <div class="card-body">

                    <h4 class="mt-0 header-title mb-5">
                        {{trans('main.reach re-order point')}}
                    </h4>
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="list-group scroll-group">
                                @foreach($products as $product)
                                    <a href="{{route('product.show',[$product->id])}}"
                                       class="list-group-item list-group-item-action flex-column align-items-start ">
                                        <div class="d-flex w-100 justify-content-between">
                                            <span style="clear: both" class="mb-1"> {{$product->LangName}}</span>
                                            <span class="badge badge-primary badge-pill">+{{$product->quantity}}</span>
                                        </div>
                                        <small>{{$product->description}}</small>
                                    </a>
                                @endforeach
                            </div>

                        </div>
                    </div>
                    <!-- end row -->
                </div>
            </div>
            <!-- end card -->
        </div>

        <div class="col-xl-6">
            <div class="card">
                <div class="card-body">
                    <div>
                        <h4 class="mt-0 header-title mb-4">
                            {{trans('main.financial')}} {{trans('main.receivables')}}
                        </h4>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="list-group ">
                                    <a class="list-group-item list-group-item-action flex-column align-items-start ">
                                        <div class="d-flex w-100 justify-content-between">
                                            <span style="clear: both" class="mb-1"> {{trans('main.suppliers')}}</span>
                                            <span
                                                class="text-success">+${{number_format($restaurant->suppliers()->sum('start_balance'),2)}}</span>
                                        </div>
                                        <small>{{trans('main.suppliers')}} {{trans('main.start')}} {{trans('main.balance')}}</small>
                                    </a>
                                    <a class="list-group-item list-group-item-action flex-column align-items-start ">
                                        <div class="d-flex w-100 justify-content-between">
                                            <span style="clear: both" class="mb-1"> {{trans('main.purchases')}}</span>
                                            <span
                                                class="text-success">+${{number_format($restaurant->purchases_amount,2)}}</span>
                                        </div>
                                        <small>{{trans('main.restaurant')}} {{trans('main.gross')}} {{trans('main.purchases')}}</small>
                                    </a>
                                    <a class="list-group-item list-group-item-action flex-column align-items-start ">
                                        <div class="d-flex w-100 justify-content-between">
                                            <span style="clear: both" class="mb-1">  {{trans('main.refund')}}</span>
                                            <span
                                                class="text-danger">-${{number_format($restaurant->refunds_amount,2)}}</span>
                                        </div>
                                        <small>{{trans('main.restaurant')}} {{trans('main.gross')}} {{trans('main.to')}} {{trans('main.supplier')}}   </small>
                                    </a>
                                    <a class="list-group-item list-group-item-action flex-column align-items-start ">
                                        <div class="d-flex w-100 justify-content-between">
                                            <span style="clear: both" class="mb-1"> {{trans('main.payment')}} </span>
                                            <span
                                                class="text-warning">-${{number_format($restaurant->paid_amount,2)}}</span>
                                        </div>
                                        <small>{{trans('main.restaurant')}} {{trans('main.gross')}} {{trans('main.payment')}}  </small>
                                    </a>
                                    <a class="list-group-item list-group-item-action flex-column align-items-start ">
                                        <div class="d-flex w-100 justify-content-between">
                                            <span style="clear: both" class="mb-1"> {{trans('main.dept')}} </span>
                                            <span
                                                class="text-primary">${{number_format($restaurant->dept_amount,2)}}</span>
                                        </div>
                                        <small>{{trans('main.restaurant')}}  {{trans('main.dept')}} </small>
                                    </a>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">

                            <div class="kt-portlet kt-portlet--bordered-semi kt-portlet--height-fluid">
                                <div class="kt-portlet__head">
                                    <div class="kt-portlet__head-label">
                                        <h3 class="kt-portlet__head-title">
                                            {{trans('main.time filter')}}
                                        </h3>
                                    </div>
                                </div>
                                <div class="kt-portlet__body">
                                    <form method="post" action="{{route('dashboard.stock')}}">
                                        @csrf
                                        <div class="row">
                                            <div class="form-group col-8">
                                                <label class=""> {{trans('main.date')}}  {{trans('main.range')}}</label>
                                                <div class='input-group pull-right' id='kt_daterangepicker_6'>
                                                    <input type='text' name="range" class="form-control" readonly
                                                           value="{{$from.' / '. $to}}"
                                                           placeholder="{{trans('main.date')}}  {{trans('main.range')}}"/>
                                                    <div class="input-group-append">
                                                        <span class="input-group-text"><i
                                                                class="la la-calendar-check-o"></i></span>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="form-group col-4"
                                                 style="    display: inherit;margin-top: 10px;">
                                                <button class="btn btn-primary pull-right" type="submit"
                                                        value="Dashboard time">
                                                    {{trans('main.Dashboard time')}}</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="kt-portlet kt-portlet--tabs">
                                <div class="kt-portlet__head">
                                    <div class="kt-portlet__head-toolbar">
                                        <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-brand"
                                            role="tablist">

                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#purchase"
                                                   role="tab">
                                                    <i class="flaticon2-shopping-cart-1"></i> {{trans('main.purchase')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#payment"
                                                   role="tab">
                                                    <i class="flaticon-coins"></i> {{trans('main.payments')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#refund"
                                                   role="tab">
                                                    <i class="flaticon2-back-1"></i> {{trans('main.refunds')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="kt-portlet__body">

                                    <div class="tab-content kt-margin-t-20">

                                        <!--Begin:: Tab Content-->
                                        <div class="tab-pane active" id="purchase" role="tabpanel">
                                            <div class="kt-portlet__body" style="padding: unset">

                                                <div class="kt-portlet__head kt-portlet__head--lg">
                                                    <div class="kt-portlet__head-label">

                                                        <h3 class="kt-portlet__head-title">
                                                            {{trans('main.purchases')}}
                                                        </h3>
                                                    </div>

                                                </div>
                                                <!--begin: Datatable -->
                                                <table id="datatable-responsive"
                                                       class="display table table-striped table-bordered "
                                                       cellspacing="0"
                                                       style="width:100%">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th>  {{ trans('main.id') }}</th>
                                                        <th> {{ trans('main.supplier') }} </th>
                                                        <th>  {{ trans('main.total') }}</th>
                                                        <th>{{trans('main.created_at')}}</th>
                                                        <th> {{ trans('main.action') }}</th>
                                                        <th> {{ trans('main.attachments') }}</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach($purchases->take(20) as $purchase)
                                                        <tr>
                                                            <td>{{$purchase->id}}</td>
                                                            <td>{{$purchase->supplier->user->name}}</td>
                                                            <td>{{$purchase->total}}</td>
                                                            <td>{{$purchase->created_at->format('d/m/Y')}}</td>

                                                            <td>
                                                                <a title="Show" class=" btn btn-warning"
                                                                   href="{{url('stock/purchase/show/'.$purchase->id)}}">
                                                                    {{trans('main.show')}}</a>
                                                            </td>

                                                            <td>
                                                                @foreach($purchase->files as $file)
                                                                    <a title="Show"
                                                                       href="{{url('/download?url='.$file->url)}}">
                                                                        {{$loop->index + 1}}<i
                                                                            class="fa fa-cloud-download-alt"></i></a>
                                                                @endforeach

                                                            </td>
                                                        </tr>
                                                    @endforeach

                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>

                                        <!--Begin:: Tab Content-->
                                        <div class="tab-pane" id="payment" role="tabpanel">

                                            <div class="kt-portlet__body" style="padding: unset">

                                                <div class="kt-portlet__head kt-portlet__head--lg">
                                                    <div class="kt-portlet__head-label">

                                                        <h3 class="kt-portlet__head-title">
                                                            {{trans('main.payments')}}
                                                        </h3>
                                                    </div>
                                                    <div class="kt-portlet__head-toolbar">
                                                        <div class="kt-portlet__head-wrapper">
                                                            <div class="kt-portlet__head-actions">


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--begin: Datatable -->
                                                <table id="datatable-responsive"
                                                       class="display table table-striped table-bordered "
                                                       cellspacing="0"
                                                       style="width:100%">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th> {{trans('main.id')}} </th>
                                                        <th> {{trans('main.from')}} </th>
                                                        <th> {{trans('main.to')}} </th>
                                                        <th> {{trans('main.amount')}} </th>
                                                        <th> {{trans('main.method')}} </th>
                                                        <th> {{trans('main.Due Date')}} </th>
                                                        <th>{{trans('main.created_at')}}</th>
                                                        <th> {{trans('main.action')}} </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach($payments->take(20) as $payment)
                                                        <tr>
                                                            <td>{{$payment->id}}</td>
                                                            <td>{{$payment->sender->user->name}} ({{__('main.'.substr(strrchr($payment->sender_type, '\\'), 1))}})</td>
                                                            <td>{{$payment->receiver->user->name}}  ({{__('main.'.substr(strrchr($payment->receiver_type, '\\'), 1))}})</td>
                                                            <td>{{$payment->payment_amount}}</td>
                                                            <td>{{$payment->payment_method}}</td>
                                                            <td>{{$payment->due_date}}</td>
                                                            <td>{{$payment->created_at->format('d/m/Y')}}</td>
                                                            <td><a title="delete" class="btn btn-danger"
                                                                   href="{{url('stock/purchase/delete/'.$payment->id)}}">
                                                                    {{trans('main.delete')}}</a>
                                                            </td>
                                                        </tr>
                                                    @endforeach


                                                    </tbody>
                                                </table>

                                            </div>

                                        </div>
                                        <!--End:: Tab Content-->
                                        <!--Begin:: Tab Content-->
                                        <div class="tab-pane" id="refund" role="tabpanel">

                                            <div class="kt-portlet__body" style="padding: unset">

                                                <div class="kt-portlet__head kt-portlet__head--lg">
                                                    <div class="kt-portlet__head-label">

                                                        <h3 class="kt-portlet__head-title">
                                                            {{trans('main.refunds')}}
                                                        </h3>
                                                    </div>
                                                    <div class="kt-portlet__head-toolbar">
                                                        <div class="kt-portlet__head-wrapper">
                                                            <div class="kt-portlet__head-actions">


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--begin: Datatable -->
                                                <table id="datatable-responsive"
                                                       class="display table table-striped table-bordered "
                                                       cellspacing="0"
                                                       style="width:100%">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th>  {{ trans('main.id') }}</th>
                                                        <th> {{ trans('main.supplier') }}  {{ trans('main.name') }}</th>
                                                        <th> {{ trans('main.product') }}</th>
                                                        <th> {{ trans('main.quantity') }}</th>
                                                        <th> {{ trans('main.unit price') }}</th>
                                                        <th>{{ trans('main.vat') }}</th>
                                                        <th>{{ trans('main.gross') }}</th>
                                                        <th>{{ trans('main.note') }}</th>
                                                        <th>{{trans('main.created_at')}}</th>
                                                        <th>{{ trans('main.actions') }}</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach($refunds->take(20) as $refund)
                                                        <tr>
                                                            <td>{{$refund->id}}</td>
                                                            <td>{{$refund->supplier->user->name}}</td>
                                                            <td>{{$refund->product->LangName}}</td>
                                                            <td>{{$refund->quantity}}</td>
                                                            <td>{{$refund->unit_price}}</td>
                                                            <td>{{$refund->vat}}</td>
                                                            <td>{{($refund->quantity*$refund->unit_price)+($refund->quantity*$refund->unit_price)*($refund->vat/100) }}</td>
                                                            <td>{{$refund->note}}</td>
                                                            <td>{{$refund->created_at->format('d/m/Y')}}</td>
                                                            <td>
                                                                <a href="{{url('stock/refund/delete/'.$refund->id)}}" class="btn btn-danger"
                                                                   title="delete">
                                                                                                      {{trans('main.delete')}}</a></td>
                                                        </tr>
                                                    @endforeach

                                                    </tbody>
                                                </table>

                                            </div>

                                        </div>
                                        <!--End:: Tab Content-->


                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>

@stop
@section('scripts')

    <script src="{{asset('/vendors/general/moment/min/moment.min.js')}}" type="text/javascript"></script>
    <script src="{{asset('/vendors/general/bootstrap-daterangepicker/daterangepicker.js')}}" type="text/javascript"></script>
    <script src="{{asset('js/demo1/pages/crud/forms/widgets/bootstrap-daterangepicker.js')}}" type="text/javascript"></script>

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>
        $('table.display').DataTable( {
            responsive: true,
            dom: 'Bflrtip',
            buttons: ['copy', 'excel', 'print'],
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            "pagingType": "full_numbers",
            @if (App::isLocale('ar'))
            "language":dataTableLocale
            @endif
        } );
    </script>
@stop








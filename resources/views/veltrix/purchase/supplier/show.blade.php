@extends('veltrix.layouts.master')

@section('head-after')
    <link href="{{asset('css/demo1/style.bundle.css')}}" rel="stylesheet" type="text/css"/>

    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('vendors/custom/vendors/line-awesome/css/line-awesome.css')}}" rel="stylesheet" type="text/css"/>
    <style>
        #wrapper {
            height: 100%;
            overflow: unset !important;
            width: 100%;
        }
        .footer {
            bottom: unset !important;
        }
        .dataTables_wrapper .dataTable th, .dataTables_wrapper .dataTable th {
            color: white;
        }
    </style>
@stop


@section('title')
    {{trans('main.show supplier')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);"> {{trans('main.show supplier')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')
    <!-- begin:: Content -->


    <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor">



        <!-- begin:: Content -->
        <div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">

            <div class="row">
                <div class="col-xl-4">


                    <!--Begin:: Portlet-->
                    <div class="kt-portlet">
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">
                                    {{trans('main.supplier')}}
                                </h3>
                            </div>

                        </div>
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">
                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">{{trans('main.name')}}:</label>
                                    <div class="col-7">
                                        <span
                                            class="form-control-plaintext kt-font-bolder">{{$supplier->user->name}}</span>
                                    </div>
                                </div>
                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">{{trans('main.email')}}:</label>
                                    <div class="col-7">
                                        <span
                                            class="form-control-plaintext kt-font-bolder">{{$supplier->user->email}}</span>
                                    </div>
                                </div>

                                    <div class="form-group form-group-xs row">
                                        <label class="col-3 col-form-label">phone 1:</label>

                                        <div class="col-7">
                                            <span class="form-control-plaintext kt-font-bolder">{{$supplier->user->phone1}}</span>
                                        </div>
                                    </div>

                                <div class="form-group form-group-xs row">
                                        <label class="col-3 col-form-label">phone 2:</label>

                                        <div class="col-7">
                                            <span class="form-control-plaintext kt-font-bolder">{{$supplier->user->phone2}}</span>
                                        </div>
                                    </div>

                                <div class="form-group form-group-xs row">
                                        <label class="col-3 col-form-label">phone 3:</label>

                                        <div class="col-7">
                                            <span class="form-control-plaintext kt-font-bolder">{{$supplier->user->phone3}}</span>
                                        </div>
                                    </div>


                                    <div class="form-group form-group-xs row">
                                        <label class="col-3 col-form-label"> {{trans('main.address')}}:</label>

                                        <div class="col-7">
                                        <span class="form-control-plaintext kt-font-bolder">
                                            {{$supplier->user->address}}</span>
                                        </div>
                                    </div>


                            </div>

                        </div>
                    </div>

                    <!--End:: Portlet-->




                    <div class="kt-portlet">
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">
                                    {{trans('main.financial')}} {{trans('main.receivables')}}
                                </h3>

                            </div>
                            <div class="kt-portlet__head-toolbar">
                               <a href="{{route('supplier.print.financial',[$supplier->id])}}" style="color: white" class="btn btn-primary">print</a>
                            </div>

                        </div>

                        <div class="kt-portlet__body">
                            <div class="kt-widget1 kt-widget1--fit">
                                <div class="kt-widget1__item">
                                    <div class="kt-widget1__info">
                                        <h3 class="kt-widget1__title">{{trans('main.Starting Balance')}}</h3>
                                        <span class="kt-widget1__desc">{{trans('main.Supplier starting balance')}} </span>
                                    </div>
                                    <span class="kt-widget1__number kt-font-brand">+${{number_format($supplier->start_balance,2)}}</span>
                                </div>
                                <div class="kt-widget1__item">
                                    <div class="kt-widget1__info">
                                        <h3 class="kt-widget1__title">{{trans('main.purchases')}}</h3>
                                        <span class="kt-widget1__desc">{{trans('main.Store gross  purchases')}}</span>
                                    </div>
                                    <span class="kt-widget1__number kt-font-brand">+${{number_format($supplier->purchases_amount,2)}}</span>
                                </div>
                                <div class="kt-widget1__item">
                                    <div class="kt-widget1__info">
                                        <h3 class="kt-widget1__title">{{trans('main.refunds')}}  </h3>
                                        <span class="kt-widget1__desc">{{trans('main.Store gross return to supplier')}} </span>
                                    </div>
                                    <span class="kt-widget1__number kt-font-danger">-${{number_format($supplier->refunds_amount,2)}}</span>
                                </div>
                                <div class="kt-widget1__item">
                                    <div class="kt-widget1__info">
                                        <h3 class="kt-widget1__title">{{trans('main.payment')}}</h3>
                                        <span class="kt-widget1__desc">{{trans('main.Store gross payment')}}</span>
                                    </div>
                                    <span class="kt-widget1__number kt-font-danger">-${{number_format($supplier->paid_amount,2)}}</span>
                                </div>
                                <div class="kt-widget1__item">
                                    <div class="kt-widget1__info">
                                        <h3 class="kt-widget1__title">{{trans('main.dept')}}</h3>
                                        <span class="kt-widget1__desc">{{trans('main.restaurant')}} {{trans('main.dept')}}  </span>
                                    </div>
                                    <span class="kt-widget1__number kt-font-success">${{number_format($supplier->credit_amount,2)}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-xl-8">

                    <!--Begin:: Portlet-->
                    <div class="kt-portlet kt-portlet--tabs">
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-toolbar">
                                <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-brand"
                                    role="tablist">

                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#kt_apps_contacts_view_tab_3"
                                           role="tab">
                                            <i class="flaticon2-calendar-3"></i> {{trans('main.personal')}}
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#kt_apps_supplier_purchases"
                                           role="tab">
                                            <i class="flaticon2-user-outline-symbol"></i> {{trans('main.purchases')}}
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#kt_apps_supplier_payments"
                                           role="tab">
                                            <i class="flaticon2-gear"></i> {{trans('main.payments')}}
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="kt-portlet__body">
                            <div class="tab-content kt-margin-t-20">

                                    <!--End:: Tab Content-->

                                <!--Begin:: Tab Content-->
                                <div class="tab-pane active" id="kt_apps_contacts_view_tab_3" role="tabpanel">
                                    <form class="kt-form kt-form--label-right" method="post"
                                          action="{{route('supplier.update',$supplier->id)}}">
                                        @csrf
                                        {{ method_field('PUT') }}
                                        <div class="kt-portlet__body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    @if ($errors->any())
                                                        <div class="alert alert-danger">
                                                            <ul>
                                                                @foreach ($errors->all() as $error)
                                                                    <li>{{ $error }}</li>
                                                                @endforeach
                                                            </ul>
                                                        </div>
                                                    @endif
                                                    <h3>{{trans('main.personal')}} {{trans('main.information')}}</h3>
                                                    <div class="form-group row">
                                                        <div class="col-12">
                                                            <label>{{trans('main.name')}}:</label>
                                                            <input type="text" required name="name" class="form-control"
                                                                   placeholder="Enter full name" value="{{$supplier->user->name}}">
                                                            </div>
                                                        <div class="col-12">
                                                            <label class="">{{trans('main.email')}}:</label>
                                                            <input type="email" required name="email"
                                                                   value="{{$supplier->user->email}}" class="form-control" placeholder="Enter email">
                                                         </div>
                                                        <div class="col-12">

                                                            <label>{{trans('main.Starting Balance')}} :</label>
                                                            <input type="number" step='0.01' name="balance"
                                                                   value="{{$supplier->start_balance}}"class="form-control">
                                                        </div>
                                                        <div class="col-12">
                                                            <label>{{trans('main.address')}}:</label>
                                                            <input type="text" required name="address" class="form-control"
                                                                   placeholder="Enter full name" value="{{$supplier->user->address}}">
                                                        </div>
                                                        <div class="col-6">
                                                            <label>{{trans('main.phone')}} 1:</label>
                                                            <input type="text"  name="phone1" class="form-control"
                                                                   placeholder="010********" max="11" value="{{$supplier->user->phone1}}">
                                                        </div>
                                                        <div class="col-6">
                                                            <label>{{trans('main.phone')}} 2:</label>
                                                            <input type="text"  name="phone2" class="form-control"
                                                                   placeholder="012********" max="11" value="{{$supplier->user->phone2}}">
                                                        </div>

                                                        <div class="col-12">
                                                            <label>{{trans('main.phone')}} 3:</label>
                                                            <input type="text"  name="phone3" class="form-control"
                                                                   placeholder="011********" max="11" value="{{$supplier->user->phone3}}">
                                                        </div>
                                                    </div>
                                                </div>




                                            </div>
                                        </div>
                                        <div class="kt-portlet__foot">
                                            <div class="kt-form__actions">
                                                <div class="row">
                                                    <div class="col-lg-4"></div>
                                                    <div class="col-lg-8">
                                                        <button type="submit" class="btn btn-primary">{{trans('main.submit')}}</button>
                                                        <button type="reset" class="btn btn-secondary">{{trans('main.cancel')}}</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!--End:: Tab Content-->

                                <!--End:: Tab Content-->

                                <!--Begin:: Tab Content-->
                                <div class="tab-pane" id="kt_apps_supplier_purchases" role="tabpanel">

                                    <div class="kt-portlet__body" style="padding: unset">

                                        <div class="kt-portlet__head kt-portlet__head--lg">
                                            <div class="kt-portlet__head-label">
										<span class="kt-portlet__head-icon">
											<i class="kt-font-brand flaticon2-line-chart"></i>
										</span>
                                                <h3 class="kt-portlet__head-title">
                                                    {{trans('main.restaurant')}} {{trans('main.purchases')}}
                                                </h3>
                                            </div>
                                            <div class="kt-portlet__head-toolbar">
                                                <div class="kt-portlet__head-wrapper">
                                                    <div class="kt-portlet__head-actions">

                                                        <a href="{{url('stock/purchase/create')}}"
                                                           class="btn btn-primary btn-icon-sm">
                                                            <i class="la la-plus"></i>
                                                            {{trans('main.new')}} {{trans('main.purchases')}}
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--begin: Datatable -->
                                       <table id="datatable-responsive"
                                               class="display table table-striped table-bordered " cellspacing="0"
                                               style="width:100%">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th>{{trans('main.id')}}</th>
                                                <th>{{trans('main.supplier')}}</th>
                                                <th>{{trans('main.total')}} {{trans('main.price')}}</th>
                                                <th>{{trans('main.created_at')}}</th>
                                                <th>{{trans('main.action')}}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($supplier->purchases as $purchase)
                                                <tr>
                                                    <td>{{$purchase->id}}</td>
                                                    <td>{{$purchase->supplier->user->name}}</td>
                                                    <td>{{$purchase->total}}</td>
                                                    <td>{{$purchase->created_at->format('d/m/Y')}}</td>

                                                    <td>
                                                        <a title="Show" href="{{url('stock/purchase/show/'.$purchase->id)}}">
                                                            <i class="fa fa-book-open"></i></a>

                                                        {{--                                <a title="delete" href="{{url('product/delete/'.$product->id)}}"> <i style="color: red"--}}
                                                        {{--                                                                                                     class="flaticon-delete"></i></a>--}}
                                                    </td>
                                                </tr>
                                            @endforeach

                                            </tbody>
                                        </table>

                                    </div>
                                </div>

                                <!--End:: Tab Content--> <!--Begin:: Tab Content-->
                                <div class="tab-pane" id="kt_apps_supplier_payments" role="tabpanel">

                                    <div class="kt-portlet__body" style="padding: unset">

                                        <div class="kt-portlet__head kt-portlet__head--lg">
                                            <div class="kt-portlet__head-label">
										<span class="kt-portlet__head-icon">
											<i class="kt-font-brand flaticon2-line-chart"></i>
										</span>
                                                <h3 class="kt-portlet__head-title">
                                                    {{trans('main.restaurant')}} {{trans('main.payments')}}
                                                </h3>
                                            </div>
                                            <div class="kt-portlet__head-toolbar">
                                                <div class="kt-portlet__head-wrapper">
                                                    <div class="kt-portlet__head-actions">

                                                        <a href="{{route('payment.create')}}"
                                                           class="btn btn-primary btn-icon-sm"
                                                           data-toggle="modal" data-target=".new_payment"><i
                                                                class="la la-plus"></i>
                                                            {{trans('main.new')}} {{trans('main.payment')}}
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--begin: Datatable -->
                                         <table id="datatable-responsive"
                                               class="display table table-striped table-bordered " cellspacing="0"
                                               style="width:100%">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th> {{trans('main.id')}}</th>
                                                <th>{{trans('main.amount')}}</th>
                                                <th>{{trans('main.method')}}</th>
                                                <th>{{trans('main.Due Date')}}</th>
                                                <th>{{trans('main.created_at')}}</th>
                                                <th>{{ trans('main.attachments') }}</th>
                                                <th>{{trans('main.action')}}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($supplier->payment as $payment)


                                                <tr>
                                                    <td>{{$payment->id}}</td>
                                                    <td>{{$payment->payment_amount}}</td>
                                                    <td>{{$payment->payment_method}}</td>
                                                    <td>{{$payment->due_date}}</td>
                                                    <td>{{$payment->created_at->format('d/m/Y')}}</td>
                                                    <td>
                                                        @foreach($purchase->files as $file)
                                                            <a title="Show" href="{{url('/download?url='.$file->url)}}">
                                                                {{$loop->index + 1}}<i class="fa fa-cloud-download-alt"></i></a>
                                                        @endforeach

                                                    </td> <td><a title="delete"
                                                           href="{{url('stock/purchase/delete/'.$payment->id)}}">
                                                           {{trans('main.delete')}}</a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            {{--                {{dd($products)}}--}}


                                            </tbody>
                                        </table>

                                    </div>


                                    <div
                                        class="kt-separator kt-separator--space-lg kt-separator--fit kt-separator--border-solid"></div>

                                    <div class="kt-form__actions">

                                    </div>
                                </div>

                                <!--End:: Tab Content-->
                            </div>
                        </div>
                    </div>

                    <!--End:: Portlet-->
                </div>


            </div>
        </div>

        <!-- end:: Content -->
    </div>






    <div class="modal fade new_payment" id="updatemodel" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{route('payment.create')}}" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title">{{trans('main.payment')}} </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        @csrf
                        <div class="container">

                            <div class="row">
                                <div class="form-group col-12">
                                    <label for=""
                                           class=" control-label"> {{ trans('main.current due') }}  </label>
                                    <input type="text" value="{{number_format($supplier->credit_amount,2)}}" readonly class="form-control" id="currentDue">
                                    <div>
                                        <input type="hidden" name="sender_id" value="{{Auth::user()->store->id}}">
                                        <input type="hidden" name="receiver_id" value="{{$supplier->id}}">
                                    </div>
                                </div>

                                <div class=" col-12">
                                    <label for="" class="control-label">{{ trans('main.payment') }} {{ trans('main.method') }}</label>

                                    <select class="form-control select2" id="payment_method"
                                            name="payment_method">
                                        <option value="cash">{{ trans('main.cash') }} </option>
                                        <option value="check">{{ trans('main.check') }} </option>
                                    </select>
                                </div>
                                <div class="form-group col-12">
                                    <label
                                        class=" control-label">  {{ trans('main.payment') }}
                                        :</label>
                                    <input type="number" min="0" required name="payment"
                                           class="form-control"
                                           id="payment" value="" step="0.01">

                                </div>
                                <div class="form-group col-12">
                                    <label
                                        class=" control-label">  {{ trans('main.note') }}
                                        :</label>
                                    <input type="text" name="note"
                                           class="form-control" id="note">

                                </div>
                                <div class="form-group col-12">
                                    <label class=control-label">{{ trans('main.files') }} :</label>
                                    <input type="file" name="files[]" multiple class="form-control">


                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="col-12 pull-left">
                            <button type="submit" class="btn btn-primary btn-icon-sm">{{ trans('main.pay') }}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>








@stop
@section('scripts')

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
    <script>

        $.fn.dataTableExt.ofnSearch['html-input'] = function (value) {
            return $(value).val();
        };
        $(document).ready(function () {
            $('#delete').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('model_id');
                var type = $(e.relatedTarget).data('model_type');
                $(e.currentTarget).find('.model_type').html(type);
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="type"]').val(type);
            });

            $('#update_address').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('id');
                var address = $(e.relatedTarget).data('address');

                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="address"]').val(address);
            });
            $('#update_phone').on('show.bs.modal', function (e) {

                var Id = $(e.relatedTarget).data('id');
                var phone = $(e.relatedTarget).data('phone');
                var type = $(e.relatedTarget).data('type');
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="phone"]').val(phone);
                $(e.currentTarget).find('input[name="type"]').val(type);
            });



        })
    </script>

@stop

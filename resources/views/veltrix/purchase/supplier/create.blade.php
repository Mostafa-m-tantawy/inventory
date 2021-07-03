@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.create supplier')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.create supplier')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="{{route('supplier.create')}}" class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light" >
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
                    <!--begin::Form-->
                    <form class="kt-form kt-form--label-right" method="post" action="{{route('supplier.store')}}">
                      @csrf
                        <div class="kt-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>{{trans('main.personal')}} {{trans('main.information')}}</h5>
                                    <div class="form-group row">
                                        <div class="col-12">
                                            <label>{{trans('main.name')}}:</label>
                                            <input type="text"required name="name" class="form-control" placeholder="Enter full name">
                                        </div>
                                        <div class="col-12">
                                            <label class="">{{trans('main.email')}}:</label>
                                            <input type="email"required name="email" class="form-control" placeholder="Enter email">
                                        </div>

                                        <div class="col-12">
                                            <label>{{trans('main.Starting Balance')}} :</label>
                                            <input type="number" step='0.01' name="balance" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6" id="kt_repeater_1">
                                    <h5>{{trans('main.contact')}} {{trans('main.information')}}</h5>
                                        <div  class="form-group  row">
                                            <div class="col-lg-12">
                                                <label>   {{trans('main.address')}}:</label>
                                                <div class="kt-input-icon kt-input-icon--right">
                                                    <input type="text" name="address" class="form-control"
                                                           required placeholder="Enter your address">
                                                    <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i
                                                                class="la la-map-marker"></i></span></span>
                                                </div>
                                            </div><div class="col-lg-12">

                                                <div  class="row kt-margin-b-10">
                                                    <div class="col-lg-6">
                                                        <label>{{trans('main.phone')}} 1</label>

                                                        <div class="input-group">
                                                            <input type="text" required
                                                                   class="form-control form-control-danger"
                                                                   max="11"
                                                                   name="phone1" placeholder="012**********">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label>{{trans('main.phone')}} 2</label>

                                                        <div class="input-group">
                                                            <input type="text"
                                                                   class="form-control form-control-danger"
                                                                   max="11"
                                                                   name="phone2" placeholder="011**********">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <label>{{trans('main.phone')}} 3</label>

                                                        <div class="input-group">
                                                            <input type="text"
                                                                   class="form-control form-control-danger"
                                                                   max="11"
                                                                   name="phone3" placeholder="010**********">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                </div>


                            </div>
                        </div>
                        <div class="kt-portlet__foot">
                            <div class="kt-form__actions">
                                <div class="row">
                                    <div class="col-lg-12 text-right">
                                        <button type="submit" class="btn btn-primary">{{trans('main.submit')}}</button>
                                        <button type="reset" class="btn btn-secondary">{{trans('main.cancel')}}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!--end::Form-->
                </div>

            </div>
            </div>
            </div>

@stop

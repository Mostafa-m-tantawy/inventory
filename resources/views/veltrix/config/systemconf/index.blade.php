@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.system configuration')}}@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.config')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.system configuration')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')
    <style>

        .upload_image {
            position: relative;
            width: 100%;
            height: 250px;
            text-align: center;
            border: 5px dashed #ececec;

        }

        input[type="file"] {
            position: absolute;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            outline: none;
            opacity: 0;
            left: 0;
            z-index: 9999;
            cursor: pointer;
        }

        .upload_icon {
            width: 150px;
            margin-top: 20px;
            position: absolute;
            left: 0;
            right: 0;
            margin: 0 auto;
            top: 40px;
        }

        #blah {
            height: 240px;
            position: absolute;

            left: 0;
            right: 0;
            margin: 0 auto;
        }

    </style>
    <!-- begin:: Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">



@php
   $logo=   ($systemconf->where('name','logo')->first())?   $systemconf->where('name','logo')->first()->value:'';
   $name=   ($systemconf->where('name','name')->first())?   $systemconf->where('name','name')->first()->value:'';
   $phone=  ($systemconf->where('name','phone')->first())?  $systemconf->where('name','phone')->first()->value:'';
   $mobile= ($systemconf->where('name','mobile')->first())? $systemconf->where('name','mobile')->first()->value:'';
   $vat=    ($systemconf->where('name','vat')->first())?    $systemconf->where('name','vat')->first()->value:'';
   $service=($systemconf->where('name','service')->first())?$systemconf->where('name','service')->first()->value:'';
   $months= ($systemconf->where('name','months')->first())? $systemconf->where('name','months')->first()->value:'';
   $method= ($systemconf->where('name','method')->first())? $systemconf->where('name','method')->first()->value:'';
@endphp
    <!-- begin:: Content -->


                    <!--begin::Form-->
                    <form class="kt-form kt-form--label-right" method="post" action="{{route('system-conf.store')}}" enctype="multipart/form-data">
                        @csrf  <div class="kt-portlet__body">
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

                                    <h3> {{trans('main.system configuration')}}  </h3>
                                    <div class="row">

                                        <div class="upload_image form-group" >

                                            <input type="file" name="logo"  id="imgInp" />
                                            <img class="upload_icon" src="{{asset('images/upload_img.png')}}" alt="">
                                            <img id="blah"class="img-fluid" src="{{asset($logo)}}" />

                                        </div>

                                        <div class="col-12 form-group">

                                            <label> {{trans('main.name')}} </label>
                                            <input type="name"  required  value="{{$name}}" name="name" class="form-control" placeholder="14">
                                        </div>

                                        <div class="col-12 form-group">

                                            <label> {{trans('main.phone')}} </label>
                                            <input type="text"    value="{{$phone}}" name="phone" class="form-control" placeholder="0221358746">
                                        </div>

                                        <div class="col-12 form-group">

                                            <label> {{trans('main.mobile')}} </label>
                                            <input type="text"  value="{{$mobile}}" name="mobile" class="form-control" placeholder="01025232862">
                                        </div>

                                        <div class="col-12 form-group">

                                            <label> {{trans('main.vat')}} %</label>
                                            <input type="number" step="0.01" required  value="{{$vat}}" name="vat" class="form-control" placeholder="14">
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="">{{trans('main.service')}} %</label>
                                            <input type="number" step="0.01" required value="{{$service}}"name="service" class="form-control" placeholder="12">
                                        </div>
                                        <div class="col-12 form-group">
                                            <label class="">{{trans('main.cost method')}}:</label>
                                            <select name="methodd" id="methodd" required  class="form-control select2" >
                                                <option value="">{{trans('main.select')}}  {{trans('main.method')}} </option>
                                                <option value="last_cost">{{trans('main.last')}} {{trans('main.cost')}}</option>
                                                <option value="avg_cost"> {{trans('main.average')}} {{trans('main.cost')}}</option>
                                            </select>
                                        </div>
                                        <div class="col-12 form-group" id="divmonth"  style="display: none">
                                            <label class="">{{trans('main.number of months')}} :</label>
                                            <input type="number" step="1" name="months"value="{{$months}}"  class="form-control" placeholder="6">
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

@section('scripts')
    <script src="{{asset('/js/demo1/pages/crud/forms/widgets/dropzone.js')}}" type="text/javascript"></script>

   <script>
        $(document).ready(function () {


            $('#methodd').change(function () {
                $('#divmonth').css('display', 'none');

                if ($(this).val() == 'avg_cost')
                    $('#divmonth').css('display', 'block');
            });

            $('#methodd').val('{{ $method}}');
            if('{{ $method}}'){
                $('#divmonth').css('display', 'block');

            }
        })
    </script>

@stop

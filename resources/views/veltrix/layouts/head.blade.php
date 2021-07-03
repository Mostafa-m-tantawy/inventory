<!-- App favicon -->
<link rel="shortcut icon" href="{{ URL::asset('img/favicons/favicon.ico') }}">

@yield('head')

 <!-- App css -->
<link href="{{ URL::asset('veltrix/assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('veltrix/assets/css/metismenu.min.css') }}" rel="stylesheet" type="text/css">
<link href="{{ URL::asset('veltrix/assets/css/icons.css') }}" rel="stylesheet" type="text/css" />
<link href="{{ URL::asset('veltrix/assets/css/style.css') }}" rel="stylesheet" type="text/css" />
<link href="{{asset('vendors/general/select2/dist/css/select2.min.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('vendors/general/toastr/build/toastr.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('vendors/general/@fortawesome/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('vendors/general/bootstrap-daterangepicker/daterangepicker.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('vendors/custom/vendors/line-awesome/css/line-awesome.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('vendors/custom/vendors/flaticon/flaticon.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('vendors/custom/vendors/flaticon2/flaticon.css')}}" rel="stylesheet" type="text/css"/>

@yield('head-after')

<meta name="csrf-token" content="{!! csrf_token() !!}">

@toastr_css
<style>
    .badge-light{background-color: white !important;}
</style>

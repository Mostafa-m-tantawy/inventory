
@extends( (!Request()->route())? 'errors.layout':((Request()->route()->getPrefix()=='/pos')?'pos.layout.pos_app' :'layouts.welcome') )
@section('title')
    {{trans('main.error')}} - @yield('code')
@stop

@section('head')

    <!--begin::Page Custom Styles(used by this page) -->
    <link href="{{asset('/css/demo1/pages/general/error/error-6.css')}}" rel="stylesheet" type="text/css" />

    <!--end::Page Custom Styles -->
@stop
@section('content')

    <div class="kt-grid kt-grid--ver kt-grid--root">
        <div class="kt-grid__item kt-grid__item--fluid kt-grid  kt-error-v6"style="background-attachment: unset;background-image: url({{asset('/media//error/bg6.jpg')}});" >
            <div class="kt-error_container">
                <div class="kt-error_subtitle kt-font-light">
                    <h1> @yield('code')</h1>
                </div>
                <p class="kt-error_description kt-font-light">
                    @yield('message')
                </p>
            </div>
        </div>
    </div>
@stop

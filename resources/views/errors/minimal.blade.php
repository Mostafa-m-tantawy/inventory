
@extends( (!Request()->route())? 'errors.layout':'veltrix.layouts.master') )

@section('title')
    {{trans('main.error')}} - @yield('code')
@stop
@section('content')
    <!-- Begin page -->
        <div class="ex-pages" style="max-height: 500px">
            <div class="content-center"style="max-height: 500px">
                <div class="content-desc-center">
                    <div class="container">
                        <div class="card mo-mt-2">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-lg-4 offset-lg-1">
                                        <div class="ex-page-content">
                                            <h1 class="text-dark">@yield('code')</h1>
                                            <h4 class="mb-4">@yield('message')</h4>
                                            <a class="btn btn-primary mb-5 waves-effect waves-light" href="{{route('home')}}"><i class="mdi mdi-home"></i> Back to Dashboard</a>
                                        </div>

                                    </div>
                                    <div class="col-lg-5 offset-lg-1">
                                        <img src="{{ URL::asset('assets/images/error.png') }}" alt="" class="img-fluid mx-auto d-block">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end container -->
                </div>
            </div>
        </div>
        <!-- end error page -->
@endsection

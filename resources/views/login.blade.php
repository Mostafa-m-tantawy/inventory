@extends('veltrix.layouts.master-blank')

@section('content')
    <div class="home-btn d-none d-sm-block">
        <a href="index" class="text-dark"><i class="fas fa-home h2"></i></a>
    </div>

    <div class="wrapper-page">
        <div class="card overflow-hidden account-card mx-3">
            <div class="bg-primary p-4 text-white text-center position-relative">
                <p class="text-white-50 mb-4">{{trans('main.Login To Your Account')}}</p>
                <a href="{{url('/')}}" class="logo logo-admin">
                    <img src="{{asset('/media/logos/favicon.ico')}}"
                                                                    height="50" alt="logo"></a>
            </div>

            <div class="account-card-content">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form class="form-horizontal m-t-30" action="{{ route('login') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label for="username">{{trans('main.Email')}}</label>
                        <input class="form-control" type="email" required placeholder="{{trans('main.Email')}}"
                               name="email" value="demo@recipe.com">

                        @error('email')
                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                        @enderror

                    </div>

                    <div class="form-group">
                        <label for="userpassword">{{trans('main.Password')}}</label>
                        <input class="form-control form-control-last" required type="Password"
                               placeholder="{{trans('main.Password')}}" name="password" value="123456">

                        @error('password')
                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                        @enderror
                    </div>

                    <div class="form-group row m-t-20">
                        <div class="col-sm-6">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customControlInline" name="remember"  {{ old('remember') ? 'checked' : '' }}>

                                <label class="custom-control-label" for="customControlInline">
                                    {{trans('main.Remember me')}}
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-6 text-right">
                            <button class="btn btn-primary w-md waves-effect waves-light"
                                    type="submit"> {{trans('main.Sign In')}}</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>

        <div class="m-t-40 text-center">
            <p>Don't have an account ? <a href="{{route('register')}}"
                                          class="font-500 text-primary"> {{trans('main.Get An Account')}} </a></p>
        </div>

    </div>
    <!-- end wrapper-page -->
@endsection

@section('script')
@endsection

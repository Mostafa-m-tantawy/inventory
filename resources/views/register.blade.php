@extends('veltrix.layouts.master-blank')

@section('content')
       <div class="home-btn d-none d-sm-block">
            <a href="index" class="text-dark"><i class="fas fa-home h2"></i></a>
        </div>

        <div class="wrapper-page">
            <div class="card overflow-hidden account-card mx-3">
                <div class="bg-primary p-4 text-white text-center position-relative">
                    <h4 class="font-20 m-b-15">Free Register</h4>
                    <a href="index" class="logo logo-admin"><img src="{{url('media/logos/recipe2.png')}}" height="50" alt="logo"></a>
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
                    <form class="form-horizontal m-t-30" action="{{route('restaurant.store')}}" method="post">
@csrf
                        <div class="form-group">
                            <label for="useremail">{{trans('main.Email')}}</label>
                            <input type="email" class="form-control" id="useremail" name="email" placeholder="{{trans('main.Enter email')}}">
                        </div>

                        <div class="form-group">
                            <label for="username">{{trans('main.Full Name')}}</label>
                            <input type="text" class="form-control"  name="name"  id="username" placeholder="{{trans('main.Enter full name')}}">
                        </div>

                        <div class="form-group">
                            <label for="userpassword">{{trans('main.Password')}}</label>
                            <input type="password" name="password" class="form-control" id="userpassword" placeholder="********">
                        </div>
                        <div class="form-group">
                            <label for="confirmuserpassword">{{trans('main.Confirm Password')}}</label>
                            <input type="password"
                                   name="password_confirmation"
                                  class="form-control" id="confirmuserpassword" placeholder="********">
                        </div>

                        <div class="form-group row m-t-20">
                            <div class="col-12 text-right">
                                <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Register</button>
                            </div>
                        </div>


                    </form>
                </div>
            </div>

            <div class="m-t-40 text-center">
                <p>{{trans('main.Already have an account')}} <a href="{{route('home')}}" class="font-500 text-primary"> {{trans('main.Sign In')}} </a> </p>
            </div>

        </div>
        <!-- end wrapper-pags -->
@endsection

@section('script')
@endsection

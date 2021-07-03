   <!-- Top Bar Start -->
   <div class="topbar">

<!-- LOGO -->
<div class="topbar-left">

    <a href="{{route('home')}}" class="logo">
        <span>
                <img src="{{url('media/logos/recipe2.png')}}" alt="" height="88">
            </span>
        <i>
                <img src="{{asset('/media/logos/favicon.ico')}}" alt="" height="52">
            </i>
    </a>
</div>

<nav class="navbar-custom">
    <ul class="navbar-right d-flex list-inline float-right mb-0">


        <!-- language-->
        <li class="dropdown notification-list d-none d-md-block">
            <a class="nav-link dropdown-toggle arrow-none waves-effect" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">

                @if (App::isLocale('ar'))
                    <img src="{{asset('/media/flags/008-saudi-arabia.svg')}}" class="mr-2" height="12" alt=""/> العربية <span class="mdi mdi-chevron-down"></span>
                @else
                    <img src="{{asset('veltrix/assets/images/flags/us_flag.jpg')}}" class="mr-2" height="12" alt=""/> English <span class="mdi mdi-chevron-down"></span>
                @endif
            </a>
            <div class="dropdown-menu dropdown-menu-right language-switch">
                @if (App::isLocale('ar'))
                    <a class="dropdown-item" href="{{route('chang-lang',['lang'=>'en'])}}">
                        <img src="{{asset('veltrix/assets/images/flags/us_flag.jpg')}}" alt="" height="16" />
                        <span> English </span>
                    </a>
                @else
                    <a class="dropdown-item" href="{{route('chang-lang',['lang'=>'ar'])}}">
                        <img src="{{asset('/media/flags/008-saudi-arabia.svg')}}" alt="" height="16" />
                        <span> العربية </span>
                    </a>
                @endif


               </div>
        </li>

        <!-- full screen -->
        <li class="dropdown notification-list d-none d-md-block">
            <a class="nav-link waves-effect" href="#" id="btn-fullscreen">
                <i class="mdi mdi-fullscreen noti-icon"></i>
            </a>
        </li>

        <li class="dropdown notification-list">
            <div class="dropdown notification-list nav-pro-img">
                <a class="dropdown-toggle nav-link arrow-none waves-effect nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                    <img src="{{asset('veltrix/assets/images/users/user-4.jpg')}}" alt="user" class="rounded-circle">
                </a>
                <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                    <!-- item-->
                    <a class="dropdown-item" href="{{route('personal.profile')}}"><i class="mdi mdi-account-circle m-r-5"></i> Profile</a>
                    <a class="dropdown-item d-block" href="#"><span class="badge badge-success float-right">11</span><i class="mdi mdi-settings m-r-5"></i> Settings</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="{{url('logout')}}"><i class="mdi mdi-power text-danger"></i> Logout</a>
                </div>
            </div>
        </li>

    </ul>

    <ul class="list-inline menu-left mb-0">
        <li class="float-left">
            <button class="button-menu-mobile open-left waves-effect">
                <i class="mdi mdi-menu"></i>
            </button>
        </li>

    </ul>

</nav>

</div>
<!-- Top Bar End -->

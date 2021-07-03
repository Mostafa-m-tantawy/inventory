<!-- ========== Left Sidebar Start ========== -->
<div class="left side-menu">
    <div class="slimscroll-menu" id="remove-scroll">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu" id="side-menu">
                <li class="menu-title">{{trans('main.Inventory')}}</li>
                @can('stock dashboard')
                    <li>
                        <a href="{{route('dashboard.stock')}}" class="waves-effect">
                            <i class="ti-home"></i>
                            {{--                            <span class="badge badge-primary badge-pill float-right">2</span>--}}
                            <span> {{trans('main.dashboard')}} </span>
                        </a>
                    </li>
                @endcan



                @if(Auth::user()->canAny(['index product','index product category','index unit']))

                    <li>
                        <a href="javascript:void(0);" class="waves-effect"><i class="ti-layout-grid3"></i>
                            <span> {{trans('main.product')}} <span class="float-right menu-arrow">
                                            <i class="mdi mdi-chevron-right"></i></span> </span></a>
                        <ul class="submenu">
                            @can('index product')
                                <li><a href="{{route('product.index')}}">{{trans('main.products')}}</a></li>
                            @endcan

                            @can('index product category')
                                <li><a href="{{route('product-category.index')}}">{{trans('main.category')}}</a></li>
                            @endcan
                            @can('index unit')
                                <li><a href="{{route('unit.index')}}">{{trans('main.units')}}</a></li>
                            @endcan
                        </ul>
                    </li>
                @endcan

                {{--                    @if(Auth::user()->canAny(['index product']))--}}

                <li>
                    <a href="javascript:void(0);" class="waves-effect"><i class="ti-shopping-cart"></i>
                        <span> {{trans('main.open-stock')}}<span class="float-right menu-arrow">
                                            <i class="mdi mdi-chevron-right"></i></span> </span></a>
                    <ul class="submenu">
                        {{--                            @can('index product')--}}
                        <li><a href="{{route('open-stock.index')}}">{{trans('main.index')}}</a></li>
                        {{--                            @endcan--}}

                        {{--                            @can('index product category')--}}
                        <li><a href="{{route('open-stock.detailed')}}">{{trans('main.detailed open-stock')}}</a></li>
                        {{--                            @endcan--}}
                    </ul>
                </li>
                {{--                @endcan--}}
                @if(Auth::user()->canAny(['index department','stock restaurant','index assign stock','index ruined product']))
                    <li>
                        <a href="javascript:void(0);" class="waves-effect"><i class="ti-save"></i>
                            <span> {{trans('main.stock Management')}}<span class="float-right menu-arrow">
                                            <i class="mdi mdi-chevron-right"></i></span> </span></a>
                        <ul class="submenu">
                            @can('stock restaurant')
                                <li><a href="{{route('stock.index')}}">{{trans('main.Main stock')}}</a></li>
                            @endcan

                            {{--                            @can('index department')--}}
                            {{--                                <li><a href="{{route('center.index')}}">{{trans('main.center')}}</a></li>--}}
                            {{--                            @endcan  --}}
                            @can('index department')
                                <li><a href="{{route('department.index')}}">{{trans('main.department')}}</a></li>
                            @endcan

                            @can('index assign stock')
                                <li><a href="{{url('stock/assign/index')}}">{{trans('main.assign')}}</a></li>
                            @endcan
                            @can('index ruined product')
                                <li><a href="{{route('ruined.index')}}">{{trans('main.ruined')}}</a></li>
                            @endcan
                        </ul>
                    </li>
                @endcan



                <li class="menu-title">{{trans('main.purchases')}}</li>

                <li>
                    <a href="{{route('supplier.index')}}" class="waves-effect">
                        <i class="ti-truck"></i>
                        <span> {{trans('main.suppliers')}} </span></a>
                </li>

                @if(Auth::user()->canAny(['summery purchase','index refund','details purchase']))

                    <li>
                        <a href="javascript:void(0);" class="waves-effect"><i class="ti-shopping-cart-full"></i>
                            <span> {{trans('main.purchases')}} <span class="float-right menu-arrow">
                                            <i class="mdi mdi-chevron-right"></i></span> </span></a>
                        <ul class="submenu">
                            @can('summery purchase')
                                <li><a href="{{url('stock/purchase/summery')}}">{{trans('main.purchases')}}</a></li>
                            @endcan

                            @can('index refund')
                                <li><a href="{{route('refund.index')}}">    {{trans('main.refunds')}}</a></li>
                            @endcan
                            @can('details purchase')
                                <li>
                                    <a href="{{url('stock/purchase/detailed')}}">{{trans('main.detailed purchases')}}</a>
                                </li>
                            @endcan
                        </ul>
                    </li>

                @endcan

                <li class="menu-title">{{trans('main.sales')}}</li>

                <li>
                    <a href="{{route('stock.sales.index')}}" class="waves-effect">
                        <i class="ti-truck"></i>
                        <span> {{trans('main.sales')}} </span></a>
                </li>


                <li class="menu-title">{{trans('main.system')}}</li>

                @can('index role')

                    <li>
                        <a href="{{url('conf/role')}}" class="waves-effect">
                            <i class="ti-home"></i>
                            <span> {{trans('main.role')}}</span>
                        </a>
                    </li>
                @endcan


                @can('system configuration')


                    <li>
                        <a href="{{route('system-conf.index')}}" class="waves-effect">
                            <i class="ti-home"></i>
                            <span> {{trans('main.system configuration')}}</span>
                        </a>
                    </li>
                @endcan

            </ul>

        </div>
        <!-- Sidebar -->
        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->

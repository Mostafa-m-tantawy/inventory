
<!--Site footer-->

<footer class="site-footer section-spacing" >
    <div class="container">
       <div class="row footer-col-spacing" style="padding: unset; margin:unset" >
            <div class="col-md-4 footer-logo" style="top: -50px"> <a href="{{url('')}}">
                    <img style="max-width: 300px" class="img-fluid" src="{{asset('img/logofooter.png')}}" alt="logo footer"></a> </div>


            <div class="col-sm-4 col-md-3">
                <ul class="footer-nav">
                    <li>
                        <h3>{{trans('main.CONTACT US')}}</h3>
                    </li>
                    <li>{{trans('main.Call us')}} <a href="tel:+201221617009">+201221617009</a></li>
                    <li>{{trans('main.Call us')}} <a href="tel:+201025232862">+201025232862</a></li>
                    <li><a href="mailto:Mostafa.m.tantawy@gmail.com">Mostafa.m.tantawy@gmail.com</a></li>
                </ul>
            </div>
            <!--Use clearfix after every 12 columns-->
{{--            <div class="clearfix visible-sm-block"></div>--}}
{{--            <div class="col-md-3">--}}
{{--                <ul class="social">--}}
{{--                    <li><a href="#" class="a-facebook"><i class="fa fa-facebook"></i></a></li>--}}
{{--                    <li><a href="#" class="a-twitter"><i class="fa fa-twitter"></i></a></li>--}}
{{--                  </ul>--}}
{{--            </div>--}}
        </div>
    </div>
    <a href="#" class="chat-btn" data-toggle="modal" data-target="#modal-contact-form"></a> </footer>

<!--Site footer end-->

<!--Copyright terms-->

<footer class="copyright-terms">
    <div class="container">
        <div class="row">
            <div class="col-sm-5 col-md-6"> <small> &copy; 2020 MostafaTantawy.com. All rights reserved.</small> </div>
            <div class="col-sm-7 col-md-6">
                <ul class="terms-privacy">
                    <li><a href="#" data-toggle="modal" data-target="#modal-terms">{{trans('main.Terms')}}</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#modal-terms">{{trans('main.Privacy')}}</a></li>
                    <li><a href="#" data-toggle="modal" data-target="#modal-terms">{{trans('main.Cookies')}}</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

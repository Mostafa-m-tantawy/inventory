<!DOCTYPE html>
<!--[if IE 9 ]>
<html class="ie9"> <![endif]-->
<html>

<!-- Mirrored from csmthemes.com/themes/archer/video/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Dec 2019 17:37:37 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/><!-- /Added by HTTrack -->
@include('website.parsial.head')
<body>

<!--hero section-->

<header class="hero-section">

    <!--navigation-->

    <nav class="navbar navbar-default" data-spy="affix" data-offset-top="450">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="{{url('/')}}" style="    margin-top: -70px;">
                    <img class="logo img-fluid" style="width: 250px;" alt="logo" src="{{asset('img/recipe4.png')}}">
                    <img style="    margin-top: 60px;" class="logo-nav" alt="logo-nav" src="{{asset('img/recipe.png')}}">
                </a>
            </div>
            <ul class="nav navbar-nav navbar-right">

                @if (App::isLocale('ar'))
                    <li class="hidden-xs hidden-sm"><a href="{{url('chang-lang')}}?lang=en">English</a></li>
                @else
                    <li class="hidden-xs hidden-sm"><a href="{{url('chang-lang')}}?lang=ar">عربي</a></li>
                @endif

                <li class="hidden-xs hidden-sm"><a href="#how_it_work">{{trans('main.how it work')}}</a></li>
                <li class="hidden-xs hidden-sm"><a href="#video">{{trans('main.video')}}</a></li>
                <li class="hidden-xs hidden-sm"><a href="#faq">{{trans('main.FAQ')}}</a></li>
                <li class="hidden-xs"><a href="#about">{{trans('main.About us')}}</a></li>
                <li class="hidden-xs"><a href="{{route('home')}}">{{trans('main.login')}}</a></li>
               <li class="hidden-md hidden-lg"><a id="toggle"><i class="fa fa-bars fa-2x"></i><i
                            class="fa fa-times fa-2x"></i></a></li>
            </ul>
        </div>
    </nav>


    <!--navigation end-->

    <!--mobile navigation-->

    <div class="mobile-nav-overlay hidden-md hidden-lg" id="mobile-nav-overlay">
        <nav class="mobile-nav">
            <ul>
                @if (App::isLocale('ar'))
                    <li ><a href="{{url('chang-lang')}}?lang=en">English</a></li>
                @else
                    <li ><a href="{{url('chang-lang')}}?lang=ar">عربي</a></li>
                @endif
                    <li><a href="#how_it_work">{{trans('main.how it work')}}</a></li>
                <li><a  href="#video">{{trans('main.video')}}</a></li>
                <li><a href="#faq">{{trans('main.FAQ')}}</a></li>
                <li><a href="#about">{{trans('main.About us')}}</a></li>
            </ul>
        </nav>
    </div>

    <!--mobile navigation end-->

    <!--welcome message-->

    <section class="container text-center welcome-message">
        <div class="row">
            <div class="col-md-12">
                <h1>{{trans('main.Recipe System  Provide What You Need and More!')}}</h1>
                <h2>{{trans('main.We Provide Support for customize solution and Free updates')}}</h2>
                <a href="#how_it_work" class="btn btn-cta-hero">{{trans('main.how it work')}}</a></div>
        </div>
    </section>

    <!--welcome message end-->

</header>

<!--hero section end-->

<!--How it works-->

<section class="how-it-works section-spacing" id="how_it_work">
    <div class="container">
        <header class="section-header text-center">
            <h2>{{trans('main.how it work')}}</h2>
            <h3>{{trans('main.discover how is the Recipe System work.')}}</h3>
        </header>
        <div class="row">
            <div class="col-md-11 center-block">

                <!--step 1-->
                <div class="row">
                    <div class="col-md-6 col-md-push-6 text-center">
                        <img style="max-width: 300px" src="img/warehouse.jpg" alt="step-1"></div>
                    <div class="col-md-6 col-md-pull-6">
                        <div class="step-number"><span>1</span></div>
                        <h4>{{trans('main.Stock')}}</h4>
                        <p>{{trans('main.Manage restaurant stores.')}}</p>
                        <p>{{trans('main.Manage departments stores.')}}</p>
                        <p>{{trans('main.Manage ruined products from restaurant or departments.')}}</p>
                        <p>{{trans('main.transfer between stores an departments.')}}</p>
                        <p>{{trans('main.Opening Stock for stores.')}}</p>
                        <p>{{trans('main.Describe and categorise products.')}}</p>
                        <p>{{trans('main.Instant Reports for stock in stores an departments.')}}</p>
                        <p>{{trans('main.Reports about life cycle of products.')}}</p>

                      </div>
                </div>
                <!--step 1 end-->

                <div class="row">
                    <div class="col-md-6  text-center">
                        <img style="max-width: 300px" src="img/Supplier.jpg" alt="step-2"></div>
                    <div class="col-md-6 ">
                        <div class="step-number"><span>2</span></div>
                        <h4>{{trans('main.purchase')}}</h4>
                        <p>{{trans('main.Make suppliers and all details related.')}}</p>
                        <p>{{trans('main.link  products to Supplier to add vat.')}}</p>
                        <p>{{trans('main.Manage later and cash payments.')}}</p>
                        <p>{{trans('main.Manage refund products to suppliers.')}}</p>
                        <p>{{trans('main.Reports for Purchasing and refunds.')}}</p>
                        <p>{{trans('main.Report for financial affairs for every Supplier.')}}</p>
                    </div>


                </div>
                <!--step 1 end-->

                <!--step 2-->
                <div class="row">
                    <div class="col-md-6 text-center col-md-push-6">
                        <img style="max-width: 300px" src="img/cost.jpg" alt="step-3"></div>
                    <div class="col-md-6 col-md-pull-6">
                        <div class="step-number"><span>3</span></div>
                        <h4>{{trans('main.Cost')}}</h4>
                        <p>{{trans('main.Make menus dishes and dish sizes.')}}</p>
                        <p>{{trans('main.make side dishes and extras.')}}</p>
                        <p>{{trans('main.make recipes for every size.')}}</p>
                        <p>{{trans('main.stock will be affected by sold dishes.')}}</p>
                        <p>{{trans('main.Report of Costs depends on cost configurations.')}}</p>
                    </div>
                </div>
                <!--step 2 end-->

                <!--step 3-->
                <div class="row">
                    <div class="col-md-6  text-center">
                        <img style="max-width: 300px" src="img/pointofsales.png" alt="step-4"></div>
                    <div class="col-md-6 ">
                        <div class="step-number"><span>4</span></div>
                        <h4>{{trans('main.Point of sales')}}</h4>
                        <p>{{trans('main.Manage restaurant halls and tables.')}}</p>
                        <p>{{trans('main.Make hall ,Delivery and Takeaway Orders.')}}</p>
                        <p>{{trans('main.Transfer order between tables.')}}</p>
                        <p>{{trans('main.Merge Tables and keep or empty table.')}}</p>
                        <p>{{trans('main.Split Orders and invoices.')}}</p>
                        <p>{{trans('main.Close order and reopen order.')}}</p>
                        <p>{{trans('main.Print Invoices For Clients.')}}</p>
                        <p>{{trans('main.Print Dishes for Departments.')}}</p>
                        <p>{{trans('main.Live Kitchen Page that following open orders.')}}</p>
                        <p>{{trans('main.Can Discount Fixed amount.')}}</p>
                        <p>{{trans('main.Manage Payments with different ways to pay.')}}</p>
                        <p>{{trans('main.Make Safes and assign it to Employee.')}}</p>
                        <p>{{trans('main.Close Shift and Shift Details.')}}</p>
                        <p>{{trans('main.Report for all Closed Shifts.')}}</p>
                    </div>
                </div>

                <!--step 3-->
                <div class="row">
                    <div class="col-md-6 col-md-push-6 text-center">
                        <img style="max-width: 300px" src="img/pointofsales.png" alt="step-5"></div>
                    <div class="col-md-6 col-md-pull-6">
                        <div class="step-number"><span>5</span></div>
                        <h4>{{trans('main.Customer Relationship Management')}}</h4>
                        <p>{{trans('main.Create Clients with all details.')}}</p>
                        <p>{{trans('main.Create Accounts for deposit payments.')}}</p>
                        <p>{{trans('main.Manage Client Reservations.')}}</p>
                        <p>{{trans('main.Link Clients to orders.')}}</p>
                        <p>{{trans('main.Print Clients details on Invoice.')}}</p>

                    </div>
                </div>
                <!--step 3 end-->

                <!--step 4-->
                <div class="row">
                    <div class="col-md-6 text-center"><img style="max-width: 300px" src="img/hr.jpg" alt="step-6"></div>
                    <div class="col-md-6">
                        <div class="step-number"><span>6</span></div>
                        <h4>{{trans('main.Human Resources')}}</h4>
                        <p> {{trans('main.Create Employees  and assign roles to them.')}}</p>
                        <p> {{trans('main.Every Role Has limit Permissions.')}}</p>
                        <p> {{trans('main.Employee Attends and Absents.')}}</p>
                        <p> {{trans('main.Create Shifts and decide if fixed or flexible times.')}}</p>
                        <p> {{trans('main.create Payrolls.')}}</p>
                        <p> {{trans('main.Create PaySlip For every Employee.')}}</p>
                        <p> {{trans('main.Manage Earnings And Deduction.')}}</p>
                        <p> {{trans('main.Report for Every Payslip with all details about late and over times.')}}</p>
                        <p> {{trans('main.Calculate Social Insurances (optional).')}}</p>
                        <p> {{trans('main.Approve cycles.')}} :
                        <ul>
                            <li>{{trans('main.High Level Approval.')}}</li>
                            <li>{{trans('main.Chain Approval.')}}</li>
                            <li>{{trans('main.Group Approval.')}}</li>
                        </ul>
                         </div>
                </div>
                <!--step 4 end-->

            </div>
        </div>
    </div>
</section>

<!--How it works end-->


<!--video intro-->

<div class="video-intro section-spacing" id="video">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-push-6">
                <iframe style="width: 100%" height="315"
                        src="https://www.youtube.com/embed/EvkrQxriOHI"
                        frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </div>
            <div class="col-md-5 col-md-offset-2 col-md-pull-6">
                <article>
                    <h2>{{trans('main.Video demonstrating Recipe System')}}</h2>
                    <p>{{trans('main.Brief introduction demo video highlighting the important advantages of Recipe System and explaining the working.')}}</p>
                </article>
            </div>
        </div>
    </div>
</div>

<!--video intro end-->


<!--cta info-->


<!--FAQ-->

<section class="faq section-spacing" id="faq">
    <div class="container">
        <header class="section-header text-center">
            <h2>{{trans('main.FAQ')}}</h2>
            <h3>{{trans('main.Common questions and answers')}}</h3>
        </header>
        <div class="row">
            <div class="col-md-8">
                <ul class="row faq-list">
                    <li class="col-sm-6">
                        <h4>{{trans('main.Is Recipe System Local or online system?')}}</h4>
                        <p>{{trans('main.It is possible to make it only local or only online but we prefer make mix of both of them.')}}</p>
                    </li>
                    <li class="col-sm-6">
                        <h4>{{trans('main.Is Our information can be shared if it is online?(security)')}}</h4>
                        <p>{{trans('main.No One can share restaurant information.There is no way to do this because of separated databases.')}}</p>
                    </li>

                    <!--Use clearfix after every 12 columns-->
                    <li class="clearfix hidden-xs"></li>
                    <li class="col-sm-6">
                        <h4>{{trans('main.Who can access the System?')}}</h4>
                        <p>{{trans('main.It is your responsibility to create roles. Every role have permissions you have to assign.If role have not permission he/she can not access this section.')}}</p>
                    </li>
                    <li class="col-sm-6">
                        <h4>{{trans('main.Can I have some changes or customization?')}}</h4>
                        <p>{{trans('main.Of course Our team support customization.All what you have to to contact us.')}}</p>
                    </li>
                </ul>
            </div>
            <div class="col-md-4">
                <div class="faq-support text-center">
                    <h5>{{trans('main.CAN\'T FIND A SUITABLE ANSWER?')}}</h5>
                    <p>{{trans('main.Ask our Support team')}}</p>
                    <a href="#" class="btn btn-secondary" data-toggle="modal" data-target="#modal-contact-form"><i
                            class="fa fa-envelope"></i>{{trans('main.EMAIL US')}}</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!--FAQ end-->


<!--About us -->

<section class="about-us section-spacing" id="about">
    <div class="container">
        <header class="section-header text-center">
            <h2>{{trans('main.About us')}}</h2>
        </header>
        <div class="row about-us-into">
            <div class="col-md-10 center-block">
                <div class="row">
                    <div class="col-md-6">
                        <article>
                            <h4>{{trans('main.system.')}}</h4>
                            <p>{{trans('main.Web Based Programing system that make it easy to work or follow the work without being in restaurant.')}}</p>
                        </article>
                    </div>
                    <div class="col-md-6">
                        <article>
                            <h4>{{trans('main.support.')}}</h4>
                            <p> {{trans('main.Team of specialised developers work to update and solve any problem it would  appear.And ready to customize clients demands.')}}</p>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--About us end-->


<!--cta-->

<section class="cta section-spacing text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-8 center-block">
                <h2>{{trans('main.Signup for a 30 days')}}
                    <em>{{trans('main.free')}}</em> {{trans('main.trial account no credit card required.')}}</h2>
                <a href="{{route('register')}}" class="btn">{{trans('main.Get Started')}}</a></div>
{{--                <a data-toggle="modal" data-target="#modal-contact-form" class="btn">{{trans('main.Get Started')}}</a></div>--}}
        </div>
    </div>
</section>

<!--cta end-->

<!--Features cta end-->
@include('website.parsial.contact')
@include('website.parsial.footer')

<!--Copyright terms end-->


<!--contact form modal-->

@include('website.parsial.policy')
<!--contact form modal end-->
@include('website.parsial.scripts')

<script>
    $('document').ready(function () {

        var form = $('form');

        form.on('submit', function (e) {
            e.preventDefault();


                $.ajax({
                    type: form.attr('method'),
                    url: form.attr('action'),
                    data: form.serialize(),
                    success: function (data) {
                        $('#modal-contact-form').modal('toggle');
                        // toastr.success("Submission was successful.");
                        // location.reload();

                    },
                    error: function (data) {
                        // $('#modal-contact-form').modal('toggle');
                        // toastr.error("something went wrong");
                    },
                });

// }


        });

    });
</script>
</body>

<!-- Mirrored from csmthemes.com/themes/archer/video/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 02 Dec 2019 17:50:23 GMT -->
</html>

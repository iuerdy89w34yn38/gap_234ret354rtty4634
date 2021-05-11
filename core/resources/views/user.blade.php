<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="zxx">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title> {{$gnl->title}} | @yield('title')</title>
    <!--Favicon-->
    <link rel="shortcut icon" href="{{asset('assets/image/favicon.png')}}" type="image/x-icon">
    <!--Bootstrap Stylesheet-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/bootstrap.css')}}">
    <!--Font Awesome Stylesheet-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/all.min.css')}}">
    <!--Animate Stylesheet-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/animate.css')}}">
    <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--YTPlayer  Stylesheet-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/YTPlayer.min.css')}}">

    <!--Main Stylesheet-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/style.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/video.css')}}">
    <!--Responsive Stylesheet-->
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/responsive.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/css/toastr.min.css')}}">
    <link href="{{url('/')}}/assets/user/css/color.php?color={{$gnl->color1}}&color2={{$gnl->colortwo}}" rel="stylesheet">
    @yield('style')

     <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
  <link rel="stylesheet" href="https://pattern.kivan-works.com/fonts/kredit.css">
  


</head>

<body class="body-class active">
<!--Start Preloader-->
<div class="site-preloader">
<div class="spinner">
<div class="double-bounce1"></div>
<div class="double-bounce2"></div>
</div>
</div>
<!--End Preloader-->

<!-- Main Menu Area Start -->

<header class="header-area">
    <nav class="navbar sticky-top navbar-expand-lg main-menu">
        <div class="container">

            <a class="navbar-brand" href="{{route('homePage')}}">
                <img src="{{asset('assets/image/logo.png')}}"  style="max-width: 220px; max-height: 50px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="menu-toggle"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav m-auto">
                    <li class="nav-item"><a class="nav-link" href="{{route('user.dashboard')}}">@lang('Dashboard')</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">@lang('Transfer')</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="{{route('user.transfer.to.ownbank')}}">@lang('Wallet to Wallet Transfer')</a>
                            <a class="dropdown-item" href="{{route('user.transfer.to.otherBank')}}">@lang('Others Bank')</a>
                            <!--<a class="dropdown-item" href="{{route('user.withdraw')}}">@lang('E-currency')</a> -->
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">@lang('Fixed Deposit')</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="{{route('user.fix.dep.package')}}">@lang('Fixed deposit package')</a>
                            <a class="dropdown-item" href="{{route('user.fix.dep.history')}}">@lang('Fixed deposit History')</a>
                        </div>
                    </li>
                <!--
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">@lang('Loan')</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="{{route('user.loan.package')}}">@lang('Loan package')</a>
                            <a class="dropdown-item" href="{{route('user.loan.history')}}">@lang('Loan History')</a>
                        </div>
                    </li>
                -->

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">@lang('Card')</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="{{route('user.card.package')}}">@lang('Card package')</a>
                            <a class="dropdown-item" href="{{route('user.card.history')}}">@lang('Card History')</a>
                        </div>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="{{route('user.deposit')}}">@lang('E-deposit')</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{Auth::user()->first_name}}</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
                            <a class="dropdown-item" href="{{route('user.account.statement')}}">@lang('Account Statement')</a>
                            <a class="dropdown-item" href="{{route('user.trx')}}"> @lang('Transaction history')</a>
                            <a class="dropdown-item" href="{{route('user.branch')}}">@lang('Our Branch')</a>
                            <a class="dropdown-item" href="{{route('user.profile')}}">@lang('Account KYC')</a>
                            <a class="dropdown-item" href="{{route('user.changePass')}}">@lang('Change Password')</a>
                            <a class="dropdown-item" href="{{route('user.support.index.customer')}}">@lang('Support')</a>
                            <a class="dropdown-item" href="{{route('user.logout')}}"  onclick="event.preventDefault();
                                        document.getElementById('logout').submit();">@lang('Log Out')</a>
                            <form id="logout" action="{{ route('user.logout') }}" method="POST">
                                @csrf
                            </form>

                        </div>
                    </li>
                </ul>
                <div class="viewPlan">
                    <a href="#">
                        {{Auth::user()->balance}} {{$gnl->cur}}
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>
@yield('content')

<!-- Footer Area Start -->
<footer id="footer">
    <div class="container">

        <div class="copyright">
            <div class="row">
                <div class="col-md-6 d-flex align-items-center">

                        <div class="banding">
                            <p >
                        {{$gnl->branding}}
                            </p>
                    </div>


                </div>
                <div class="col-md-6 d-flex align-items-center">
                    <div class="box w-100 text-right">
                        <div class="social_links">
                            <ul>
                                @foreach($socials as $social)
                                    <li>
                                        <a href="{{$social->link}}">
                                            <i title="{{$social->name}}" class="{{$social->icon}}"></i>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Area End -->


<!--Start ClickToTop-->
<div class="totop">
    <a href="#top"><i class="fa fa-arrow-up"></i></a>
</div>
<!--End ClickToTop-->


<script src="{{asset('assets/user/js/jquery.min.js')}}"></script>
<!--Bootstrap JS-->
<script src="{{asset('assets/user/js/bootstrap.min.js')}}"></script>
<script src="{{asset('assets/user/js/popper.js')}}"></script>



<!-- main js -->
<script type="text/javascript" src="{{asset('assets/user/js/toastr.min.js')}}"></script>
<script>

    jQuery(window).on('load', function ()

    {

        /*---------------------------------------------------
            Site Preloader
        ----------------------------------------------------*/
        var $sitePreloaderSelector = $('.site-preloader');
        $sitePreloaderSelector.fadeOut(500);


    });
</script>

<!-- main js -->

@yield('script')
@include('notification.notification')
</body>

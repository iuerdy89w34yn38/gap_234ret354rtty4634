@extends('user')

@section('title')
    @lang('Wallet Transfer')
@endsection

@section('content')

    @include('user.breadcrumb')
    <link rel="stylesheet" type="text/css" href="{{asset('assets/admin/css/toastr.min.css')}}">
    <section id="paymentMethod">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-12 text-center">
                    <div class="heading-title padding-bottom-70">
                        <h2>
                            @lang('Wallet to Wallet Transfer')
                        </h2>
                        <div class="sectionSeparator"></div>

                    </div>
                </div>
            </div>

            <div class="row calculate justify-content-center">
                <div class="col-md-10 col-lg-12">
                    <div class="box">

                        <form method="post" action="{{route('user.transfer.ownbank')}}">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-12 text-center">
                                        <div role="alert" class="alert alert-danger margin-bottom-30">
                                            <strong>@lang('Wallet Transfer Charge') {{$gnl->bal_trans_fixed_charge}} {{$gnl->cur}} @lang('Fixed and')  {{$gnl->bal_trans_per_charge}} @lang('% of your total amount to transfer balance.')</strong>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-5">
                                            <label>@lang('Email Account')</label>
                                            <input type="text" name="account_email" class="myForn" placeholder="@lang('Account Email')" autocomplete="off" required>
                                        </div>
                                       
                                        <div class="form-group col-md-5">
                                            <label>@lang('Wallet Number')</label>
                                            <input type="text" name="account_number" class="myForn" placeholder="@lang('Wallet/Account')" autocomplete="off" required>
                                        </div>
                                       
                                        <div class="form-group col-md-2">
                                            <label>@lang('Amount')</label>
                                            <input type="text"  name="amount" class="myForn" placeholder="@lang('Amount in') {{$gnl->cur}}" autocomplete="off" required>
                                        </div>

                                        <div class="form-group padding-top-10 col-md-12">
                                            <button  class="btn" type="submit">@lang('Transfer Balance')</button>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript" src="{{asset('assets/admin/js/toastr.min.js')}}"></script>
@endsection
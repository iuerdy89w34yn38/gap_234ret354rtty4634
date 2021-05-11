

@extends('user')
@section('profile', 'active')
@section('title')
    {{Auth::user()->name}}
@endsection

@section('style')
    <link rel="stylesheet" type="text/css" href="{{asset('assets/user/fileInput/bootstrap-fileinput.css')}}">
    @endsection


@section('content')
    @include('user.breadcrumb')




    <section id="paymentMethod">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 col-lg-10 text-center">
                    <div class="heading-title padding-bottom-70">
                        <h2>
                            @lang('Account Settings')
                        </h2>
                        <div class="sectionSeparator"></div>

                    </div>
                </div>
            </div>

            <div class="row calculate justify-content-center">

                <div class="col-md-6 col-lg-3">
                    <div class="sbox">
                        <div class="image">
                            <form method="post" action="{{route('user.profile.image.upload')}}" enctype="multipart/form-data">
                                @csrf

                                <div class="form-group col-md-12">
                                    <div class="fileinput fileinput-new" data-provides="fileinput" >
                                        <div class="fileinput-new thumbnail" style="max-width: 252px; max-height: 252px;">
                                            @if(Auth::user()->avatar != NULL)
                                                <img   src="{{asset('assets/image/avatar/'.Auth::user()->avatar)}}" alt="">

                                            @else
                                                <img class="img-fluid" src="{{asset('assets/image/user.png')}}" alt="">
                                            @endif
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 512px; max-height: 512px;"> </div>
                                        <div>
                                                <span class="btn btn-info btn-file">
                                                     <span class="fileinput-new"> @lang('Change') </span>
                                                    <span class="fileinput-exists"> @lang('Change') </span>
                                                 <input type="file" name="avatar"> </span>
                                            <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('Remove') </a>
                                        </div>
                                        <code>@lang('Avatar will be crop width: 512px; height: 512px')</code>
                                    </div>
                                </div>
                                <div class="tile-footer">
                                    <button class="btn mr_btn_solid" style="  width: 100%!important; margin-bottom: 20px;" type="submit">@lang('Update')</button>
                                </div>
                            </form>

                        </div>

                    </div>
                </div>

                <div class="col-md-12 col-lg-9">
                    <div class="box">

                        <form action="{{route('user.profile.update')}}" method="post" class="form-horizontal form-bordered" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">@lang('First Name*')</label>
                                    <input class="form-control" type="text" name="first_name" value="{{Auth::user()->first_name}}" required="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">@lang('Last Name*')</label>
                                    <input class="form-control" type="text" name="last_name" value="{{Auth::user()->last_name}}"  required="">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">@lang('Phone Number*')</label>
                                    <input class="form-control" type="text" name="phone" value="{{ Auth::user()->phone }}" required="">
                                </div>
                                <div class="form-group col-md-6">
                                    <fieldset>
                                        <label class="control-label" >@lang('Email')</label>
                                        <input class="form-control"  value="{{ Auth::user()->email }}" placeholder="Readonly input here…" readonly="">
                                    </fieldset>
                                </div>
                                <div class="form-group col-md-12">
                                    <fieldset>
                                        <label class="control-label" for="readOnlyInput">@lang('Username')</label>
                                        <input class="form-control"  value="{{ Auth::user()->username }}" placeholder="Readonly input here…" readonly="">
                                    </fieldset>
                                </div> 
                                <div class="form-group col-md-12">
                                    <fieldset>
                                        <label class="control-label" for="readOnlyInput">@lang('Account Number')</label>
                                        <input class="form-control"  value="{{ Auth::user()->account_number}}" placeholder="Readonly input here…" readonly="">
                                    </fieldset>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="exampleInputAddress">@lang('Complete Address*')</label>
                                    <input class="form-control" type="text" name="address" value="{{Auth::user()->address}}" required="">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleInputCity">@lang('City*')</label>
                                    <input class="form-control" type="text" id="city" name="city" value="{{Auth::user()->city}}" required="">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleInputCountry">@lang('Country*')</label>
                                    <input class="form-control" type="text" id="country" name="country" value="{{Auth::user()->country}}" required="">
                                </div>

                                <div class="form-group col-md-12">
                                    <label for="exampleInputDOB">@lang('Date of Birth*')</label>
                                    <input class="form-control" type="date" name="dob" value="{{Auth::user()->dob}}" required="">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="idt">@lang('Identification Type*')</label>
                                    <select class="form-control form-control-lg" name="idt" id="idt"  required="">
                                <option  <?php  if(Auth::user()->idt=="Satate ID Card") echo 'selected' ?>  value="Satate ID Card">Satate ID Card</option>
                                <option <?php  if(Auth::user()->idt=="Driving Lisence") echo 'selected' ?> value="Driving Lisence">Driving Lisence</option>
                                <option  <?php  if(Auth::user()->idt=="Passport Identity") echo 'selected' ?> value="Passport Identity">Passport Identity</option>
                            </select>

                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleInputIDT">@lang('Identification Number*')</label>
                                    <input class="form-control" type="Number" name="idn" value="{{Auth::user()->idn}}" required="">
                                </div>


                                <div class="form-group col-md-6">
                                    <label for="exampleInputIDT">@lang('Identification Image Front*')</label>

                                     <div class="fileinput fileinput-new" data-provides="fileinput" >
                                        <div class="fileinput-new thumbnail" style="max-width: 552px; max-height: 252px;">
                                            @if(Auth::user()->idimgf != NULL)
                                                <img   src="{{asset('assets/image/avatar/'.Auth::user()->idimgf)}}" alt="">

                                            @else
                                                <p>Please Upload a Clear Document Image</p>
                                                <p>&nbsp;</p>
                                            @endif
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 512px; max-height: 232px;"> </div>
                                        <div>
                                                <span class="btn btn-info btn-file">
                                                     <span class="fileinput-new"> @lang('Select') </span>
                                                    <span class="fileinput-exists"> @lang('Change') </span>
                                                 <input type="file"  accept="image/*" name="idimgf" name="idimgf"> </span>
                                            <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('Remove') </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleInputIDT">@lang('Identification Image Back')</label>

                                     <div class="fileinput fileinput-new" data-provides="fileinput" >
                                        <div class="fileinput-new thumbnail" style="max-width: 552px; max-height: 252px;">
                                            @if(Auth::user()->idimgb != NULL)
                                                <img   src="{{asset('assets/image/avatar/'.Auth::user()->idimgb)}}" alt="">

                                            @else
                                                <p>Please Upload a Clear Document Image</p>
                                                <p>Not Required for Passport</p>
                                            @endif
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 512px; max-height: 232px;"> </div>
                                        <div>
                                                <span class="btn btn-info btn-file">
                                                     <span class="fileinput-new"> @lang('Select') </span>
                                                    <span class="fileinput-exists"> @lang('Change') </span>
                                                 <input type="file" name="idimgb"> </span>
                                            <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('Remove') </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleInputIDT">@lang('Utility Bill*')</label>
                                    <select class="form-control form-control-lg" name="ubt" id="ubt"  required="">
                                <option  <?php  if(Auth::user()->ubt=="Electricity Bill") echo 'selected' ?> value="Electricity Bill">Electricity Bill</option>
                                <option <?php  if(Auth::user()->ubt=="Gas Bill") echo 'selected' ?> value="Gas Bill">Gas Bill </option>
                                <option <?php  if(Auth::user()->ubt=="Internet Connection") echo 'selected' ?> value="Internet Connection">Internet Connection</option>
                            </select>

                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleInputIDT">@lang('Bill Image*')</label>
                                         <div class="fileinput fileinput-new" data-provides="fileinput" >
                                        <div class="fileinput-new thumbnail" style="max-width: 552px; max-height: 252px;">
                                            @if(Auth::user()->ubimg != NULL)
                                                <img   src="{{asset('assets/image/avatar/'.Auth::user()->ubimg)}}" alt="">

                                            @else
                                                <p>Please Upload a Clear Document Image</p>
                                                <p>The Account Holder name can be Yours or Your Father/Guardian</p>
                                            @endif
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 512px; max-height: 232px;"> </div>
                                        <div>
                                                <span class="btn btn-info btn-file">
                                                     <span class="fileinput-new"> @lang('Select') </span>
                                                    <span class="fileinput-exists"> @lang('Change') </span>
                                                 <input type="file" name="ubimg"> </span>
                                            <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> @lang('Remove') </a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="tile-footer">
                                <button class="btn mr_btn_solid" style="  width: 100%!important; margin-bottom: 20px;" type="submit">@lang('Update')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>



@endsection
@section('script')
    <script type="text/javascript" src="{{asset('assets/user/fileInput/bootstrap-fileinput.js')}}"></script>
@endsection



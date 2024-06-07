@extends($activeTemplate . 'layouts.frontend')
@section('content')

    @php
        $bgImageContent = getContent('bg_image.content', true);
    @endphp

    <section class="account-section ptb-80 bg-overlay-white bg_img"
        data-background="{{ getImage('assets/images/frontend/bg_image/' . @$bgImageContent->data_values->image, '1920x1200') }}">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-12">
                    <div class="account-form-area">
                        <div class="account-logo-area text-center">
                            <div class="account-logo">
                                <a href="{{ route('home') }}"><img src="{{ siteLogo() }}"
                                        alt="{{ __($general->sitename) }}"></a>
                            </div>
                        </div>
                        <div class="account-header text-center">
                            <h3 class="title">@lang('Create your account')</h3>
                        </div>
                        <form class="account-form verify-gcaptcha" action="{{ route('user.register') }}" method="POST">
                            @csrf
                            <div class="row ml-b-20">
                                @if (session()->get('reference') != null)
                                    <div class="form-group">
                                        <label>@lang('Reference By')</label>
                                        <input class="form-control form--control" name="referBy" type="text"
                                            value="{{ session()->get('reference') }}" readonly>
                                    </div>
                                @endif
                                <div class="col-lg-12 form-group">
                                    <label>@lang('Full Name')</label>
                                    <input class="form-control form--control" name="firstname" type="text"
                                        value="{{ old('firstname') }}" required>
                                </div>

                                {{-- <div class="col-lg-6 form-group">
                                    <label>@lang('Last Name')</label>
                                    <input class="form-control form--control" name="lastname" type="text"
                                        value="{{ old('lastname') }}" required>
                                </div> --}}

                                <div class="col-lg-6 form-group">
                                    <label>@lang('Username')</label>
                                    <input class="form-control form--control checkUser" name="username" type="text"
                                        value="{{ old('username') }}" required>
                                    <small class="text--danger usernameExist"></small>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label>@lang('E-Mail Address')</label>
                                    <input class="form-control form--control checkUser" name="email" type="text"
                                        value="{{ old('email') }}" required>
                                </div>

                                {{-- <div class="col-lg-6 form-group">
                                    <label>@lang('Country')</label>
                                    <select class="form-control form--control" name="country" required>
                                        @foreach ($countries as $key => $country)
                                            <option data-mobile_code="{{ $country->dial_code }}" data-code="{{ $key }}" value="{{ $country->country }}">{{ __($country->country) }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-6 form-group">
                                    <label>@lang('Mobile')</label>
                                    <div class="input-group country-code">
                                        <span class="input-group-text mobile-code"></span>
                                        <input class="form-control form--control checkUser" name="mobile" type="number" value="{{ old('mobile') }}" required>
                                        <input name="mobile_code" type="hidden">
                                        <input name="country_code" type="hidden">
                                    </div>
                                    <small class="text--danger mobileExist"></small>
                                </div> --}}

                                <div class="col-lg-6 form-group">
                                    <label>@lang('Password')</label>
                                    <input
                                        class="form-control form--control @if ($general->secure_password) secure-password @endif"
                                        name="password" type="password" required>
                                </div>
                                <div class="col-lg-6 form-group">
                                    <label>@lang('Confirm Password')</label>
                                    <input class="form-control form--control" name="password_confirmation" type="password"
                                        required>
                                </div>

                                <div class="col-lg-6 form-group text-center">
                                    <input type="radio" class="btn-check" name="type" id="danger-outlined"
                                        autocomplete="off" checked value="2">
                                    <label class="btn btn-outline-danger" for="danger-outlined"
                                        style="color: #0000009c;
                                    border: 1px solid #034F4F !important;
                                    width: 100%;">@lang('Buyer')</label>
                                </div>

                                <div class="col-lg-6 form-group text-center">
                                    <input type="radio" class="btn-check" name="type" id="success-outlined"
                                        autocomplete="off"value="1">
                                    <label class="btn btn-outline-success" for="success-outlined"
                                        style="color: #0000009c;
                                    border: 1px solid #034F4F !important;
                                    width: 100%;">@lang('Seller')</label>
                                </div>
                                
                                <x-captcha />

                                @if ($general->agree)
                                    <div class="col-lg-12 form-group">
                                        <div class="form-group custom-check-group">
                                            <input id="agree" name="agree" type="checkbox">
                                            <label for="agree">@lang('I agree with') <span>
                                                    @foreach ($policyPages as $policy)
                                                        <a class="text--base"
                                                            href="{{ route('policy.pages', [slug($policy->data_values->title), $policy->id]) }}">{{ __($policy->data_values->title) }}</a>
                                                        @if (!$loop->last)
                                                            ,
                                                        @endif
                                                    @endforeach
                                                </span></label>
                                        </div>
                                    </div>
                                @endif

                                <div class="form-group">
                                    <button class="submit-btn w-100" type="submit">@lang('Sign Up')</button>
                                </div>

                                <div class="col-lg-12 text-center">
                                    <div class="account-item mt-10">
                                        <label>@lang('Already Have An Account')? <a class="text--base"
                                                href="{{ route('user.login') }}">@lang('Sign In')</a></label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="modal fade" id="existModalCenter" role="dialog" aria-labelledby="existModalCenterTitle" aria-hidden="true"
        tabindex="-1">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="existModalLongTitle">@lang('You are with us')</h5>
                    <span class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                        <i class="las la-times"></i>
                    </span>
                </div>
                <div class="modal-body">
                    <p class="text-center">@lang('You already have an account please Login ')</p>
                </div>
                <div class="modal-footer">
                    <a class="btn btn--base btn--sm" href="{{ route('user.login') }}">@lang('Login')</a>
                </div>
            </div>
        </div>
    </div>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif

@push('script')
    <script>
        "use strict";

        (function($) {
            @if ($mobileCode)
                $(`option[data-code={{ $mobileCode }}]`).attr('selected', '');
            @endif

            $('select[name=country]').change(function() {
                $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
                $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
                $('.mobile-code').text('+' + $('select[name=country] :selected').data('mobile_code'));
            });
            $('input[name=mobile_code]').val($('select[name=country] :selected').data('mobile_code'));
            $('input[name=country_code]').val($('select[name=country] :selected').data('code'));
            $('.mobile-code').text('+' + $('select[name=country] :selected').data('mobile_code'));

            $('.checkUser').on('focusout', function(e) {
                var url = '{{ route('user.checkUser') }}';
                var value = $(this).val();
                var token = '{{ csrf_token() }}';
                if ($(this).attr('name') == 'mobile') {
                    var mobile = `${$('.mobile-code').text().substr(1)}${value}`;
                    var data = {
                        mobile: mobile,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'email') {
                    var data = {
                        email: value,
                        _token: token
                    }
                }
                if ($(this).attr('name') == 'username') {
                    var data = {
                        username: value,
                        _token: token
                    }
                }
                $.post(url, data, function(response) {
                    if (response.data != false && response.type == 'email') {
                        $('#existModalCenter').modal('show');
                    } else if (response.data != false) {
                        $(`.${response.type}Exist`).text(`${response.type} already exist`);
                    } else {
                        $(`.${response.type}Exist`).text('');
                    }
                });
            });
        })(jQuery);
    </script>
@endpush

@push('style')
    <style>
        .btn-check:active+.btn-outline-danger,
        .btn-check:checked+.btn-outline-danger,
        .btn-outline-danger.active,
        .btn-outline-danger.dropdown-toggle.show,
        .btn-outline-danger:active {
            color: #fff;
            background-color: #1BABAF;
            border-color: #dc3545;
        }

        .btn-check:active+.btn-outline-success,
        .btn-check:checked+.btn-outline-success,
        .btn-outline-success.active,
        .btn-outline-success.dropdown-toggle.show,
        .btn-outline-success:active {
            color: #fff;
            background-color: #27BF7F;
            border-color: #198754;
        }

        .btn-outline-danger:hover {
            color: #fff;
            background-color: #1BABAF;
            border-color: #dc3545;
        }
    </style>
@endpush

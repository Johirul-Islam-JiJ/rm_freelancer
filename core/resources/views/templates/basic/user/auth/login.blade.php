@extends($activeTemplate . 'layouts.frontend')
@section('content')
    @php
        $bgImageContent = getContent('bg_image.content', true);
    @endphp

    <section class="account-section ptb-80 bg-overlay-white bg_img" data-background="{{ getImage('assets/images/frontend/bg_image/' . @$bgImageContent->data_values->image, '1920x1200') }}">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="account-form-area">
                        <div class="account-logo-area text-center">
                            <div class="account-logo">
                                <a href="{{ route('home') }}">
                                    <img src="{{ siteLogo() }}">
                                </a>
                            </div>
                        </div>
                        <div class="account-header text-center">
                            <h3 class="title">@lang('Sign in to') {{ __($general->site_name) }}</h3>
                        </div>
                        <form class="account-form verify-gcaptcha" method="POST" action="{{ route('user.login') }}">
                            @csrf
                            <div class="row ml-b-20">
                                <div class="form-group">
                                    <label>@lang('Username or email')</label>
                                    <input class="form-control form--control" name="username" type="text" value="{{ old('username') }}" required>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Password')</label>
                                    <input class="form-control form--control" name="password" type="password" required>
                                </div>
                                <x-captcha />
                                <div class="form-group d-flex flex-warp justify-content-between">
                                    <div class="form-group custom-check-group">
                                        <input id="remember" name="remember" type="checkbox" {{ old('remember') ? 'checked' : '' }}>
                                        <label for="remember">@lang('Remember Me')</label>
                                    </div>
                                    <div class="forgot-item">
                                        <label>
                                            <a class="text--base" href="{{ route('user.password.request') }}">@lang('Forgot Password')?</a>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="submit-btn w-100" type="submit">@lang('Sign In')</button>
                                </div>
                                <div class="text-center">
                                    <div class="account-item mt-10">
                                        <label>@lang('Already Have An Account')? <a class="text--base" href="{{ route('user.register') }}">@lang('Sign Up')</a></label>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <div class="d-flex flex-wrap gap-3">
                            <a href="https://script.viserlab.com/apointer/user/social-login/facebook"
                                class="btn btn-outline-facebook btn-sm flex-grow-1">
                                <span class="me-1"><i class="la la-facebook"></i></span>
                                Facebook </a>
                            <a href="https://script.viserlab.com/apointer/user/social-login/google"
                                class="btn btn-outline-google btn-sm flex-grow-1">
                                <span class="me-1"><i class="lab la-google"></i></span>
                                Google </a>
                            <a href="https://script.viserlab.com/apointer/user/social-login/linkedin"
                                class="btn btn-outline-linkedin btn-sm flex-grow-1">
                                <span class="me-1"><i class="la la-linkedin"></i></span>
                                Linkedin </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('style')
    <style>
        .btn-outline-facebook {
            border-color: #395498;
            background-color: transparent;
            color: #395498 !important;
        }

        .btn-outline-facebook:hover {
            border-color: #395498;
            color: #fff !important;
            background-color: #395498;
        }

        .me-1 {
            margin-right: .25rem !important;
        }

        .btn-outline-google {
            border-color: #D64937;
            background-color: transparent;
            color: #D64937 !important;
        }

        .btn-outline-google:hover {
            border-color: #D64937;
            color: #fff !important;
            background-color: #D64937;
        }

        .btn-outline-linkedin {
            border-color: #0077B5;
            background-color: transparent;
            color: #0077B5 !important;
        }

        .btn-outline-linkedin:hover {
            border-color: #0077B5;
            color: #fff !important;
            background-color: #0077B5;
        }
    </style>
@endpush
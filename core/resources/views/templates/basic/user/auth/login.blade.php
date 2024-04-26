@extends($activeTemplate . 'layouts.frontend')
@section('content')
    @php
        $bgImageContent = getContent('bg_image.content', true);
    @endphp

    <section class="account-section ptb-80 bg-overlay-white bg_img"
        data-background="{{ getImage('assets/images/frontend/bg_image/' . @$bgImageContent->data_values->image, '1920x1200') }}">
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
                        <form class="account-form  verify-gcaptcha" method="POST" action="{{ route('user.login') }}">
                            @csrf
                            <div class="row ml-b-20">
                                <div class="form-group">
                                    <label>@lang('Username or email')</label>
                                    <input class="form-control form--control" name="username" type="text"
                                        value="{{ old('username') }}" required>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Password')</label>
                                    <input class="form-control form--control" name="password" type="password" required>
                                </div>
                                <x-captcha />
                                <div class="form-group d-flex flex-warp justify-content-between">
                                    <div class="form-group custom-check-group">
                                        <input id="remember" name="remember" type="checkbox"
                                            {{ old('remember') ? 'checked' : '' }}>
                                        <label for="remember">@lang('Remember Me')</label>
                                    </div>
                                    <div class="forgot-item">
                                        <label>
                                            <a class="text--base"
                                                href="{{ route('user.password.request') }}">@lang('Forgot Password')?</a>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="submit-btn w-100" type="submit">@lang('Sign In')</button>
                                </div>
                                <div class="text-center">
                                    <div class="account-item mt-10">
                                        <label>@lang('Create An Account')? <a class="text--base"
                                                href="{{ route('user.register') }}">@lang('Sign Up')</a></label>
                                    </div>
                                </div>

                                @php
                                    $credentials = $general->socialite_credentials;
                                @endphp
                                @if (
                                    $credentials->google->status == Status::ENABLE ||
                                        $credentials->facebook->status == Status::ENABLE ||
                                        $credentials->linkedin->status == Status::ENABLE)
                                    <div class="col-12">
                                        <div class="other-option">
                                            <span class="other-option__text">@lang('OR')</span>
                                        </div>
                                    </div>
                                    <p class="account-item mt-10 text-center">
                                        @lang('Sign in with')
                                    </p>
                                    <div class="d-flex flex-wrap gap-3">
                                        @if ($credentials->facebook->status == Status::ENABLE)
                                            <a href="{{ route('user.social.login', 'facebook') }}"
                                                class="btn btn-outline-facebook btn-sm flex-grow-1">
                                                <span class="me-1"><i class="fab fa-facebook-f"></i></span>
                                                @lang('Facebook')
                                            </a>
                                        @endif
                                        @if ($credentials->google->status == Status::ENABLE)
                                            <a href="{{ route('user.social.login', 'google') }}"
                                                class="btn btn-outline-google btn-sm flex-grow-1">
                                                <span class="me-1"><i class="lab la-google-plus-g"></i></span>
                                                @lang('Google')
                                            </a>
                                        @endif
                                        @if ($credentials->linkedin->status == Status::ENABLE)
                                            <a href="{{ route('user.social.login', 'linkedin') }}"
                                                class="btn btn-outline-linkedin btn-sm flex-grow-1">
                                                <span class="me-1"><i class="lab la-linkedin-in"></i></span>
                                                @lang('Linkedin')
                                            </a>
                                        @endif
                                    </div>
                                @endif
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('style')
    <style>
        .content-area {
            z-index: -1;
            height: 100%;
        }

        .btn-outline-linkedin {
            border: 1px solid #0077B5 !important;
            background-color: transparent;
            color: #0077B5;
        }

        .btn-outline-linkedin:hover {
            border-color: #0077B5;
            color: #fff !important;
            background-color: #0077B5;
        }

        .btn-outline-facebook {
            border: 1px solid #395498 !important;
            background-color: transparent;
            color: #395498;
        }

        .btn-outline-facebook:hover {
            border-color: #395498;
            color: #fff !important;
            background-color: #395498;
        }

        .btn-outline-google {
            border: 1px solid #D64937 !important;
            background-color: transparent;
            color: #D64937;
        }

        .btn-outline-google:hover {
            border-color: #D64937;
            color: #fff !important;
            background-color: #D64937;
        }

        .row>* {
            padding-right: calc(var(--bs-gutter-x) * .0);
        }


        .other-option {
            text-align: center;
        }

        .other-option__text {
            position: relative;
            display: inline-block;
        }

        .other-option__text::before,
        .other-option__text::after {
            content: "";
            display: inline-block;
            width: 100%;
            border-top: 1px solid black;
            /* Adjust border properties as needed */
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }

        .other-option__text::before {
            right: 100%;
            margin-right: 5px;
            /* Adjust distance from text */
        }

        .other-option__text::after {
            left: 100%;
            margin-left: 5px;
            /* Adjust distance from text */
        }
    </style>
@endpush

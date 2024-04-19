@extends($activeTemplate . 'layouts.frontend')
@section('content')
    @php
        $bgImageContent = getContent('bg_image.content', true);
    @endphp

    <section class="account-section ptb-80 bg-overlay-white bg_img" data-background="{{ getImage('assets/images/frontend/bg_image/' . @$bgImageContent->data_values->image, '1920x1200') }}">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-7 col-xl-5">
                    <div class="account-form-area">
                        <div class="account-logo-area text-center">
                            <div class="account-logo">
                                <a href="{{ route('home') }}"><img src="{{ siteLogo() }}" alt="{{ __($general->sitename) }}"></a>
                            </div>
                        </div>
                        <div class="account-header text-center">
                            <h3 class="title">@lang('Reset Password')</h3>
                            <p>@lang('Your account is verified successfully. Now you can change your password.')</p>
                        </div>

                        <form class="account-form" method="POST" action="{{ route('user.password.update') }}">
                            @csrf

                            <input name="email" type="hidden" value="{{ $email }}">
                            <input name="token" type="hidden" value="{{ $token }}">

                            <div class="row ml-b-20">
                                <div class="form-group">
                                    <label>@lang('Password')</label>
                                    <input class="form-control form--control @if ($general->secure_password) secure-password @endif" name="password" type="password" required>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Confirm Password')</label>
                                    <input class="form-control form--control" name="password_confirmation" type="password" required>
                                </div>
                                <button class="submit-btn w-100" type="submit">@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif

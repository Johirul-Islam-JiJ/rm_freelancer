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
                        <div class="account-header text-center mb-0">
                            <h3 class="title">@lang('Verify Your Email')</h3>
                            <p>@lang('A 6 digit verification code sent to your email address') : {{ showEmailAddress(auth()->user()->email) }}</p>
                        </div>
                        <form class="account-form submit-form" method="POST" action="{{ route('user.verify.email') }}">
                            @csrf
                            <div class="row ml-b-20">
                                <div class="d-flex justify-content-center">
                                    <div class="verification-code-wrapper">
                                        <div class="verification-area">
                                            @include($activeTemplate . 'partials.verification_code')
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="submit-btn w-100" type="submit">@lang('Submit')</button>
                                </div>
                                <div class="form-group">
                                    @lang('Please check including your Junk/Spam Folder. if not found, you can')
                                    <a class="text--base" href="{{ route('user.send.verify.code', 'email') }}">@lang('Try to send again')</a>

                                    @if ($errors->has('resend'))
                                        <br><small class="text--danger d-block">{{ $errors->first('resend') }}</small>
                                    @endif
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

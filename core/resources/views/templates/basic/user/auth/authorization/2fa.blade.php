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
                                <a href="{{ route('home') }}"><img src="{{ siteLogo() }}" alt="{{ __($general->sitename) }}"></a>
                            </div>
                        </div>
                        <div class="account-header text-center mb-0">
                            <h3 class="title">@lang('2FA Verification')</h3>
                        </div>
                        <form class="account-form submit-form" method="POST" action="{{ route('user.go2fa.verify') }}">
                            @csrf
                            <div class="row ml-b-20">
                                <div class="d-flex justify-content-center">
                                    <div class="verification-code-wrapper">
                                        <div class="verification-area">
                                            @include($activeTemplate . 'partials.verification_code')
                                        </div>
                                    </div>
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

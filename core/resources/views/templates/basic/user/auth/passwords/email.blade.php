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
                            <h3 class="title">{{ __($pageTitle) }}</h3>
                        </div>
                        
                            <form method="POST" action="{{ route('user.password.email') }}" class="account-form verify-gcaptcha">
                            @csrf
                            <div class="row ml-b-20">
                                <div class="form-group">
                                    <label>@lang('Username or email')</label>
                                    <input class="form-control form--control" name="value" type="text" value="{{ old('value') }}" required autofocus="off">
                                </div>

                                <x-captcha />

                                <button class="submit-btn w-100" type="submit">@lang('Submit')</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

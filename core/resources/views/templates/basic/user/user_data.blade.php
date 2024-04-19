@extends($activeTemplate . 'layouts.frontend')
@section('content')
    @php
        $bgImageContent = getContent('bg_image.content', true);
    @endphp
    <section class="account-section ptb-80 bg-overlay-white bg_img" data-background="{{ getImage('assets/images/frontend/bg_image/' . @$bgImageContent->data_values->image, '1920x1200') }}">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-7 col-xl-6">
                    <div class="account-form-area">
                        <div class="account-logo-area text-center">
                            <div class="account-logo">
                                <a href="{{ route('home') }}">
                                    <img src="{{ siteLogo() }}">
                                </a>
                            </div>
                        </div>
                        <div class="account-header text-center">
                            <h3 class="title">{{ __($pageTitle) }}</h3>
                        </div>
                        <form class="account-form" method="POST" action="{{ route('user.data.submit') }}">
                            @csrf
                            <div class="row ml-b-20">
                                <div class="col-lg-6 form-group">
                                    <label>@lang('First Name')</label>
                                    <input class="form-control form--control" name="firstname" type="text" value="{{ old('firstname') }}" required>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label>@lang('Last Name')</label>
                                    <input class="form-control form--control" name="lastname" type="text" value="{{ old('lastname') }}" required>
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label>@lang('Address')</label>
                                    <input class="form-control form--control" name="address" type="text" value="{{ old('address') }}">
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label>@lang('State')</label>
                                    <input class="form-control form--control" name="state" type="text" value="{{ old('state') }}">
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label>@lang('Zip Code')</label>
                                    <input class="form-control form--control" name="zip" type="text" value="{{ old('zip') }}">
                                </div>

                                <div class="col-lg-6 form-group">
                                    <label>@lang('City')</label>
                                    <input class="form-control form--control" name="city" type="text" value="{{ old('city') }}">
                                </div>
                                <div class="col-lg-12 form-group">
                                    <label>@lang('About Me')</label>
                                    <textarea class="form-control form--control" name="about_me" rows="5" required>{{ old('about_me') }}</textarea>
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

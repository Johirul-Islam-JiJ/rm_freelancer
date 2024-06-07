@extends($activeTemplate . 'layouts.frontend')
@section('content')
    @php
        $contactContent = getContent('contact.content', true);
        $contactElements = getContent('contact.element', false, null, true);
    @endphp
    <section class="contact-section pt-60 ptb-60">
        <div class="container">
            <div class="contact-wrapper">
                <div class="contact-area">
                    <div class="row justify-content-center m-0">
                       
                        <div class="col-xl-8 col-lg-6 p-0">
                            <div class="contact-form-area">
                                <h3 class="title">{{ __(@$contactContent->data_values->form_heading) }}</h3>
                                <p>{{ __(@$contactContent->data_values->form_sub_heading) }}</p>

                                <form class="contact-form verify-gcaptcha" method="POST" action="{{ route('helpdesk.submit') }}">
                                    @csrf
                                    <div class="row justify-content-center mb-10-none">
                                        <div class="col-lg-6 col-md-6 form-group">
                                            <input class="form--control" name="name" type="text" value="{{ old('name', @$user->fullname) }}" placeholder="@lang('Your name')" @if ($user && $user->profile_complete) readonly @endif required>
                                        </div>
                                        <div class="col-lg-6 col-md-6 form-group">
                                            <input class="form--control" name="email" type="email" value="{{ old('email', @$user->email) }}" placeholder="@lang('Your email')" @readonly(@$user) required>
                                        </div>
                                        <div class="col-lg-6 form-group">
                                            <input class="form--control" name="subject" type="text" value="{{ old('subject') }}" placeholder="@lang('Your subject')" required="">
                                        </div>
                                        <div class="col-lg-6 form-group">
                                            <input class="form--control" name="order_id" type="text" value="{{ old('order_id') }}" placeholder="@lang('Order ID')" required="">
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form--control" name="message" wrap="off" placeholder="@lang('Your message')" required="">{{ old('message') }}</textarea>
                                        </div>
                                        <x-captcha isCustom="true" />
                                        <button class="submit-btn" type="submit">@lang('Send Message')</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

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
                        <div class="account-header text-center">
                            <h3 class="title text--danger">@lang('You are banned')</h3>
                            <p>@lang('Reason')</p>
                        </div>
                        <div class="row ml-b-20">
                            <p class="text-center">{{ $user->ban_reason }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

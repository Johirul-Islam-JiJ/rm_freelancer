@extends($activeTemplate . 'layouts.frontend')
@section('content')
    @php
        $subscriberContent = getContent('subscriber.content', true);
        $bannerContent = getContent('banner.content', true);
    @endphp


    <section class="banner-section pt-60 overflow-hidden bg_img"
        data-background="{{ getImage('assets/images/frontend/banner/' . @$bannerContent->data_values->image, '1920x480') }}">
        <div class="container">
            <div class="banner-content">
                <h1 class="title text-white">{{ __(@$bannerContent->data_values->heading) }}
                </h1>
                <p class="text-white">{{ __(@$bannerContent->data_values->subheading) }}</p>
            </div>
        </div>
    </section>

    <section class="all-sections pt-60">
        <div class="container-fluid p-max-sm-0">
            <div class="sections-wrapper d-flex flex-wrap justify-content-center">
                <article class="main-section">
                    <div class="section-inner">
                        <div class="item-section">
                            <div class="container">
                                {{-- @include($activeTemplate.'partials.top_filter')
                                <div class="item-bottom-area">
                                    <div class="row justify-content-center mb-30-none">
                                        <div class="col-xl-9 col-lg-9 mb-30">
                                            <div class="item-card-wrapper list-view">
                                                @forelse($products as $product)
                                                    <x-item :product="$product" :type="$type"/>
                                                @empty
                                                    <x-basic-empty-message />
                                                @endforelse
                                            </div>
                                            @if ($products->hasPages())
                                            <nav>
                                                {{ paginateLinks($products)}}
                                            </nav>
                                            @endif
                                        </div>
                                       @include($activeTemplate.'partials.filter')
                                    </div>
                                </div> --}}


                                <div class="item-bottom-area">
                                    <div class="row justify-content-center mb-30-none">
                                        <div class="col-xl-12 col-lg-12 mb-30">
                                            <h1 class="ptb-10 mt-40">@lang('Most populer Gigs in ') <span
                                                    class="text--base">@lang('Featured')</span></h1>
                                            <div class="item-card-wrapper grid-view">
                                                @forelse($products as $product)
                                                    <x-item :product="$product" :type="$type" />
                                                @empty
                                                    <x-basic-empty-message />
                                                @endforelse
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center mb-30-none">
                                        <div class="col-xl-12 col-lg-12 mb-30">
                                            <h1 class="ptb-10 mt-40">@lang('Most populer Gigs in ')<span
                                                    class="text--base">@lang('SEO')</span></h1>
                                            <div class="item-card-wrapper grid-view">
                                                @forelse($seo as $product)
                                                    <x-item :product="$product" :type="$type" />
                                                @empty
                                                    <x-basic-empty-message />
                                                @endforelse
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center mb-30-none">
                                        <div class="col-xl-12 col-lg-12 mb-30">
                                            <h1 class="ptb-10 mt-40">@lang('Most populer Gigs in Digital ')<span
                                                    class="text--base">@lang('Marketing')</span></h1>
                                            <div class="item-card-wrapper grid-view">
                                                @forelse($digitalMarketing as $product)
                                                    <x-item :product="$product" :type="$type" />
                                                @empty
                                                    <x-basic-empty-message />
                                                @endforelse
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>
    @include($activeTemplate . 'partials.down_ad')

    <section class="subscribe-section ptb-120 overflow-hidden bg_img"
        data-background="{{ getImage('assets/images/frontend/subscriber/' . @$subscriberContent->data_values->image, '1020x380') }}">
        <div class="container">
            <div class="subscribe-wrapper">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-6">
                        <div class="subscribe-content text-center">
                            <span
                                class="subscribe-content__subtitle text-white">{{ __(@$subscriberContent->data_values->subheading) }}</span>
                            <h3 class="subscribe-content__title text-white">
                                {{ __(@$subscriberContent->data_values->heading) }}
                            </h3>
                            <form class="subscribe-form">
                                <input type="email" name="email" id="subscribe" placeholder="@lang('Email Address')..">
                                <button type="button" class="subscribe--btn"><i class="fas fa-comment"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('style')
    <style>
        .sec-title {
            font-weight: 700;
            font-size: 24px;
        }

        .item-card-wrapper.grid-view .item-card {
            flex: 0 0 calc((100% / 4) - 15px);
            -ms-flex: 0 0 calc((100% / 4) - 15px);
            max-width: calc((100% / 4) - 15px);
            -webkit-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
            margin-left: 7px;
            margin-right: 7px;
        }
    </style>
@endpush

@push('script')
    <script>
        'use strict';
        (function($) {
            $('.subscribe--btn').on('click', function() {
                var email = $('#subscribe').val();
                var csrf = '{{ csrf_token() }}';
                $.ajax({
                    type: 'post',
                    url: '{{ route('subscriber.store') }}',
                    data: {
                        email: email,
                        _token: csrf
                    },
                    dataType: "json",
                    success: function(response) {
                        if (response.success) {
                            notify('success', response.success);
                            $('#subscribe').val('');
                        } else {
                            notify('error', response.error);
                        }
                    }
                });
            });
        })(jQuery);
    </script>
@endpush

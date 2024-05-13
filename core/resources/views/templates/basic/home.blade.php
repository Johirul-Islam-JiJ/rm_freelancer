
@extends($activeTemplate.'layouts.frontend')
@section('content')
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
                                            <h1 class="ptb-40 mt-40 bg--base text-center">@lang('Featured')</h1>
                                            <div class="item-card-wrapper grid-view">
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
                                    </div>

                                    <div class="row justify-content-center mb-30-none">
                                        <div class="col-xl-12 col-lg-12 mb-30">
                                            <h1 class="ptb-40 mt-40 bg--base text-center">@lang('SEO')</h1>
                                            <div class="item-card-wrapper grid-view">
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
                                    </div>

                                    <div class="row justify-content-center mb-30-none">
                                        <div class="col-xl-12 col-lg-12 mb-30">
                                            <h1 class="ptb-40 mt-40 bg--base text-center">@lang('Digital Marketing')</h1>
                                            <div class="item-card-wrapper grid-view">
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
                                    </div>
                                </div> 

                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>
    @include($activeTemplate.'partials.down_ad')
@endsection


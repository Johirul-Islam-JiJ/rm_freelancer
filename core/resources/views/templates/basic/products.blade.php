@extends($activeTemplate.'layouts.frontend')
@section('content')
<section class="all-sections pt-60 pb-60">
    <div class="container-fluid p-max-sm-0">
        <div class="sections-wrapper d-flex flex-wrap justify-content-center">
            <article class="main-section">
                <div class="section-inner">
                    <div class="item-section">
                        <div class="container">
                            @if(request()->routeIs('category.wise.product'))
                                <div class="item-category-area border-bottom">
                                    <div class="category-slider mb-4">
                                        <div class="swiper-wrapper">
                                            @foreach($category->subCategories as $subcategory)
                                                <div class="swiper-slide">
                                                    <div class="category-item-box">
                                                        <img src="{{ getImage(getFilePath('subcategory').'/'.$subcategory->image, getFileSize('subcategory')) }}"
                                                            alt="@lang('Subcategory Image')">
                                                        <div class="category-item-content">
                                                            <a href="{{ route('subcategory.wise.product', [slug($subcategory->name), $subcategory->id]) }}" class="title text-white">
                                                                {{ __($subcategory->name) }}
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                        <div class="slider-prev">
                                            <i class="las la-angle-left"></i>
                                        </div>
                                        <div class="slider-next">
                                            <i class="las la-angle-right"></i>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="item-details-area">
                                @include($activeTemplate.'partials.basic_card')
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>
</section>
@endsection

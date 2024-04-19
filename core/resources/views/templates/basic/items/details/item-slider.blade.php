@php
    $imagePath = getImage(getFilePath($type).'/'.$itemDetails->image, getFileSize($type));
@endphp
<div class="item-details-slider-area">
    <div class="item-details-slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="item-details-thumb">
                    <img src="{{$imagePath}}">
                </div>
            </div>
            @foreach($itemDetails->extra_image ?? [] as $singleImage)
                <div class="swiper-slide">
                    <div class="item-details-thumb">
                        <img src="{{ getImage(getFilePath('extraImage').'/'.$singleImage, getFileSize('extraImage')) }}">
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
<div class="item-small-slider mt-20">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="item-small-thumb">
                <img src="{{$imagePath}}">
            </div>
        </div>
        @foreach($itemDetails->extra_image ?? [] as $singleImage)
            <div class="swiper-slide">
                <div class="item-small-thumb">
                    <img src="{{ getImage(getFilePath('extraImage').'/'.$singleImage, getFileSize('extraImage')) }}">
                </div>
            </div>
        @endforeach
    </div>
</div>
@push('script')
    <script>
        (function($){
            "use strict";

            var swiper = new Swiper(".item-small-slider", {
                spaceBetween: 30,
                slidesPerView: 4,
                freeMode: true,
                watchSlidesVisibility: true,
                watchSlidesProgress: true,
            });

            var swiper2 = new Swiper(".item-details-slider", {
                slidesPerView: 1,
                spaceBetween: 10,
                navigation: {
                    nextEl: '.slider-next',
                    prevEl: '.slider-prev',
                },
                thumbs: {
                    swiper: swiper,
                },
            });
        })(jQuery);
    </script>
@endpush

@php
    $modelName  ="App\\Models\\".ucfirst($type);
    $fItems     = $modelName::active()->featured()->userActiveCheck()->checkData()->latest()->with('user')->limit(6)->get();
@endphp
@if (count($fItems))
    <div class="widget mb-30">
        <h3 class="widget-title">@lang('Featured '){{ ucfirst($type) }}</h3>
        <ul class="small-item-list load-more-featured-services">
            @foreach($fItems->take(5) as $fItem)
                @include($activeTemplate.'partials.basic_featured_service')
            @endforeach
        </ul>
    </div>
    <div class="widget-btn text-center mb-30">
        @if(count($fItems) > 5)
            <button class="btn--base loadMoreFeaturedServices">@lang('Show More')</button>
        @endif
    </div>
@endif

@if (count($fItems) > 5)
    @push('script')
        <script>
            (function ($) {
                "use strict";
                var showServices = 5;
                $('.loadMoreFeaturedServices').on('click', function(e) {
                    e.preventDefault();

                    $(this).addClass('btn-disabled').attr("disabled", true);

                    var type = "{{ $type }}";
                    var skip = showServices;

                    $.ajax({
                        type: 'get',
                        url: '{{ route('fetch.featured.services') }}',
                        data:{
                                type : type,
                                skip : skip
                        },
                        dataType: "json",
                        success: function (response) {
                            if(response.success){
                                $('.load-more-featured-services').append(response.html);
                                showServices += 5;
                                $('.loadMoreFeaturedServices').removeClass('btn-disabled').attr("disabled", false);
                            }else{
                                notify('error', response.error);
                            }
                        }
                    });
                });
            })(jQuery);
        </script>
    @endpush
@endif

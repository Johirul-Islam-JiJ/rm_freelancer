<div class="product-tab">
    <nav class="d-flex flex-wrap justify-content-between align-items-center">
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="service-tab" data-bs-toggle="tab" data-bs-target="#service" type="button">@lang('Services')</button>
            <button class="nav-link" id="software-tab" data-bs-toggle="tab" data-bs-target="#software" type="button">@lang('Softwares')</button>
            <button class="nav-link" id="job-tab" data-bs-toggle="tab" data-bs-target="#job" type="button">@lang('Jobs')</button>
        </div>

        <div class="item-wrapper-right float-end mt-sm-3">
            <form class="search-from mt-3 mt-md-0" action="{{route('search')}}" method="GET">
                <input type="search" name="search" class="form-control" value="{{@$search}}" placeholder="@lang('Search here')...">
                <button type="submit"><i class="las la-search"></i></button>
            </form>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        @foreach($items as $key => $item)
        <div class="tab-pane fade @if($loop->first) show active @endif" id="{{ $key }}">
            <div class="item-card-wrapper border-0 p-0 grid-view mt-30 load-products">
                @forelse($item->take(9) as $product)
                    <x-item :product="$product" type="{{ $key }}" />
                @empty
                    <x-basic-empty-message />
                @endforelse
            </div>

            @if($item->count() > 9)
                <div class="widget-btn text-center mt-4">
                    <button class="btn--base loadMoreProduct" data-type="{{ $key }}">@lang('More')</button>
                </div>
            @endif
        </div>
        @endforeach
    </div>
</div>


@push('script')
    <script>
        (function ($) {
            "use strict";

            var showProducts = 9;

            $('.loadMoreProduct').on('click', function(e) {
                e.preventDefault();
                $(this).addClass('btn-disabled').attr("disabled", true);

                var type          = $(this).data('type');
                var search        = '{{@$search}}';
                var userId        = '{{@$user->id}}';
                var categoryId    = '{{@$category->id}}';
                var subcategoryId = '{{@$subcategory->id}}';
                var skip          = showProducts;
                var $this         = $(this);

                $.ajax({
                    type: 'get',
                    url: '{{ route('fetch.products') }}',
                    data: {
                            skip : skip,
                            type : type,
                            search : search,
                            user_id : userId,
                            category_id : categoryId,
                            subcategory_id : subcategoryId,
                        },
                    dataType: "json",

                    success: function (response) {
                        if(response.success){
                            $($this).closest('.tab-pane').find('.load-products').append(response.html);
                            showProducts += 9;
                            $('.loadMoreProduct').removeClass('btn-disabled').attr("disabled", false);
                        }else{
                            notify('error', response.error);
                        }
                    }
                });
            });
        })(jQuery);
    </script>
@endpush

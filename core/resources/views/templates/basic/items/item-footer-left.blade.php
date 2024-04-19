<div class="left">
    @if (request()->routeIs('home') || $type == 'service' || $type == 'software')
        <button type="button" class="item-love me-2 make-favorite" data-id="{{$product->id}}" data-type="@if ($type == 'service') service @else software @endif">
            <i class="fas fa-heart"></i>
            <span class="favorite-count">({{__($product->favorite)}})</span>
        </button>
        <span class="item-like">
            <i class="las la-thumbs-up"></i> ({{$product->likes}})
        </span>
    @endif
    @if ($type == 'software')
        <a href="{{route('user.software.confirm.booking', [slug($product->name), $product->id])}}" class="btn--base active buy-btn"><i class="las la-shopping-cart"></i> @lang('Buy Now')</a>
    @endif
    @if ($type == 'job')
        <span class="btn--base active date-btn">{{$product->delivery_time}} @lang('Days')</span>
        <span class="btn--base bid-btn">@lang('Total Bids')({{$product->total_bid}})</span>
    @endif
</div>

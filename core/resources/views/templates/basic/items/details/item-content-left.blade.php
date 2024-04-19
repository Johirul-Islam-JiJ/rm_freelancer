<div class="left mb-20">
    <button class="item-love me-2 make-favorite" data-id="{{$itemDetails->id}}" data-type="@if (request()->routeIs('service.details')) service @else software @endif">
        <i class="fas fa-heart"></i> <span class="favorite-count">({{__($itemDetails->favorite)}})</span>
    </button>
    <span class="item-like me-2">
        <i class="las la-thumbs-up"></i> ({{__($itemDetails->likes)}})
    </span>
    @if (request()->routeIs('software.details'))
        <a href="{{$itemDetails->demo_url}}" target="__blank" class="item-love bg--base mt-2"><i class="las la-desktop"></i> @lang('Preview')</a>
    @endif
</div>

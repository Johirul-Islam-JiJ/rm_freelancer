<div class="item-card">
    <x-item view="item-thumb" :product="$product" :type="$type" />
    <div class="item-card-content">
        <div class="item-card-content-top">
            <x-item view="item-top-left" :product="$product" :type="$type" />
            <x-item view="item-top-right" :product="$product" :type="$type" />
        </div>
        @if ($type == 'job')
            <x-item view="item-tags" :product="$product" :type="$type" />
        @endif
        <h3 class="item-card-title">
            <a href="{{route("$type.details", [slug($product->name), $product->id])}}">{{__($product->name)}}</a>
        </h3>
    </div>
    <div class="item-card-footer">
        <x-item view="item-footer-left" :product="$product" :type="$type" />
        <x-item view="item-footer-right" :product="$product" :type="$type" />
    </div>
</div>

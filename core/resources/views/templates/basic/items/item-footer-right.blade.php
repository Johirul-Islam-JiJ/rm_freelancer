<div class="right">
    <div class="order-btn">
        @if ($type == 'service')
            <a href="{{route('user.service.booking.form', [slug($product->name), $product->id])}}" class="btn--base"><i class="las la-shopping-cart"></i> @lang('Order Now')</a>
        @elseif ($type == 'software')
            <a href="{{$product->demo_url}}" target="__blank" class="btn--base"><i class="las la-desktop"></i> @lang('Preview')</a>
        @elseif ($type == 'job')
            <a href="{{route('job.details', [slug($product->name), $product->id])}}" class="btn--base"><i class="las la-shopping-cart"></i> @lang('Bid Now')</a>
        @endif
    </div>
</div>

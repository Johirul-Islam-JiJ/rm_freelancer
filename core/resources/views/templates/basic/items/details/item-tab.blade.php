<div class="product-tab mt-40">
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="des-tab" data-bs-toggle="tab" data-bs-target="#des" type="button" role="tab" aria-controls="des" aria-selected="true">@lang('Description')</button>
            @if($type != 'job')
            <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">@lang('Reviews') ({{$itemDetails->total_review}})</button>
            @else
            <button class="nav-link" id="req-tab" data-bs-toggle="tab" data-bs-target="#req" type="button" role="tab" aria-controls="req" aria-selected="false">@lang('Requirements')</button>
            <button class="nav-link" id="bids-tab" data-bs-toggle="tab" data-bs-target="#bids" type="button" role="tab" aria-controls="bids" aria-selected="false">@lang('Bids') ({{$itemDetails->total_bid}})</button>
            @endif
            <button class="nav-link" id="comment-tab" data-bs-toggle="tab" data-bs-target="#comment" type="button" role="tab" aria-controls="comment" aria-selected="false">@lang('Comments')</button>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">

        <x-item-details view="item-description" :itemDetails="$itemDetails" :type="$type" />
        @if($type != 'job')
        <x-item-details view="item-reiview" :itemDetails="$itemDetails" :type="$type" />
        @else
        <x-item-details view="item-requirements" :itemDetails="$itemDetails" type="job" />
        <x-item-details view="item-bids" :itemDetails="$itemDetails" type="job" />
        @endif
        <x-item-details view="item-comments" :itemDetails="$itemDetails" :type="$type" />

    </div>
</div>

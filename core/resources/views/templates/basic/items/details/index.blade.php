<div class="item-details-box">
    <div class="d-flex flex-wrap justify-content-between align-items-center">
        <h2 class="title">{{ __($itemDetails->name) }}</h2>
        <span class="item-ratings">
            @php echo starRating($itemDetails->total_review, $itemDetails->total_rating) @endphp
            <span class="rating me-2">({{ $itemDetails->total_review }})</span>
        </span>
    </div>
    <div class="item-details-thumb-area">

        <x-item-details view="item-slider" :itemDetails="$itemDetails" :type="$type" />

        <div class="item-details-content border-top mt-4">

            <div class="item-details-footer mb-20-none">
                <x-item-details view="item-content-left" :itemDetails="$itemDetails" :type="$type" />
                <x-item-details view="item-content-right" :itemDetails="$itemDetails" :type="$type" />
            </div>
        </div>
    </div>
</div>

<x-item-details view="item-tab" :itemDetails="$itemDetails" :type="$type" />

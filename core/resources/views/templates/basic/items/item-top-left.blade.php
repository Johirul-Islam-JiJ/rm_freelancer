<div class="left">
    <div class="author-thumb">
        <img src="{{ getImage(getFilePath('userProfile').'/'.$product->user->image, getFileSize('userProfile')) }}">
    </div>
    <div class="author-content">
        <h5 class="name">
            <a href="{{route('public.profile', $product->user->username)}}">{{__($product->user->username)}}</a>
            <span class="level-text"> {{__(@$product->user->level->name)}}</span>
        </h5>
        @if (request()->routeIs('home') || $type=="service" || $type == 'software')
            <div class="ratings">
                @php echo starRating($product->total_review, $product->total_rating) @endphp
                <span class="rating me-2">
                    ({{$product->total_review}})
                </span>
            </div>
        @endif
    </div>
</div>

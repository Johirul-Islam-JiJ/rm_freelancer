<div class="tab-pane fade show active" id="des" role="tabpanel" aria-labelledby="des-tab">
    <div class="product-desc-content">
        @php echo $itemDetails->description @endphp
    </div>
    @if($type != 'job')
    <div class="item-details-tag">
        <h4 class="caption">@lang('Tags')</h4>
        <ul class="tags-wrapper">
            @foreach($itemDetails->tag as $tag)
                <li><a href="{{route($type)}}?tag={{ $tag }}">
                    {{__($tag)}}</a>
                </li>
            @endforeach
        </ul>
    </div>
    @endif
</div>

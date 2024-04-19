<div class="item-card-thumb">
    <img src="{{ getImage(getFilePath($type).'/'.$product->image, getFileSize($type)) }}">
    @if($product->featured)
        <div class="item-level">@lang('Featured')</div>
    @endif
</div>

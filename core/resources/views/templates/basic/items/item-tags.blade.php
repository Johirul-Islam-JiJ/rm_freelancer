<div class="item-tags order-3">
    @foreach($product->skill as $skill)
        <a href="{{route('job')}}?skill={{$skill}}">{{__($skill)}}</a>
    @endforeach
</div>

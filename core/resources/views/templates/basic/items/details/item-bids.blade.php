<div class="tab-pane fade" id="bids" role="tabpanel" aria-labelledby="bids-tab">
    @if($itemDetails->jobBidings->count())
        <div class="item-card-wrapper item-card-wrapper--style border-0 p-0 list-view justify-content-center mt-30">
            @foreach($itemDetails->jobBidings as $biding)
                <div class="item-card">
                    <div class="item-card-content">
                        <div class="item-card-content-top">
                            <div class="item-top-wrapper d-flex flex-wrap align-items-center justify-content-between">
                                <h3 class="item-card-title">{{__($biding->title)}}</h3>
                                <div class="right">
                                    <div class="item-amount">{{$general->cur_sym}}{{showAmount($biding->price)}}</div>
                                </div>
                            </div>
                            <p>{{__($biding->description)}}</p>
                            <div class="item-footer-wrapper d-flex flex-wrap align-items-center justify-content-between">
                                <div class="left">
                                    <div class="author-thumb">
                                        <img src="{{ getImage(getFilePath('userProfile').'/'.$biding->user->image, getFileSize('userProfile')) }}" alt="@lang('bidder')">
                                    </div>
                                    <div class="author-content">
                                        <h5 class="name">
                                            <a href="{{route('public.profile', $biding->user->username)}}">{{$biding->user->username}}</a>
                                            <span class="level-text">{{$biding->user->level?->name}}</span>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        @if(count($itemDetails->jobBidings) > 5)
            <div class="view-more-btn text-center mt-4">
                <button type="button" class="btn--base"> @lang('View More')</button>
            </div>
        @endif
    @else
        <x-basic-empty-message />
    @endif
</div>

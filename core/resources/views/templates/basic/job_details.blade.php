@extends($activeTemplate.'layouts.frontend')
@section('content')
    <section class="all-sections pt-60 pb-60">
        <div class="container-fluid p-max-sm-0">
            <div class="sections-wrapper d-flex flex-wrap justify-content-center">
                <article class="main-section">
                    <div class="section-inner">
                        <div class="item-section item-details-section">
                            <div class="container">
                                <div class="row justify-content-center mb-30-none">
                                    <div class="col-xl-9 col-lg-9 mb-30">
                                        <div class="item-details-area">
                                            <div class="item-details-box">
                                                <div class="item-details-thumb-area">
                                                    <div class="item-details-slider-area">
                                                        <div class="item-details-slider">
                                                            <div class="swiper-wrapper">
                                                                <div class="swiper-slide">
                                                                    <div class="item-details-thumb">
                                                                        <img src="{{ getImage(getFilePath('job').'/'.$productDetails->image, getFileSize('job')) }}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item-details-content">
                                                            <h2 class="title">{{__($productDetails->name)}}</h2>
                                                            <div class="item-details-footer">
                                                                <div class="left">
                                                                    <div class="item-details-tag p-0 m-0 border-0">
                                                                        <ul class="tags-wrapper">
                                                                            <li class="caption">@lang('Skill')</li>
                                                                            @foreach($productDetails->skill as $skill)
                                                                                <li>
                                                                                    <a href="{{route('job')}}?skill={{$skill}}">{{__($skill)}}</a>
                                                                                </li>
                                                                            @endforeach
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <x-item-details view="item-content-right" :itemDetails="$productDetails" type="job" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <x-item-details view="item-tab" :itemDetails="$productDetails" type="job" />

                                        </div>
                                    </div>

                                    <div class="col-xl-3 col-lg-3 mb-30">
                                        <div class="sidebar">
                                            <div class="widget custom-widget mb-30">
                                                <h3 class="widget-title">@lang('SHORT DETAILS')</h3>
                                                <ul class="details-list">
                                                    <li><span>@lang('Delivery Time')</span> <span>{{$productDetails->delivery_time}} @lang('Days')</span></li>
                                                    <li><span>@lang('Budget')</span> <span>{{showAmount($productDetails->price)}} {{__($general->cur_text)}}</span></li>
                                                </ul>
                                                @auth
                                                    @if (auth()->id() != $productDetails->user_id)
                                                        <div class="widget-btn mt-20">
                                                            <button type="button" data-bs-toggle="modal" data-bs-target="#bidModal" class="btn btn--base w-100 h-45" @disabled(@$existingJobBidCheck)>@lang('Bid Now')</button>
                                                        </div>
                                                    @endif
                                                @endauth
                                            </div>
                                            @include($activeTemplate.'partials.short_profile')
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>

    @include($activeTemplate.'partials.down_ad')

    @auth
        @if (auth()->id() != $productDetails->user_id)
            <div class="modal fade" id="bidModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="ModalLabel">@lang('Bid Now')</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                            </button>
                        </div>
                        <form action="{{route('user.job.bidding.store')}}" method="POST">
                            @csrf
                            <input type="hidden" name="job_id" value="{{$productDetails->id}}">
                            <div class="modal-body">
                                <div class="row justify-content-center">
                                    <div class="col-xl-12 form-group">
                                        <label>@lang('Title')</label>
                                        <input type="text" name="title" class="form-control"  value="{{old('title')}}" required>
                                    </div>
                                    <div class="col-xl-12 form-group">
                                        <label>@lang('Price')</label>
                                        <div class="input-group mb-3">
                                            <input type="number" step="any" class="form-control" name="price" value="{{old('price')}}" required>
                                            <span class="input-group-text">{{__($general->cur_text)}}</span>
                                        </div>
                                    </div>
                                    <div class="col-xl-12 form-group">
                                        <label>@lang('Description')</label>
                                        <textarea class="form-control bg--gray" name="description" rows="5" required>{{old('description')}}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn--base w-100 h-45">@lang('Submit')</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        @endif
    @endauth
@endsection

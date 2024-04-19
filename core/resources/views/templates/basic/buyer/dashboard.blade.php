@extends($activeTemplate.'layouts.master')
@section('content')
@php
    $kycContent = getContent('kyc_instructions.content', true);
@endphp
<div class="dashboard-section">
    <div class="row justify-content-center gy-3">
        <div class="col-lg-12">
            <label>@lang('Referral Link')</label>
            <div class="input-group">
                <input type="text" value="{{ route('user.register', [auth()->user()->username]) }}" class="form-control value-to-copy" readonly>
                <span class="input-group-text" type="button" id="copyBoard"> <i class="fa fa-copy"></i> </span>
            </div>
        </div>
        @if( (auth()->user()->kv == Status::KYC_UNVERIFIED) || (auth()->user()->kv == Status::KYC_PENDING) )
            <div class="col-xl-12">
                @if(auth()->user()->kv == Status::KYC_UNVERIFIED)
                    <div class="alert alert-info mb-0" role="alert">
                        <h4 class="alert-heading">@lang('KYC Verification required')</h4>
                        <hr>
                        <p class="mb-0">{{__(@$kycContent->data_values->for_verification)}}</p>
                        <br>
                        <a href="{{ route('user.kyc.form') }}" class="btn--base">@lang('Click here to verify')</a>
                    </div>
                @elseif(auth()->user()->kv == Status::KYC_PENDING)
                    <div class="alert alert-warning mb-0" role="alert">
                        <h4 class="alert-heading">@lang('KYC Verification pending')</h4>
                        <hr>
                        <p class="mb-0">{{__(@$kycContent->data_values->for_pending)}}</p>
                        <br>
                        <a href="{{ route('user.kyc.data') }}" class="btn--base">@lang('See KYC data')</a>
                    </div>
                @endif
            </div>
        @endif
        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
            <div class="dashboard-item bg--primary">
                <a href="{{route('user.transactions')}}" class="dash-btn">@lang('View all')</a>
                <div class="dashboard-icon">
                    <i class="las la-wallet"></i>
                </div>
                <div class="dashboard-content">
                    <div class="num text-white">{{ $general->cur_sym }}{{showAmount(auth()->user()->balance)}}</div>
                    <h3 class="title text-white">@lang('Current Balance')</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 ">
            <div class="dashboard-item bg--danger">
                <a href="{{route('user.transactions')}}" class="dash-btn">@lang('View all')</a>
                <div class="dashboard-icon">
                    <i class="las la-wallet"></i>
                </div>
                <div class="dashboard-content">
                    <div class="num text-white">{{$totalTrxCount}}</div>
                    <h3 class="title text-white">@lang('Total Transactions')</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 ">
            <div class="dashboard-item bg--info">
                <a href="{{route('user.buyer.job.index')}}" class="dash-btn">@lang('View all')</a>
                <div class="dashboard-icon">
                    <i class="las la-user-secret"></i>
                </div>
                <div class="dashboard-content">
                    <div class="num text-white">{{$totalJobCount}}</div>
                    <h3 class="title text-white">@lang('Total Job')</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 ">
            <div class="dashboard-item bg--warning">
                <a href="{{route('user.buyer.booked.services')}}" class="dash-btn">@lang('View all')</a>
                <div class="dashboard-icon">
                <i class="las la-shopping-bag"></i>
                </div>
                <div class="dashboard-content">
                    <div class="num text-white">{{$totalBookedService}}</div>
                    <h3 class="title text-white">@lang('Total Service Booked')</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 ">
            <div class="dashboard-item bg--success">
                <a href="{{route('user.buyer.software.log')}}" class="dash-btn">@lang('View all')</a>
                <div class="dashboard-icon">
                    <i class="las la-cart-arrow-down"></i>
                </div>
                <div class="dashboard-content">
                    <div class="num text-white">{{$totalPurchasedSoftware}}</div>
                    <h3 class="title text-white">@lang('Total Purchase Software')</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 ">
            <div class="dashboard-item section--bg">
                <a href="{{route('user.buyer.hiring.list')}}" class="dash-btn">@lang('View all')</a>
                <div class="dashboard-icon">
                <i class="lab la-hire-a-helper"></i>
                </div>
                <div class="dashboard-content">
                    <div class="num text-white">{{$totalHiredEmployee}}</div>
                    <h3 class="title text-white">@lang('Total Hire Employees')</h3>
                </div>
            </div>
        </div>
        <div class="col-12">
            @include($activeTemplate.'partials.transaction')
        </div>
    </div>
</div>
@endsection

@push('script')
    <script>
        (function($){
            "use strict";
            $('#copyBoard').click(function(){
                var copyText = document.getElementsByClassName("value-to-copy");
                copyText = copyText[0];
                copyText.select();
                copyText.setSelectionRange(0, 99999);
                /*For mobile devices*/
                document.execCommand("copy");
                copyText.blur();
                this.classList.add('copied');
                setTimeout(() => this.classList.remove('copied'), 1500);
            });
        })(jQuery);
    </script>
@endpush

@extends($activeTemplate.'layouts.master')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="table-section">
            <div class="table-area">
                <table class="custom-table">
                    <thead>
                        <tr>
                            <th>@lang('Service')</th>
                            <th>@lang('Order Number')</th>
                            @if (request()->routeIs('user.seller.booking.service.list'))
                                <th>@lang('Buyer')</th>
                            @else
                                <th>@lang('Seller')</th>
                            @endif
                            <th>@lang('Amount')</th>
                            <th>@lang('Status')</th>
                            <th>@lang('Working Status')</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($bookedServices as $booking)
                            <tr>
                                <td class="text-start">
                                    <div class="author-info">
                                        <div class="thumb">
                                            <a href="{{ route('service.details',['slug' => slug($booking->service->name),'id' => $booking->service->id]) }}"></a>
                                            <img src="{{ getImage(getFilePath('service').'/'.$booking->service->image, getFileSize('service')) }}" alt="@lang('Service Image')">
                                        </div>
                                        <div class="content">
                                            <span>{{strLimit(__($booking->service->name))}}</span>
                                        </div>
                                    </div>
                                </td>
                                <td>{{__($booking->order_number)}}</td>
                                <td>
                                    <div>
                                        @if (request()->routeIs('user.seller.booking.service.list'))
                                            <span class="fw-bold">{{__($booking->buyer->fullname)}}</span>
                                            <br>
                                            <span class="text--info">
                                                <a href="{{route('public.profile', $booking->buyer->username)}}"><span>@</span>{{ $booking->buyer->username }}</a>
                                            </span>
                                        @else
                                            <span class="fw-bold">{{__($booking->seller->fullname)}}</span>
                                            <br>
                                            <span class="text--info">
                                                <a href="{{route('public.profile', $booking->seller->username)}}"><span>@</span>{{ $booking->seller->username }}</a>
                                            </span>
                                        @endif
                                       </div>
                                    </td>
                                <td>{{showAmount($booking->price)}} {{__($general->cur_text)}}</td>
                                <td> <div>@php echo $booking->bookingStatusBadge @endphp</div> </td>
                                <td> <div>@php echo $booking->workingStatusBadge @endphp</div> </td>
                               
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>

                {{paginateLinks($bookedServices)}}

            </div>
        </div>
    </div>
</div>
<x-confirmation-modal class="frontend" />
@include($activeTemplate . 'partials.dispute_reason_modal')
@include($activeTemplate . 'partials.dispute_modal')
@include($activeTemplate . 'partials.work_delivery_modal')
@endsection


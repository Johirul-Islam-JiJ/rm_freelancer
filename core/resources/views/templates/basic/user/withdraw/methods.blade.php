@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card-area">
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <div class="card custom--card">
                            <div class="card-header d-flex flex-wrap align-items-center justify-content-between">
                                <h4 class="card-title mb-0">@lang('Withdraw Money')</h4>
                            </div>
                            <div class="card-body">
                                <form action="{{ route('user.withdraw.money') }}" method="POST">
                                    @csrf
                                    <div class="form-group">
                                        <label>@lang('Select Method')</label>
                                        <select class="form-control" name="method_code" required>
                                            <option value="">@lang('Select One')</option>
                                            @foreach ($withdrawMethod as $data)
                                                <option data-resource="{{ $data }}" value="{{ $data->id }}"> {{ __($data->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Amount')</label>
                                        <div class="input-group">
                                            <input class="form-control" name="amount" type="number" value="{{ old('amount') }}" step="any" autocomplete="off" required>
                                            <span class="input-group-text">{{ $general->cur_text }}</span>
                                        </div>
                                    </div>
                                    <div class="mt-3 mb-4 preview-details d-none">
                                        <ul class="list-group text-center list-group-flush">
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>@lang('Limit')</span>
                                                <span><span class="min fw-bold">0</span> {{ __($general->cur_text) }} - <span class="max fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>@lang('Charge')</span>
                                                <span><span class="charge fw-bold">0</span> {{ __($general->cur_text) }}</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>@lang('Receivable')</span> <span><span class="receivable fw-bold"> 0</span> {{ __($general->cur_text) }} </span>
                                            </li>
                                            <li class="list-group-item d-none justify-content-between rate-element">

                                            </li>
                                            <li class="list-group-item d-none justify-content-between in-site-cur">
                                                <span>@lang('In') <span class="base-currency"></span></span>
                                                <strong class="final_amount">0</strong>
                                            </li>
                                        </ul>
                                    </div>
                                    <button class="btn btn--base w-100" type="submit">@lang('Submit')</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";

            $('select[name=method_code]').change(function() {
                if (!$('select[name=method_code]').val()) {
                    $('.preview-details').addClass('d-none');
                    return false;
                }
                var resource = $('select[name=method_code] option:selected').data('resource');
                var fixed_charge = parseFloat(resource.fixed_charge);
                var percent_charge = parseFloat(resource.percent_charge);
                var rate = parseFloat(resource.rate)
                var toFixedDigit = 2;
                $('.min').text(parseFloat(resource.min_limit).toFixed(2));
                $('.max').text(parseFloat(resource.max_limit).toFixed(2));
                var amount = parseFloat($('input[name=amount]').val());
                if (!amount) {
                    amount = 0;
                }
                if (amount <= 0) {
                    $('.preview-details').addClass('d-none');
                    return false;
                }
                $('.preview-details').removeClass('d-none');

                var charge = parseFloat(fixed_charge + (amount * percent_charge / 100)).toFixed(2);
                $('.charge').text(charge);
                if (resource.currency != '{{ $general->cur_text }}') {
                    var rateElement = `<span>@lang('Conversion Rate')</span> <span class="fw-bold">1 {{ __($general->cur_text) }} = <span class="rate">${rate}</span>  <span class="base-currency">${resource.currency}</span></span>`;
                    $('.rate-element').html(rateElement);
                    $('.rate-element').removeClass('d-none');
                    $('.in-site-cur').removeClass('d-none');
                    $('.rate-element').addClass('d-flex');
                    $('.in-site-cur').addClass('d-flex');
                } else {
                    $('.rate-element').html('')
                    $('.rate-element').addClass('d-none');
                    $('.in-site-cur').addClass('d-none');
                    $('.rate-element').removeClass('d-flex');
                    $('.in-site-cur').removeClass('d-flex');
                }
                var receivable = parseFloat((parseFloat(amount) - parseFloat(charge))).toFixed(2);
                $('.receivable').text(receivable);
                var final_amount = parseFloat(parseFloat(receivable) * rate).toFixed(toFixedDigit);
                $('.final_amount').text(final_amount);
                $('.base-currency').text(resource.currency);
                $('.method_currency').text(resource.currency);
                $('input[name=amount]').on('input');
            });
            $('input[name=amount]').on('input', function() {
                var data = $('select[name=method_code]').change();
                $('.amount').text(parseFloat($(this).val()).toFixed(2));
            });
        })(jQuery);
    </script>
@endpush

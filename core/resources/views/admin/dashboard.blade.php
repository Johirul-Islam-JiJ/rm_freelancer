@extends('admin.layouts.app')
@section('panel')
    @if (@json_decode($general->system_info)->version > systemDetails()['version'])
        <div class="row">
            <div class="col-md-12">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-header">
                        <h3 class="card-title"> @lang('New Version Available') <button class="btn btn--dark float-end">@lang('Version') {{ json_decode($general->system_info)->version }}</button> </h3>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title text-dark">@lang('What is the Update?')</h5>
                        <p>
                            <pre class="f-size--24">{{ json_decode($general->system_info)->details }}</pre>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    @endif
    @if (@json_decode($general->system_info)->message)
        <div class="row">
            @foreach (json_decode($general->system_info)->message as $msg)
                <div class="col-md-12">
                    <div class="alert border border--primary" role="alert">
                        <div class="alert__icon bg--primary">
                            <i class="far fa-bell"></i>
                            <p class="alert__message">@php echo $msg; @endphp</p>
                            <button class="close" data-bs-dismiss="alert" type="button" aria-label="Close">
                                <span aria-hidden="true">×</span></button>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif

    <div class="row gy-4">
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['total_users'] }}" title="Total Users" link="{{ route('admin.users.all') }}" icon="las la-users f-size--56" bg="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['verified_users'] }}" title="Active Users" link="{{ route('admin.users.active') }}" icon="las la-user-check f-size--56" bg="success" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['email_unverified_users'] }}" title="Email Unverified Users" link="{{ route('admin.users.email.unverified') }}" icon="lar la-envelope f-size--56" bg="danger" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['mobile_unverified_users'] }}" title="Mobile Unverified Users" link="{{ route('admin.users.mobile.unverified') }}" icon="las la-comment-slash f-size--56" bg="red" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $general->cur_sym }}{{ showAmount($deposit['total_deposit_amount']) }}" title="Total Deposited" style="2" link="{{ route('admin.deposit.list') }}" icon="fas fa-hand-holding-usd" icon_style="false" color="success" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $deposit['total_deposit_pending'] }}" title="Pending Deposits" style="2" link="{{ route('admin.deposit.pending') }}" icon="fas fa-spinner" icon_style="false" color="warning" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $deposit['total_deposit_rejected'] }}" title="Rejected Deposits" style="2" link="{{ route('admin.deposit.rejected') }}" icon="fas fa-ban" icon_style="false" color="danger" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $general->cur_sym }}{{ showAmount($deposit['total_deposit_charge']) }}" title="Deposited Charge" style="2" link="{{ route('admin.deposit.list') }}" icon="fas fa-percentage" icon_style="false" color="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $general->cur_sym }}{{ showAmount($withdrawals['total_withdraw_amount']) }}" title="Total Withdrawn" style="2" link="{{ route('admin.withdraw.log') }}" icon="lar la-credit-card" color="success" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $withdrawals['total_withdraw_pending'] }}" title="Pending Withdrawals" style="2" link="{{ route('admin.withdraw.pending') }}" icon="las la-sync" color="warning" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $withdrawals['total_withdraw_rejected'] }}" title="Rejected Withdrawals" style="2" link="{{ route('admin.withdraw.rejected') }}" icon="las la-times-circle" color="danger" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $general->cur_sym }}{{ showAmount($withdrawals['total_withdraw_charge']) }}" title="Withdrawal Charge" style="2" link="{{ route('admin.withdraw.log') }}" icon="las la-percent" color="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalPendingServiceCount'] }}" title="Total Pending Service" style="3" link="{{ route('admin.service.pending') }}" icon="las la-taxi" bg="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalPendingSoftwareCount'] }}" title="Total Pending Software" style="3" link="{{ route('admin.software.pending') }}" icon="las la-laptop-code" bg="1" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalPendingJobCount'] }}" title="Total Pending Job" style="3" link="{{ route('admin.job.pending') }}" icon="las la-user-secret" bg="14" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalCategoryCount'] }}" title="Total Category" style="3" link="{{ route('admin.category.index') }}" icon="las la-user-secret" bg="19" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalSubcategoryCount'] }}" title="Total Subcategory" style="2" link="{{ route('admin.subcategory.index') }}" icon="las la-list" color="success" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalFeatureCount'] }}" title="Total Feature" style="2" link="{{ route('admin.feature.index') }}" icon="las la-bolt" color="warning" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalAdCount'] }}" title="Total Advertisement" style="2" link="{{ route('admin.advertisement.index') }}" icon="las la-ad" color="info" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalCouponCount'] }}" title="Total Coupon" style="2" link="{{ route('admin.coupon.index') }}" icon="las la-percentage" color="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['reportedServiceBookingCount'] }}" title="Reported Service Booking" style="2" link="{{ route('admin.booking.service.disputed') }}" icon="las la-taxi" color="danger" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['reportedJobHiringCount'] }}" title="Reported Job Bidding" style="2" link="{{ route('admin.hiring.job.disputed') }}" icon="las la-taxi" color="danger" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalSoftwareSaleCount'] }}" title="Total Software Sale" style="2" link="{{ route('admin.sales.software.log') }}" icon="las la-laptop-code" color="success" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget value="{{ $widget['totalLevelCount'] }}" title="Total Level" style="2" link="{{ route('admin.level.index') }}" icon="lab la-hackerrank" color="success" />
        </div>
        <div class="col-xl-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Monthly Deposit & Withdraw Report') (@lang('Last 12 Month'))</h5>
                    <div id="apex-bar-chart"> </div>
                </div>
            </div>
        </div>
        <div class="col-xl-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Transactions Report') (@lang('Last 30 Days'))</h5>
                    <div id="apex-line"></div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6">
            <div class="card overflow-hidden">
                <div class="card-body">
                    <h5 class="card-title">@lang('Login By Browser') (@lang('Last 30 days'))</h5>
                    <canvas id="userBrowserChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Login By OS') (@lang('Last 30 days'))</h5>
                    <canvas id="userOsChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">@lang('Login By Country') (@lang('Last 30 days'))</h5>
                    <canvas id="userCountryChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    {{-- Cron Modal --}}
    {{-- <div class="modal fade" id="cronModal" role="dialog" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> @lang('Cron Job Setting Instruction')</h5>
                    <button class="close" data-bs-dismiss="modal" type="button" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <p class="cron mb-2 text-justify">@lang('To automate mark already expired service booking and job
                                        hiring, you need to set the cron job. Set The cron time as minimum as possible.')</p>
                    <label class="w-100 fw-bold">@lang('Service Cron Command')</label>
                    <div class="input-group mb-3">
                        <input class="form-control copyText" type="text" value="curl -s {{ route('cron.service.expired') }}" readonly>
                        <button class="input-group-text btn btn--primary copyBtn" data-clipboard-text="curl -s {{ route('cron.service.expired') }}" type="button"><i class="la la-copy"></i></button>
                    </div>
                    <label class="w-100 fw-bold">@lang('Job Cron Command')</label>
                    <div class="input-group mb-3">
                        <input class="form-control copyText" type="text" value="curl -s {{ route('cron.job.expired') }}" readonly>
                        <button class="input-group-text btn btn--primary copyBtn" data-clipboard-text="curl -s {{ route('cron.job.expired') }}" type="button"><i class="la la-copy"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}

    @php
        $lastCron = Carbon\Carbon::parse($general->last_cron)->diffInSeconds();
    @endphp

    @if ($lastCron >= 900)
        @include('admin.partials.cron')
    @endif

@endsection

@push('breadcrumb-plugins')
    <span class="{{ $lastCron >= 900 ? 'text--danger' : 'text--primary' }}">@lang('Last Cron Run:')
        <strong>{{ diffForHumans($general->last_cron) }}</strong>
    </span>
@endpush

@push('script')
    <script src="{{ asset('assets/admin/js/vendor/apexcharts.min.js') }}"></script>
    <script src="{{ asset('assets/admin/js/vendor/chart.js.2.8.0.js') }}"></script>

    <script>
        "use strict";

        var options = {
            series: [{
                name: 'Total Deposit',
                data: [
                    @foreach ($months as $month)
                        {{ getAmount(@$depositsMonth->where('months', $month)->first()->depositAmount) }},
                    @endforeach
                ]
            }, {
                name: 'Total Withdraw',
                data: [
                    @foreach ($months as $month)
                        {{ getAmount(@$withdrawalMonth->where('months', $month)->first()->withdrawAmount) }},
                    @endforeach
                ]
            }],
            chart: {
                type: 'bar',
                height: 450,
                toolbar: {
                    show: false
                }
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '50%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            xaxis: {
                categories: @json($months),
            },
            yaxis: {
                title: {
                    text: "{{ $general->cur_sym }}",
                    style: {
                        color: '#7c97bb'
                    }
                }
            },
            grid: {
                xaxis: {
                    lines: {
                        show: false
                    }
                },
                yaxis: {
                    lines: {
                        show: false
                    }
                },
            },
            fill: {
                opacity: 1
            },
            tooltip: {
                y: {
                    formatter: function(val) {
                        return "{{ $general->cur_sym }}" + val + " "
                    }
                }
            }
        };
        var chart = new ApexCharts(document.querySelector("#apex-bar-chart"), options);
        chart.render();

        var ctx = document.getElementById('userBrowserChart');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: @json($chart['user_browser_counter']->keys()),
                datasets: [{
                    data: {{ $chart['user_browser_counter']->flatten() }},
                    backgroundColor: [
                        '#ff7675',
                        '#6c5ce7',
                        '#ffa62b',
                        '#ffeaa7',
                        '#D980FA',
                        '#fccbcb',
                        '#45aaf2',
                        '#05dfd7',
                        '#FF00F6',
                        '#1e90ff',
                        '#2ed573',
                        '#eccc68',
                        '#ff5200',
                        '#cd84f1',
                        '#7efff5',
                        '#7158e2',
                        '#fff200',
                        '#ff9ff3',
                        '#08ffc8',
                        '#3742fa',
                        '#1089ff',
                        '#70FF61',
                        '#bf9fee',
                        '#574b90'
                    ],
                    borderColor: [
                        'rgba(231, 80, 90, 0.75)'
                    ],
                    borderWidth: 0,

                }]
            },
            options: {
                aspectRatio: 1,
                responsive: true,
                maintainAspectRatio: true,
                elements: {
                    line: {
                        tension: 0 // disables bezier curves
                    }
                },
                scales: {
                    xAxes: [{
                        display: false
                    }],
                    yAxes: [{
                        display: false
                    }]
                },
                legend: {
                    display: false,
                }
            }
        });



        var ctx = document.getElementById('userOsChart');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: @json($chart['user_os_counter']->keys()),
                datasets: [{
                    data: {{ $chart['user_os_counter']->flatten() }},
                    backgroundColor: [
                        '#ff7675',
                        '#6c5ce7',
                        '#ffa62b',
                        '#ffeaa7',
                        '#D980FA',
                        '#fccbcb',
                        '#45aaf2',
                        '#05dfd7',
                        '#FF00F6',
                        '#1e90ff',
                        '#2ed573',
                        '#eccc68',
                        '#ff5200',
                        '#cd84f1',
                        '#7efff5',
                        '#7158e2',
                        '#fff200',
                        '#ff9ff3',
                        '#08ffc8',
                        '#3742fa',
                        '#1089ff',
                        '#70FF61',
                        '#bf9fee',
                        '#574b90'
                    ],
                    borderColor: [
                        'rgba(0, 0, 0, 0.05)'
                    ],
                    borderWidth: 0,

                }]
            },
            options: {
                aspectRatio: 1,
                responsive: true,
                elements: {
                    line: {
                        tension: 0 // disables bezier curves
                    }
                },
                scales: {
                    xAxes: [{
                        display: false
                    }],
                    yAxes: [{
                        display: false
                    }]
                },
                legend: {
                    display: false,
                }
            },
        });


        // Donut chart
        var ctx = document.getElementById('userCountryChart');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: @json($chart['user_country_counter']->keys()),
                datasets: [{
                    data: {{ $chart['user_country_counter']->flatten() }},
                    backgroundColor: [
                        '#ff7675',
                        '#6c5ce7',
                        '#ffa62b',
                        '#ffeaa7',
                        '#D980FA',
                        '#fccbcb',
                        '#45aaf2',
                        '#05dfd7',
                        '#FF00F6',
                        '#1e90ff',
                        '#2ed573',
                        '#eccc68',
                        '#ff5200',
                        '#cd84f1',
                        '#7efff5',
                        '#7158e2',
                        '#fff200',
                        '#ff9ff3',
                        '#08ffc8',
                        '#3742fa',
                        '#1089ff',
                        '#70FF61',
                        '#bf9fee',
                        '#574b90'
                    ],
                    borderColor: [
                        'rgba(231, 80, 90, 0.75)'
                    ],
                    borderWidth: 0,

                }]
            },
            options: {
                aspectRatio: 1,
                responsive: true,
                elements: {
                    line: {
                        tension: 0 // disables bezier curves
                    }
                },
                scales: {
                    xAxes: [{
                        display: false
                    }],
                    yAxes: [{
                        display: false
                    }]
                },
                legend: {
                    display: false,
                }
            }
        });

        // apex-line chart
        var options = {
            chart: {
                height: 450,
                type: "area",
                toolbar: {
                    show: false
                },
                dropShadow: {
                    enabled: true,
                    enabledSeries: [0],
                    top: -2,
                    left: 0,
                    blur: 10,
                    opacity: 0.08
                },
                animations: {
                    enabled: true,
                    easing: 'linear',
                    dynamicAnimation: {
                        speed: 1000
                    }
                },
            },
            dataLabels: {
                enabled: false
            },
            series: [{
                    name: "Plus Transactions",
                    data: [
                        @foreach ($trxReport['date'] as $trxDate)
                            {{ @$plusTrx->where('date', $trxDate)->first()->amount ?? 0 }},
                        @endforeach
                    ]
                },
                {
                    name: "Minus Transactions",
                    data: [
                        @foreach ($trxReport['date'] as $trxDate)
                            {{ @$minusTrx->where('date', $trxDate)->first()->amount ?? 0 }},
                        @endforeach
                    ]
                }
            ],
            fill: {
                type: "gradient",
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.7,
                    opacityTo: 0.9,
                    stops: [0, 90, 100]
                }
            },
            xaxis: {
                categories: [
                    @foreach ($trxReport['date'] as $trxDate)
                        "{{ $trxDate }}",
                    @endforeach
                ]
            },
            grid: {
                padding: {
                    left: 5,
                    right: 5
                },
                xaxis: {
                    lines: {
                        show: false
                    }
                },
                yaxis: {
                    lines: {
                        show: false
                    }
                },
            },
        };

        var chart = new ApexCharts(document.querySelector("#apex-line"), options);

        chart.render();
    </script>
@endpush

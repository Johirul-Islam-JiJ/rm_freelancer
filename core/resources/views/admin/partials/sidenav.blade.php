@php
    $admin = auth()
        ->guard('admin')
        ->user();
@endphp

<div class="sidebar bg--dark">
    <button class="res-sidebar-close-btn"><i class="las la-times"></i></button>
    <div class="sidebar__inner">
        <div class="sidebar__logo">
            <a class="sidebar__main-logo" href="{{ route('admin.dashboard') }}"><img src="{{ siteLogoDark() }}" alt="@lang('image')"></a>
        </div>
        <div class="sidebar__menu-wrapper" id="sidebar__menuWrapper">
            <ul class="sidebar__menu">
                @if ($admin && $admin->access('Manage Dashboard'))
                    <li class="sidebar-menu-item {{ menuActive('admin.dashboard') }}">
                        <a class="nav-link " href="{{ route('admin.dashboard') }}">
                            <i class="menu-icon las la-home"></i>
                            <span class="menu-title">@lang('Dashboard')</span>
                        </a>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Service Booking'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.booking.service*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-taxi"></i>
                            <span class="menu-title">@lang('Service Booking')</span>

                            @if (($pendingServiceBookingCount || $disputedServiceBookingCount) > 0)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.booking.service*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending')</span>

                                        @if ($pendingServiceBookingCount > 0)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $pendingServiceBookingCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.completed') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.completed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Completed')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.delivered') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.delivered') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Delivered')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.inprogress') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.inprogress') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Inprogress')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.disputed') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.disputed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Reported')</span>

                                        @if ($disputedServiceBookingCount > 0)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $disputedServiceBookingCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.refunded') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.refunded') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Refunded')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.expired') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.expired') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Expired')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.booking.service.all') }} ">
                                    <a class="nav-link" href="{{ route('admin.booking.service.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Job Bidding'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.hiring.job*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-user-secret"></i>
                            <span class="menu-title">@lang('Job Bidding')</span>

                            @if ($disputedJobBookingCount > 0)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>

                        <div class="sidebar-submenu {{ menuActive('admin.hiring.job*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.completed') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.completed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Completed')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.delivered') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.delivered') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Delivered')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.inprogress') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.inprogress') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Inprogress')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.disputed') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.disputed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Reported')</span>

                                        @if ($disputedJobBookingCount > 0)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $disputedJobBookingCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.canceled') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.canceled') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Canceled')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.expired') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.expired') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Expired')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.hiring.job.all') }} ">
                                    <a class="nav-link" href="{{ route('admin.hiring.job.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Software Sales'))
                    <li class="sidebar-menu-item {{ menuActive('admin.sales.software.log') }}">
                        <a class="nav-link" href="{{ route('admin.sales.software.log') }}">
                            <i class="menu-icon las la-laptop-code"></i>
                            <span class="menu-title">@lang('Software Sales')</span>
                        </a>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Users'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.users*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-users"></i>
                            <span class="menu-title">@lang('Manage Users')</span>

                            @if ($bannedUsersCount > 0 || $emailUnverifiedUsersCount > 0 || $mobileUnverifiedUsersCount > 0 || $kycUnverifiedUsersCount > 0 || $kycPendingUsersCount > 0)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.users*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.users.active') }} ">
                                    <a class="nav-link" href="{{ route('admin.users.active') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Active Users')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.users.banned') }} ">
                                    <a class="nav-link" href="{{ route('admin.users.banned') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Banned Users')</span>
                                        @if ($bannedUsersCount)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $bannedUsersCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item  {{ menuActive('admin.users.email.unverified') }}">
                                    <a class="nav-link" href="{{ route('admin.users.email.unverified') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Email Unverified')</span>

                                        @if ($emailUnverifiedUsersCount)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $emailUnverifiedUsersCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.users.mobile.unverified') }}">
                                    <a class="nav-link" href="{{ route('admin.users.mobile.unverified') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Mobile Unverified')</span>
                                        @if ($mobileUnverifiedUsersCount)
                                            <span
                                                  class="menu-badge pill bg--danger ms-auto">{{ $mobileUnverifiedUsersCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.users.kyc.unverified') }}">
                                    <a class="nav-link" href="{{ route('admin.users.kyc.unverified') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('KYC Unverified')</span>
                                        @if ($kycUnverifiedUsersCount)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $kycUnverifiedUsersCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.users.kyc.pending') }}">
                                    <a class="nav-link" href="{{ route('admin.users.kyc.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('KYC Pending')</span>
                                        @if ($kycPendingUsersCount)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $kycPendingUsersCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.users.with.balance') }}">
                                    <a class="nav-link" href="{{ route('admin.users.with.balance') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('With Balance')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.users.all') }} ">
                                    <a class="nav-link" href="{{ route('admin.users.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All Users')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.users.notification.all') }}">
                                    <a class="nav-link" href="{{ route('admin.users.notification.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Notification to All')</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Service'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.service*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-taxi"></i>
                            <span class="menu-title">@lang('Manage Service')</span>
                            @if ($pendingServiceCount > 0)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.service*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.service.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.service.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending')</span>

                                        @if ($pendingServiceCount > 0)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $pendingServiceCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.service.approved') }} ">
                                    <a class="nav-link" href="{{ route('admin.service.approved') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Approved')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.service.canceled') }} ">
                                    <a class="nav-link" href="{{ route('admin.service.canceled') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Canceled')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.service.closed') }} ">
                                    <a class="nav-link" href="{{ route('admin.service.closed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Closed')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.service.all') }} ">
                                    <a class="nav-link" href="{{ route('admin.service.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Job'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.job*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-user-secret"></i>
                            <span class="menu-title">@lang('Manage Job')</span>

                            @if ($pendingJobCount > 0)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.job*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.job.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.job.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending')</span>

                                        @if ($pendingJobCount > 0)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $pendingJobCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.job.approved') }} ">
                                    <a class="nav-link" href="{{ route('admin.job.approved') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Approved')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.job.canceled') }} ">
                                    <a class="nav-link" href="{{ route('admin.job.canceled') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Canceled')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.job.closed') }} ">
                                    <a class="nav-link" href="{{ route('admin.job.closed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Closed')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.job.all') }} ">
                                    <a class="nav-link" href="{{ route('admin.job.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Cron Job'))
                    <li class="sidebar-menu-item {{ menuActive('admin.cron*') }}">
                        <a class="nav-link" href="{{ route('admin.cron.index') }}">
                            <i class="menu-icon las la-clock"></i>
                            <span class="menu-title">@lang('Cron Job Setting')</span>
                        </a>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Software'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.software*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-laptop-code"></i>
                            <span class="menu-title">@lang('Manage Software')</span>

                            @if ($pendingSoftwareCount > 0)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.software*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.software.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.software.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending')</span>

                                        @if ($pendingSoftwareCount > 0)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $pendingSoftwareCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.software.approved') }} ">
                                    <a class="nav-link" href="{{ route('admin.software.approved') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Approved')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.software.canceled') }} ">
                                    <a class="nav-link" href="{{ route('admin.software.canceled') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Canceled')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.software.closed') }} ">
                                    <a class="nav-link" href="{{ route('admin.software.closed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Closed')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.software.all') }} ">
                                    <a class="nav-link" href="{{ route('admin.software.all') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if ($admin && $admin->access('Manage Gateway'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.gateway*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-credit-card"></i>
                            <span class="menu-title">@lang('Payment Gateways')</span>
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.gateway*', 2) }} ">
                            <ul>

                                <li class="sidebar-menu-item {{ menuActive('admin.gateway.automatic.*') }} ">
                                    <a class="nav-link" href="{{ route('admin.gateway.automatic.index') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Automatic Gateways')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.gateway.manual.*') }} ">
                                    <a class="nav-link" href="{{ route('admin.gateway.manual.index') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Manual Gateways')</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Deposit'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.deposit*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-file-invoice-dollar"></i>
                            <span class="menu-title">@lang('Deposits')</span>
                            @if (0 < $pendingDepositsCount)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.deposit*', 2) }} ">
                            <ul>

                                <li class="sidebar-menu-item {{ menuActive('admin.deposit.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.deposit.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending Deposits')</span>
                                        @if ($pendingDepositsCount)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $pendingDepositsCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.deposit.approved') }} ">
                                    <a class="nav-link" href="{{ route('admin.deposit.approved') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Approved Deposits')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.deposit.successful') }} ">
                                    <a class="nav-link" href="{{ route('admin.deposit.successful') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Successful Deposits')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.deposit.rejected') }} ">
                                    <a class="nav-link" href="{{ route('admin.deposit.rejected') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Rejected Deposits')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.deposit.initiated') }} ">

                                    <a class="nav-link" href="{{ route('admin.deposit.initiated') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Initiated Deposits')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.deposit.list') }} ">
                                    <a class="nav-link" href="{{ route('admin.deposit.list') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All Deposits')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Withdraw'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.withdraw*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon la la-bank"></i>
                            <span class="menu-title">@lang('Withdrawals') </span>
                            @if (0 < $pendingWithdrawCount)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.withdraw*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.withdraw.method.*') }}">
                                    <a class="nav-link" href="{{ route('admin.withdraw.method.index') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Withdrawal Methods')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.withdraw.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.withdraw.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending Withdrawals')</span>

                                        @if ($pendingWithdrawCount)
                                            <span class="menu-badge pill bg--danger ms-auto">{{ $pendingWithdrawCount }}</span>
                                        @endif
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.withdraw.approved') }} ">
                                    <a class="nav-link" href="{{ route('admin.withdraw.approved') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Approved Withdrawals')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.withdraw.rejected') }} ">
                                    <a class="nav-link" href="{{ route('admin.withdraw.rejected') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Rejected Withdrawals')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.withdraw.log') }} ">
                                    <a class="nav-link" href="{{ route('admin.withdraw.log') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All Withdrawals')</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Support Ticket'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.ticket*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon la la-ticket"></i>
                            <span class="menu-title">@lang('Support Ticket') </span>
                            @if (0 < $pendingTicketCount)
                                <span class="menu-badge pill bg--danger ms-auto">
                                    <i class="fa fa-exclamation"></i>
                                </span>
                            @endif
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.ticket*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.ticket.pending') }} ">
                                    <a class="nav-link" href="{{ route('admin.ticket.pending') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Pending Ticket')</span>
                                        @if ($pendingTicketCount)
                                            <span
                                                  class="menu-badge pill bg--danger ms-auto">{{ $pendingTicketCount }}</span>
                                        @endif
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.ticket.closed') }} ">
                                    <a class="nav-link" href="{{ route('admin.ticket.closed') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Closed Ticket')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.ticket.answered') }} ">
                                    <a class="nav-link" href="{{ route('admin.ticket.answered') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Answered Ticket')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.ticket.index') }} ">
                                    <a class="nav-link" href="{{ route('admin.ticket.index') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('All Ticket')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Report'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.report*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon la la-list"></i>
                            <span class="menu-title">@lang('Report') </span>
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.report*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive(['admin.report.transaction', 'admin.report.transaction.search']) }}">
                                    <a class="nav-link" href="{{ route('admin.report.transaction') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Transaction Log')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive(['admin.report.login.history', 'admin.report.login.ipHistory']) }}">
                                    <a class="nav-link" href="{{ route('admin.report.login.history') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Login History')</span>
                                    </a>
                                </li>

                                <li class="sidebar-menu-item {{ menuActive('admin.report.notification.history') }}">
                                    <a class="nav-link" href="{{ route('admin.report.notification.history') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Notification History')</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Subscriber'))
                    <li class="sidebar-menu-item  {{ menuActive('admin.subscriber.*') }}">
                        <a class="nav-link" data-default-url="{{ route('admin.subscriber.index') }}" href="{{ route('admin.subscriber.index') }}">
                            <i class="menu-icon las la-thumbs-up"></i>
                            <span class="menu-title">@lang('Subscribers') </span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Staff'))
                    <li class="sidebar-menu-item  {{ menuActive('admin.staff.*') }}">
                        <a class="nav-link" data-default-url="{{ route('admin.staff.index') }}" href="{{ route('admin.staff.index') }}">
                            <i class="menu-icon las la-users"></i>
                            <span class="menu-title">@lang('Manage Staff') </span>
                        </a>
                    </li>
                @endif
                @if (($admin && $admin->access('Manage Category')) || $admin->access('Manage Subcategory') || $admin->access('Manage Feature') || $admin->access('Manage Advertisement') || $admin->access('Manage Level') || $admin->access('Manage Coupon'))
                    <li class="sidebar__menu-header">@lang('BASIC')</li>
                @endif
                @if ($admin && $admin->access('Manage Category'))
                    <li class="sidebar-menu-item {{ menuActive('admin.category*') }}">
                        <a class="nav-link " href="{{ route('admin.category.index') }}">
                            <i class="menu-icon las la-list"></i>
                            <span class="menu-title">@lang('Manage Categories')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Subcategory'))
                    <li class="sidebar-menu-item {{ menuActive('admin.subcategory*') }}">
                        <a class="nav-link " href="{{ route('admin.subcategory.index') }}">
                            <i class="menu-icon las la-list"></i>
                            <span class="menu-title">@lang('Manage Subcategories')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Feature'))
                    <li class="sidebar-menu-item {{ menuActive('admin.feature*') }}">
                        <a class="nav-link " href="{{ route('admin.feature.index') }}">
                            <i class="menu-icon las la-bolt"></i>
                            <span class="menu-title">@lang('Manage Features')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Advertisement'))
                    <li class="sidebar-menu-item {{ menuActive('admin.advertisement*') }}">
                        <a class="nav-link " href="{{ route('admin.advertisement.index') }}">
                            <i class="menu-icon las la-ad"></i>
                            <span class="menu-title">@lang('Manage Advertisement')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Level'))
                    <li class="sidebar-menu-item {{ menuActive('admin.level*') }}">
                        <a class="nav-link " href="{{ route('admin.level.index') }}">
                            <i class="menu-icon lab la-hackerrank"></i>
                            <span class="menu-title">@lang('Manage Level')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Coupon'))
                    <li class="sidebar-menu-item {{ menuActive('admin.coupon*') }}">
                        <a class="nav-link " href="{{ route('admin.coupon.index') }}">
                            <i class="menu-icon las la-percentage"></i>
                            <span class="menu-title">@lang('Manage Coupon')</span>
                        </a>
                    </li>
                @endif

                @if (($admin && $admin->access('Manage General Setting')) || $admin->access('Manage System Configuration') || $admin->access('Manage Logo And Favicon') || $admin->access('Manage Extension') || $admin->access('Manage SEO Manager' || $admin->access('Manage KYC Setting') || $admin->access('Manage Notification Setting') || $admin->access('Manage Template') || $admin->access('Manage Frontend Section')))
                    <li class="sidebar__menu-header">@lang('Settings')</li>
                @endif

                @if ($admin && $admin->access('Manage General Setting'))
                    <li class="sidebar-menu-item {{ menuActive('admin.setting.index') }}">
                        <a class="nav-link" href="{{ route('admin.setting.index') }}">
                            <i class="menu-icon las la-life-ring"></i>
                            <span class="menu-title">@lang('General Setting')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage System Configuration'))
                    <li class="sidebar-menu-item {{ menuActive('admin.setting.system.configuration') }}">
                        <a class="nav-link" href="{{ route('admin.setting.system.configuration') }}">
                            <i class="menu-icon las la-cog"></i>
                            <span class="menu-title">@lang('System Configuration')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Logo And Favicon'))
                    <li class="sidebar-menu-item {{ menuActive('admin.setting.logo.icon') }}">
                        <a class="nav-link" href="{{ route('admin.setting.logo.icon') }}">
                            <i class="menu-icon las la-images"></i>
                            <span class="menu-title">@lang('Logo & Favicon')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Extension'))
                    <li class="sidebar-menu-item {{ menuActive('admin.extensions.index') }}">
                        <a class="nav-link" href="{{ route('admin.extensions.index') }}">
                            <i class="menu-icon las la-cogs"></i>
                            <span class="menu-title">@lang('Extensions')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Social'))
                <li class="sidebar-menu-item {{ menuActive('admin.setting.socialite.credentials') }}">
                    <a href="{{ route('admin.setting.socialite.credentials') }}" class="nav-link">
                        <i class="menu-icon las la-users-cog"></i>
                        <span class="menu-title">@lang('Social Credentials')</span>
                    </a>
                </li>
                @endif
                @if ($admin && $admin->access('Manage Language'))
                    <li class="sidebar-menu-item  {{ menuActive(['admin.language.manage', 'admin.language.key']) }}">
                        <a class="nav-link" data-default-url="{{ route('admin.language.manage') }}" href="{{ route('admin.language.manage') }}">
                            <i class="menu-icon las la-language"></i>
                            <span class="menu-title">@lang('Language') </span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage SEO Manager'))
                    <li class="sidebar-menu-item {{ menuActive('admin.seo') }}">
                        <a class="nav-link" href="{{ route('admin.seo') }}">
                            <i class="menu-icon las la-globe"></i>
                            <span class="menu-title">@lang('SEO Manager')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage KYC Setting'))
                    <li class="sidebar-menu-item {{ menuActive('admin.kyc.setting') }}">
                        <a class="nav-link" href="{{ route('admin.kyc.setting') }}">
                            <i class="menu-icon las la-user-check"></i>
                            <span class="menu-title">@lang('KYC Setting')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Notification Setting'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.setting.notification*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon las la-bell"></i>
                            <span class="menu-title">@lang('Notification Setting')</span>
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.setting.notification*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.setting.notification.global') }} ">
                                    <a class="nav-link" href="{{ route('admin.setting.notification.global') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Global Template')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.setting.notification.email') }} ">
                                    <a class="nav-link" href="{{ route('admin.setting.notification.email') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Email Setting')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.setting.notification.sms') }} ">
                                    <a class="nav-link" href="{{ route('admin.setting.notification.sms') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('SMS Setting')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.setting.notification.templates') }} ">
                                    <a class="nav-link" href="{{ route('admin.setting.notification.templates') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Notification Templates')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if (($admin && $admin->access('Manage Frontend Section')) || $admin->access('Manage Template') || $admin->access('Manage Maintenance Mode') || $admin->access('Manage GDPR Cookie'))
                    <li class="sidebar__menu-header">@lang('Frontend Manager')</li>
                @endif

                @if ($admin && $admin->access('Manage Template'))
                    <li class="sidebar-menu-item {{ menuActive('admin.frontend.templates') }}">
                        <a class="nav-link " href="{{ route('admin.frontend.templates') }}">
                            <i class="menu-icon la la-html5"></i>
                            <span class="menu-title">@lang('Manage Templates')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage Frontend Section'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.frontend.sections*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon la la-puzzle-piece"></i>
                            <span class="menu-title">@lang('Manage Section')</span>
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.frontend.sections*', 2) }} ">
                            <ul>
                                @php
                                    $lastSegment = collect(request()->segments())->last();
                                @endphp
                                @foreach (getPageSections(true) as $k => $secs)
                                    @if ($secs['builder'])
                                        <li class="sidebar-menu-item  @if ($lastSegment == $k) active @endif ">
                                            <a class="nav-link" href="{{ route('admin.frontend.sections', $k) }}">
                                                <i class="menu-icon las la-dot-circle"></i>
                                                <span class="menu-title">{{ __($secs['name']) }}</span>
                                            </a>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        </div>
                    </li>
                @endif

                @if (($admin && $admin->access('Others')) || $admin->access('Manage Maintenance Mode') || $admin->access('Manage GDPR Cookie'))
                    <li class="sidebar__menu-header">@lang('Extra')</li>
                @endif
                @if ($admin && $admin->access('Manage Maintenance Mode'))
                    <li class="sidebar-menu-item {{ menuActive('admin.maintenance.mode') }}">
                        <a class="nav-link" href="{{ route('admin.maintenance.mode') }}">
                            <i class="menu-icon las la-robot"></i>
                            <span class="menu-title">@lang('Maintenance Mode')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Manage GDPR Cookie'))
                    <li class="sidebar-menu-item {{ menuActive('admin.setting.cookie') }}">
                        <a class="nav-link" href="{{ route('admin.setting.cookie') }}">
                            <i class="menu-icon las la-cookie-bite"></i>
                            <span class="menu-title">@lang('GDPR Cookie')</span>
                        </a>
                    </li>
                @endif
                @if ($admin && $admin->access('Others'))
                    <li class="sidebar-menu-item sidebar-dropdown">
                        <a class="{{ menuActive('admin.system*', 3) }}" href="javascript:void(0)">
                            <i class="menu-icon la la-server"></i>
                            <span class="menu-title">@lang('System')</span>
                        </a>
                        <div class="sidebar-submenu {{ menuActive('admin.system*', 2) }} ">
                            <ul>
                                <li class="sidebar-menu-item {{ menuActive('admin.system.info') }} ">
                                    <a class="nav-link" href="{{ route('admin.system.info') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Application')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.system.server.info') }} ">
                                    <a class="nav-link" href="{{ route('admin.system.server.info') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Server')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.system.optimize') }} ">
                                    <a class="nav-link" href="{{ route('admin.system.optimize') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Cache')</span>
                                    </a>
                                </li>
                                <li class="sidebar-menu-item {{ menuActive('admin.system.update') }} ">
                                    <a class="nav-link" href="{{ route('admin.system.update') }}">
                                        <i class="menu-icon las la-dot-circle"></i>
                                        <span class="menu-title">@lang('Update')</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="sidebar-menu-item {{ menuActive('admin.setting.custom.css') }}">
                        <a class="nav-link" href="{{ route('admin.setting.custom.css') }}">
                            <i class="menu-icon lab la-css3-alt"></i>
                            <span class="menu-title">@lang('Custom CSS')</span>
                        </a>
                    </li>
                    <li class="sidebar-menu-item  {{ menuActive('admin.request.report') }}">
                        <a class="nav-link" data-default-url="{{ route('admin.request.report') }}" href="{{ route('admin.request.report') }}">
                            <i class="menu-icon las la-bug"></i>
                            <span class="menu-title">@lang('Report & Request') </span>
                        </a>
                    </li>
                @endif
            </ul>
            <div class="text-center mb-3 text-uppercase">
                <span class="text--primary">{{ __(systemDetails()['name']) }}</span>
                <span class="text--success">@lang('V'){{ systemDetails()['version'] }} </span>
            </div>
        </div>
    </div>
</div>
<!-- sidebar end -->

@push('script')
    <script>
        if ($('li').hasClass('active')) {
            $('#sidebar__menuWrapper').animate({
                scrollTop: eval($(".active").offset().top - 320)
            }, 500);
        }
    </script>
@endpush

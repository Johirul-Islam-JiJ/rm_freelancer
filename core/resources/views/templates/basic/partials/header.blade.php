<header class="header-section">
    <div class="header">
        <div class="header-bottom-area">
            <div class="container-fluid">
                <div class="header-menu-content">
                    <nav class="navbar navbar-expand-lg p-0">
                        <a class="site-logo site-title" href="{{ route('home') }}"><img src="{{ siteLogo() }}"></a>
                        <button class="navbar-toggler ms-auto" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" type="button"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="fas fa-bars"></span>
                        </button>
                        <button class="short-menu-open-btn" type="button"><i class="fas fa-align-center"></i></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav main-menu ms-auto me-auto">
                                <li><a class="{{ menuActive('home') }}" href="{{ route('home') }}">@lang('HOME')</a>
                                </li>
                                <li><a class="{{ menuActive('service') }}"
                                        href="{{ route('service') }}">@lang('SERVICE')</a></li>
                                {{-- <li><a class="{{ menuActive('software') }}" href="{{ route('software') }}">@lang('SOFTWARE')</a></li> --}}
                                <li><a class="{{ menuActive('job') }}" href="{{ route('job') }}">@lang('JOB')</a>
                                </li>

                                @if ((request()->routeIs('user*') && auth()->check()) || (request()->routeIs('ticket*') && auth()->check()))

                                    @if (auth()->user()->user_type == 1)
                                        <li>
                                            <a class="{{ menuActive('user.seller*') }}"
                                                href="{{ route('user.seller.home') }}">@lang('SELLER')</a>
                                        </li>

                                        <li>
                                            <a class="{{ menuActive('user.buyer*') }}"
                                                href="{{ route('user.buyer.home') }}">@lang('BUYER')</a>
                                        </li>
                                    @elseif(auth()->user()->user_type == 2)
                                        <li>
                                            <a class="{{ menuActive('user.buyer*') }}"
                                                href="{{ route('user.buyer.home') }}">@lang('BUYER')</a>
                                        </li>
                                    @endif


                                    <li><a class="{{ menuActive('user.inbox*') }}"
                                            href="{{ route('user.inbox.list') }}">@lang('INBOX')</a></li>
                                    <li><a class="{{ menuActive('ticket*') }}"
                                            href="{{ route('ticket.index') }}">@lang('SUPPORT')</a></li>
                                @else
                                    <li><a href="{{ route('blogs') }}">@lang('BLOGS')</a></li>
                                    <li><a class="{{ menuActive('contact') }}"
                                            href="{{ route('contact') }}">@lang('CONTACT')</a></li>
                                @endif
                            </ul>
                            @if ($general->multi_language)

                                <div class="language-select-area">
                                    <select class="language-select langSel">
                                        @foreach ($language as $item)
                                            <option value="{{ $item->code }}"
                                                @if (session('lang') == $item->code) selected @endif>
                                                {{ __($item->name) }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            @endif
                            @if ((request()->routeIs('user*') && auth()->check()) || (request()->routeIs('ticket*') && auth()->check()))
                                <div class="header-right dropdown">
                                    <button data-bs-toggle="dropdown" data-display="static" type="button"
                                        aria-haspopup="true" aria-expanded="false">
                                        <div
                                            class="header-user-area d-flex flex-wrap align-items-center justify-content-between">
                                            <div class="header-user-thumb">
                                                <a href="JavaScript:Void(0);"><img
                                                        src="{{ getImage(getFilePath('userProfile') . '/' . auth()->user()->image, getFileSize('userProfile')) }}"
                                                        alt="client"></a>
                                            </div>
                                            <div class="header-user-content">
                                                <span>@lang('Account')</span>
                                            </div>
                                            <span class="header-user-icon"><i
                                                    class="las la-chevron-circle-down"></i></span>
                                        </div>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu--sm p-0 border-0 dropdown-menu-right">
                                        <a class="dropdown-menu__item d-flex align-items-center px-3 py-2"
                                            href="{{ route('user.seller.home') }}">
                                            <i class="dropdown-menu__icon lab la-buffer"></i>
                                            <span class="dropdown-menu__caption">@lang('Dashboard')</span>
                                        </a>
                                        <a class="dropdown-menu__item d-flex align-items-center px-3 py-2"
                                            href="{{ route('user.change.password') }}">
                                            <i class="dropdown-menu__icon las la-key"></i>
                                            <span class="dropdown-menu__caption">@lang('Change Password')</span>
                                        </a>
                                        <a class="dropdown-menu__item d-flex align-items-center px-3 py-2"
                                            href="{{ route('user.profile.setting') }}">
                                            <i class="dropdown-menu__icon las la-user-circle"></i>
                                            <span class="dropdown-menu__caption">@lang('Profile Settings')</span>
                                        </a>
                                        <a class="dropdown-menu__item d-flex align-items-center px-3 py-2"
                                            href="{{ route('user.twofactor') }}">
                                            <i class="dropdown-menu__icon las la-shield-alt"></i>
                                            <span class="dropdown-menu__caption">@lang('2FA Security')</span>
                                        </a>
                                        <a class="dropdown-menu__item d-flex align-items-center px-3 py-2"
                                            href="{{ route('user.logout') }}">
                                            <i class="dropdown-menu__icon las la-sign-out-alt"></i>
                                            <span class="dropdown-menu__caption">@lang('Logout')</span>
                                        </a>
                                    </div>
                                </div>
                            @else
                                <div class="header-action">
                                    @auth
                                        @if (auth()->user()->user_type == 1)
                                            <a class="btn btn--base"
                                                href="{{ route('user.seller.home') }}">@lang('Dashboard')</a>
                                        @elseif(auth()->user()->user_type == 2)
                                            <a class="btn btn--base"
                                                href="{{ route('user.buyer.home') }}">@lang('Dashboard')</a>
                                        @endif
                                        <a class="btn btn--base" href="{{ route('user.logout') }}">@lang('Logout')</a>
                                    @else
                                        <a class="btn btn--base" href="{{ route('user.login') }}">@lang('Sign In')</a>
                                        <a class="btn btn--base" href="{{ route('user.register') }}">@lang('Sign Up')</a>
                                    @endauth
                                </div>
                            @endif
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <div class="header-short-menu">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="short-menu">
                            <li class="short-menu-close-btn-area"> <button class="short-menu-close-btn"
                                    type="button">@lang('Close')</button></li>
                            @foreach ($categories as $category)
                                <li><a
                                        href="{{ route('category.wise.product', [slug($category->name), $category->id]) }}">{{ __($category->name) }}</a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

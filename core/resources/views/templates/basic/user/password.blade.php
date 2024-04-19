@extends($activeTemplate . 'layouts.master')
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card-area">
                <div class="row justify-content-center">
                    <div class="col-xl-12">
                        <div class="card custom--card">
                            <div class="card-header d-flex flex-wrap align-items-center justify-content-between">
                                <h4 class="card-title mb-0">@lang('Change Password')</h4>
                            </div>
                            <div class="card-body">
                                <div class="card-form-wrapper">
                                    <form action="" method="POST">
                                        @csrf
                                        <div class="row justify-content-center">
                                            <div class="form-group">
                                                <input class="form-control" name="current_password" type="password" placeholder="@lang('Current Password')" required>
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control form--control @if ($general->secure_password) secure-password @endif" name="password" type="password" placeholder="@lang('New Password')" required autocomplete="current-password">
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control" name="password_confirmation" type="password" placeholder="@lang('Confirm Password')" required>
                                            </div>
                                            <div class="form-group">
                                                <button class="submit-btn w-100" type="submit">@lang('Change Password')</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif

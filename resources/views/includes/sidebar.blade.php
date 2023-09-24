<ul class="menu-inner py-1">
    <!-- Dashboard -->
    <li class="menu-item {{ $pages == 'dashboard' ? 'active' : '' }}">
        <a href="{{ route('dashboard') }}" class="menu-link">
            <i class="menu-icon tf-icons fa-solid fa-house"></i>
            <div data-i18n="Analytics">Dashboard</div>
        </a>
    </li>
    @if (Auth::user() != null)
        @if (Auth::user()->tipeuser == 'admin')
            @include('includes.sidebar_admin')
        @elseif (Auth::user()->tipeuser == 'pelanggan')
            @include('includes.sidebar_pelanggan')
        @elseif (Auth::user()->tipeuser == 'owner')
            @include('includes.sidebar_owner')
        @endif

    @endif
</ul>

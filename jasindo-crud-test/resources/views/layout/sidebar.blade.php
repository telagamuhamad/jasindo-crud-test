<div class="bg-light border-right" id="sidebar-wrapper">
    <div class="list-group list-group-flush">
        <a href="{{ route('items.index') }}" class="list-group-item list-group-item-action bg-light">Items</a>
        @if (Auth::user()->hasRole('Super Admin'))
            <a href="{{ route('users.index') }}" class="list-group-item list-group-item-action bg-light">Users</a>
        @endif
    </div>
</div>
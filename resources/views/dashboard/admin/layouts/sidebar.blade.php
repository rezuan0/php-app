<header class="header bg-light" id="header">
    <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
    <div class="text-dark"> {{Auth::guard('admin')->user()->name}} | Admin Panel </div>
</header>
<div class="l-navbar" id="nav-bar">
    <nav class="nav">
        <div>
            <a href="{{route('admin.home')}}" class="nav_logo"> <img src="https://img.icons8.com/dusk/29/000000/huawei-logo.png" /><span class="nav_logo-name"> Vendor</span> </a>
            <div class="nav_list">
                <a href="{{route('admin.home')}}" class="nav_link {{ Request::is('admin/home') ? 'active' : '' }}"> <i class='bx bxs-dashboard nav_icon'></i> <span class="nav_name">Dashboard</span> </a>
                {{-- <a href="{{asset('/visitors')}}" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Visitors</span> </a> --}}
                <a href="{{route('admin.users')}}" class="nav_link {{ Request::is('admin/users') ? 'active' : '' }}"> <i class='bx bxs-user-rectangle nav_icon'></i> <span class="nav_name">Users</span> </a>
                <a href="{{route('admin.vendors')}}" class="nav_link {{ Request::is('admin/manage_vendors') ? 'active' : '' }}"> <i class='bx bx-store nav_icon'></i> <span class="nav_name">Vendors</span> </a>
                <a href="{{route('admin.categories')}}" class="nav_link {{ Request::is('admin/categories') ? 'active' : '' }}"> <i class=' bx bx-list-check nav_icon'></i> <span class="nav_name">Categories</span> </a>
                <a href="{{route('admin_chat')}}" class="nav_link {{ Request::is('admin_chat') ? 'active' : '' }}"> <i class="bx bxs-message-dots"></i> <span class="nav_name">Conversations</span> </a>

                <a href="{{route('admin.users.verify_payment')}}" class="nav_link {{ Request::is('admin/verify_payment') ? 'active' : '' }}"> <i class='bx bxl-paypal'></i> <span class="nav_name">Verify Payments</span> </a>


            </div>

        </div>
        <a href="{{route('admin.logout')}}" class="nav_link" onclick="event.preventDefault();document.getElementById('user-logout').submit();"><i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span></a>
        <form action="{{route('admin.logout')}}" method="post" id="user-logout" class="d-none">@csrf</form>

    </nav>
</div>
<!--Container Main start-->

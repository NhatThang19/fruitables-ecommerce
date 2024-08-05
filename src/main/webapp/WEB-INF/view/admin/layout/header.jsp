<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin">
                <img src="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png" alt="Logo" height="40">
                <span class="align-middle">Fruitables</span>
            </a>

            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar user-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <span style="color: white;">Welcome, Knight</span>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><img class="rounded-circle"
                            src="https://scontent.fhan5-7.fna.fbcdn.net/v/t39.30808-6/452231492_1468700950685525_7992120854391726082_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeEHJkCHqybpAa4VP2juqK0kAFsGOc3RHGQAWwY5zdEcZIjiJFFzIJjq-30Ql9f0nToRf5nQpcajV497DxlSojuc&_nc_ohc=WP2oy_AOlrgQ7kNvgHFnTDU&_nc_ht=scontent.fhan5-7.fna&oh=00_AYDHzWnP6xN6-fXfyqdOyyNEttMjRF2_Sc8aT1jxbJXv6A&oe=66A7F73B"
                            alt="avatar" height="40px"></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
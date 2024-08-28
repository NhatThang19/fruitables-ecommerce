<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark"
            style="background-image: linear-gradient(to right, #FF4C4C, #88D66C)" ;>
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin">
                <img src="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png" alt="Logo" height="40">
                <span class="align-middle">Fruitables</span>
            </a>

            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar user-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <span style="color: white;">Welcome,
                    <c:out value="${sessionScope.name}" />
                </span>
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><img class="rounded-circle"
                            src="<c:out value='${sessionScope.avatar}' />" alt="avatar" height="40px"></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li>
                            <img class="img-fluid" src="<c:out value='${sessionScope.avatar}' />" alt="">
                        </li>
                        <li class="dropdown-item">
                            <a href="/" style="color: black; text-decoration: none;">Trang chủ</a>
                        </li>
                        <li>
                            <form method="post" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="dropdown-item">Đăng xuất</button>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
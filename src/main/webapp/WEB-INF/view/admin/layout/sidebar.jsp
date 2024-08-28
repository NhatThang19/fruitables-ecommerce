<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion"
                    style="background-image: linear-gradient(to bottom, #FF4C4C, #88D66C) !important;">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link ${path == 'admin' ? 'active' : ''}" href="/admin">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-house-chimney"></i></div>
                                Trang chủ
                            </a>

                            <a class="nav-link ${path == 'user' ? 'active' : ''}" href="/admin/user">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-user"></i></div>
                                Người dùng
                            </a>

                            <a class="nav-link ${path == 'product' ? 'active' : ''}" href="/admin/product">
                                <div class=" sb-nav-link-icon"><i class="fa-brands fa-product-hunt"></i>
                                </div>
                                Sản phẩm
                            </a>

                            <a class="nav-link ${path == 'image' ? 'active' : ''}" href="/admin/gallery">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-photo-film"></i></div>
                                Bộ sưu tập
                            </a>

                            <a class="nav-link collapsed ${path == 'tag' ? 'active' : ''}" href="#"
                                data-bs-toggle="collapse" data-bs-target="#collapseTags" aria-expanded="false"
                                aria-controls="collapseTags">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-tag"></i></div>
                                Nhãn
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTags" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/admin/category"><i class="me-2 bi bi-egg-fried"></i>Thể
                                        loại</a>
                                    <a class="nav-link" href="/admin/origin"><i
                                            class="me-2 bi bi-globe-asia-australia"></i>Nguồn
                                        gốc</a>
                                    <a class="nav-link" href="/admin/unit"><i class="me-2 bi bi-basket"></i> Đơn
                                        vị</a>
                                </nav>
                            </div>

                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-circle-info"></i></div>
                                Thông tin trang
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer" style="background-color: #55AD9B;">
                        <div class="small">Đăng nhập bởi: </div>
                        <c:out value="${sessionScope.name}" />
                    </div>
                </nav>
            </div>
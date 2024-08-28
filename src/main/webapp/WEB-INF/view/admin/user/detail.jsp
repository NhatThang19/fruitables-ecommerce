<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>View user - Fruitables</title>
                <%@include file="../layout/head.jsp" %>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/loading.jsp" />
                <div id="content">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main class="mb-3">
                                <div class="container-fluid px-4">
                                    <h2 class="mt-4">Quản lý người dùng</h2>
                                    <ol class="breadcrumb mb-5">
                                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/user">Người dùng</a></li>
                                        <li class="breadcrumb-item active">Chi tiết</li>
                                    </ol>
                                    <div class="row">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h3 class="align-middle">Chi tiết người dùng với ID: ${user.id}</h3>
                                        </div>
                                        <hr>
                                        <div class="card mx-auto card-detail" style="max-width: 768px; height: auto;">
                                            <div class="row g-0">
                                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                                    <a href="${user.image.src}" data-toggle="lightbox"
                                                        data-gallery="image gallery">
                                                        <img src="${user.image.src}" class="card-img-top"
                                                            alt="user image">
                                                    </a>
                                                </div>
                                                <div class="card-body col-md-8">
                                                    <h5 class="card-title text-center">${user.surname} ${user.name}</h5>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Email:</span>
                                                            ${user.email}
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Vai trò:</span>
                                                            ${user.role.name}
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Địa chỉ:</span>
                                                            ${user.address}
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Giới tính:</span>
                                                            ${user.gender}
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Trạng thái:</span>
                                                            ${user.status}
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Ngày tạo:</span>
                                                            ${user.createdDate}
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span class="fw-bold">Lần cuối sửa:</span>
                                                            ${user.lastModifiedDate}
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                </div>
                <%@include file="../layout/js.jsp" %>
            </body>

            </html>
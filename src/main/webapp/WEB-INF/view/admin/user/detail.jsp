<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nhật Thắng - Dự án website hoa quả" />
                <meta name="author" content="Nhật Thắng" />
                <title>View user - Fruitables</title>
                <script src="https://code.jquery.com/jquery-3.7.1.slim.js"
                    integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
                <link rel="icon" type="image/x-icon" href="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png">
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/admin/css/styles.css" rel="stylesheet" />
                <link rel="stylesheet" href="/admin/css/main.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                                    <img src="${user.image.src}" class="card-img-top" alt="user image">
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
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/scripts.js"></script>
                <script src="/admin/js/jquery.js"></script>
            </body>

            </html>
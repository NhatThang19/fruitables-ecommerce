<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Nhật Thắng - Dự án website hoa quả" />
            <meta name="author" content="Nhật Thắng" />
            <title>Dashboard</title>
            <link rel="icon" type="image/x-icon" href="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png">
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="/admin/css/main.css">
            <link href="/admin/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h2 class="mt-4">Quản lý người dùng</h2>
                            <ol class="breadcrumb mb-5">
                                <li class="breadcrumb-item">
                                    <a href="/admin">Trang chủ</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    Người dùng
                                </li>
                            </ol>
                            <div class="row">
                                <div class="d-flex justify-content-between mb-3">
                                    <h3 class="align-middle">Người dùng</h3>
                                    <a href="/admin/user/create" class="btn btn-primary">Tạo người dùng</a>
                                </div>
                                <hr>
                                <div class="table-user">
                                    <table class="table table-hover table-bordered">
                                        <thead class="table-info">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Họ tên</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Vai trò</th>
                                                <th scope="col">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users}">
                                                <tr>
                                                    <th>${user.id}</th>
                                                    <td>${user.surname} ${user.name}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.role.name}</td>
                                                    <td>
                                                        <a href="/admin/user/${user.id}" class="btn btn-success">Xem</a>
                                                        <a href="/admin/user/update/${user.id}"
                                                            class="btn btn-warning  mx-2">Sửa</a>
                                                        <a href="/admin/user/delete/${user.id}"
                                                            class="btn btn-danger">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <c:forEach var="user" items="${users}">
                                    <div class="card-user mb-3">
                                        <div class="card">
                                            <div class="card-header">
                                                ${user.surname} ${user.name}
                                            </div>
                                            <div class="card-body">
                                                <ul class=" list-group list-group-flush">
                                                    <li class="list-group-item">ID: ${user.id}</li>
                                                    <li class="list-group-item">Email: ${user.email}</li>
                                                    <li class="list-group-item">Vai trò: ${user.role.name}</li>
                                                </ul>
                                            </div>
                                            <div class="card-footer">
                                                <a href="/admin/user/${user.id}" class="btn btn-success">Xem</a>
                                                <a href="/admin/user/update/${user.id}"
                                                    class="btn btn-warning  mx-2">Sửa</a>
                                                <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Xóa</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
        </body>

        </html>
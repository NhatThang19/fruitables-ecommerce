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
                <title>Dashboard</title>
                <script src="https://code.jquery.com/jquery-3.7.1.slim.js"
                    integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
                <link rel="icon" type="image/x-icon" href="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png">
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/admin/css/styles.css" rel="stylesheet" />
                <link rel="stylesheet" href="/admin/css/main.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
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
                                    <li class="breadcrumb-item active">Thêm</li>

                                </ol>
                                <div class="col col-md-10 mx-auto">
                                    <h3 class="mb-3">Tạo một người dùng</h3>
                                    <hr>
                                    <form:form enctype="multipart/form-data" modelAttribute="currentUser" method="post"
                                        action="/admin/user/update">
                                        <div class="row mb-3">
                                            <div class="mb-3" style="display: none;">
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="email" class="form-label">Email</label>
                                                <form:input type="email" class="form-control" id="email"
                                                    autocomplete="off" path="email" disabled="true" />
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="password" class="form-label">Mật khẩu</label>
                                                <form:input type="password" class="form-control" id="password"
                                                    path="password" disabled="true" />
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-12 col-md-6">
                                                <label for="surname" class="form-label">Họ và tên đệm</label>
                                                <form:input type="text" class="form-control" id="surname"
                                                    autocomplete="off" path="surname" />
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="name" class="form-label">Tên</label>
                                                <form:input type="text" class="form-control" id="name"
                                                    autocomplete="off" path="name" />
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-12 col-md-6">
                                                <label for="phone" class="form-label">Số điện thoại</label>
                                                <form:input type="number" class="form-control" id="phone"
                                                    autocomplete="off" path="phone" />
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="address" class="form-label">Địa chỉ</label>
                                                <form:input type="text" class="form-control" id="address"
                                                    autocomplete="off" path="address" />
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-12 col-md-6">
                                                <label for="role" class="form-label">Vai trò</label>
                                                <form:select class="form-select" id="role" path="role.name">
                                                    <form:option value="admin">ADMIN</form:option>
                                                    <form:option value="user">USER</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="gender" class="form-label">Giới tính</label>
                                                <form:select class="form-select" id="gender" path="gender">
                                                    <form:option value="male">Nam</form:option>
                                                    <form:option value="female">Nữ</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-12 col-md-6">
                                                <label for="status" class="form-label">Trạng thái</label>
                                                <form:select class="form-select" id="status" path="status">
                                                    <form:option value="active">Hoạt động</form:option>
                                                    <form:option value="inactive">Không hoạt động</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Ảnh đại diện</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="avatarFile" />
                                            </div>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <img class="mx-auto" style="max-height: 250px; display: none;"
                                                alt="avatar preview" id="avatarPreview"
                                                data-src="${currentUser.image.src}" />
                                        </div>
                                        <div class="col-12 mb-5">
                                            <button type="submit" class="btn btn-primary">Create</button>
                                        </div>
                                    </form:form>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
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
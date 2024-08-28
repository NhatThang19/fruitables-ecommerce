<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Nguồn gốc - Fruitables</title>
            <%@include file="../layout/head.jsp" %>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/loading.jsp" />
            <div id="content">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h2 class="mt-4">Quản lý xuất xứ</h2>
                                <ol class="breadcrumb mb-5">
                                    <li class="breadcrumb-item">
                                        <a href="/admin">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        Xuất xứ
                                    </li>
                                </ol>
                                <div class="row">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h3 class="align-middle">Xuất xứ</h3>
                                        <a href="/admin/origin/create" class="btn btn-primary">Tạo xuất xứ <i
                                                class="bi bi-file-earmark-plus "></i></a>
                                    </div>
                                    <hr>
                                    <div class="table-user">
                                        <table class="table table-hover table-bordered">
                                            <thead class="table-info">
                                                <tr>
                                                    <th class="text-center" scope="col">#</th>
                                                    <th class="text-center" scope="col">Ảnh đại diện</th>
                                                    <th class="text-center" scope="col">Tên xuất xứ</th>
                                                    <th class="text-center" scope="col">Mô tả</th>
                                                    <th class="text-center" scope="col">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="origin" items="${origins}">
                                                    <tr>
                                                        <th class="align-middle text-center">${origin.id}</th>
                                                        <th class="text-center">
                                                            <a href="${origin.image.src}" data-toggle="lightbox"
                                                                data-gallery="image gallery">
                                                                <img class="img-fluid" src="${origin.image.src}"
                                                                    alt="Ảnh người dùng" width="80px" height="80px">
                                                            </a>
                                                        </th>
                                                        <td class="align-middle text-center">${origin.name}
                                                        </td>
                                                        <td class="align-middle text-center">${origin.description}</td>
                                                        <td class="align-middle text-center" class="align-middle">
                                                            <a href="/admin/origin/update/${origin.id}"
                                                                class="btn btn-warning  mx-2">Sửa</a>
                                                            <a href="/admin/origin/delete/${origin.id}"
                                                                class="btn btn-danger">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:forEach var="origin" items="${origins}">
                                        <div class="card-user mb-3">
                                            <div class="card">
                                                <div class="card-header">
                                                    ${origin.name}
                                                </div>
                                                <div class="card-body">
                                                    <ul class=" list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${origin.id}</li>
                                                        <li class="list-group-item">Mô tả: ${origin.description}</li>
                                                    </ul>
                                                </div>
                                                <div class="card-footer">
                                                    <a href="/admin/origin/update/${origin.id}"
                                                        class="btn btn-warning  mx-2">Sửa</a>
                                                    <a href="/admin/origin/delete/${origin.id}"
                                                        class="btn btn-danger">Xóa</a>
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
                <%@include file="../layout/js.jsp" %>
            </div>
        </body>

        </html>
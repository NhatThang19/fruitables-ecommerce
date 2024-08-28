<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Thể loại - Fruitables</title>
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
                                <h2 class="mt-4">Quản lý thể loại</h2>
                                <ol class="breadcrumb mb-5">
                                    <li class="breadcrumb-item">
                                        <a href="/admin">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        Thể loại
                                    </li>
                                </ol>
                                <div class="row">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h3 class="align-middle">Thể loại</h3>
                                        <a href="/admin/category/create" class="btn btn-primary">Tạo thể loại <i
                                                class="bi bi-file-earmark-plus "></i></a>
                                    </div>
                                    <hr>
                                    <div class="table-user">
                                        <table class="table table-hover table-bordered">
                                            <thead class="table-info">
                                                <tr>
                                                    <th class="text-center" scope="col">#</th>
                                                    <th class="text-center" scope="col">Ảnh đại diện</th>
                                                    <th class="text-center" scope="col">Tên thể loại</th>
                                                    <th class="text-center" scope="col">Mô tả</th>
                                                    <th class="text-center" scope="col">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="category" items="${categories}">
                                                    <tr>
                                                        <th class="align-middle text-center">${category.id}</th>
                                                        <th class="text-center">
                                                            <a href="${category.image.src}" data-toggle="lightbox"
                                                                data-gallery="image gallery">
                                                                <img class="img-fluid" src="${category.image.src}"
                                                                    alt="Ảnh người dùng" width="80px" height="80px">
                                                            </a>
                                                        </th>
                                                        <td class="align-middle text-center">${category.name}
                                                        </td>
                                                        <td class="align-middle text-center">${category.description}
                                                        </td>
                                                        <td class="align-middle text-center" class="align-middle">
                                                            <a href="/admin/category/update/${category.id}"
                                                                class="btn btn-warning  mx-2">Sửa</a>
                                                            <a href="/admin/category/delete/${category.id}"
                                                                class="btn btn-danger">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:forEach var="category" items="${categories}">
                                        <div class="card-user mb-3">
                                            <div class="card">
                                                <div class="card-header">
                                                    ${category.name}
                                                </div>
                                                <div class="card-body">
                                                    <ul class=" list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${category.id}</li>
                                                        <li class="list-group-item">Thể loại: ${category.name}
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="card-footer">
                                                    <a href="/admin/category/update/${category.id}"
                                                        class="btn btn-warning  mx-2">Sửa</a>
                                                    <a href="/admin/category/delete/${category.id}"
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
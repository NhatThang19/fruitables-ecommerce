<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Sản phẩm - Fruitables</title>
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
                                <h2 class="mt-4">Quản lý sản phẩm</h2>
                                <ol class="breadcrumb mb-5">
                                    <li class="breadcrumb-item">
                                        <a href="/admin">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        Sản phẩm
                                    </li>
                                </ol>
                                <div class="row">
                                    <div class="d-flex justify-content-between mb-3">
                                        <h3 class="align-middle">Sản phẩm</h3>
                                        <a href="/admin/product/create" class="btn btn-primary">Tạo
                                            Sản
                                            phẩm <i class="bi bi-file-earmark-plus "></i></a>
                                    </div>
                                    <hr>
                                    <div class="table-user">
                                        <table class="table table-hover table-bordered">
                                            <thead class="table-info">
                                                <tr>
                                                    <th class="text-center" scope="col">#</th>
                                                    <th class="text-center" scope="col">Ảnh sản phẩm</th>
                                                    <th class="text-center" scope="col">Tên sản phẩm</th>
                                                    <th class="text-center" scope="col">Giá</th>
                                                    <th class="text-center" scope="col">Nhãn</th>
                                                    <th class="text-center" scope="col">Trạng thái</th>
                                                    <th class="text-center" scope="col">Lần cuối chỉnh sửa</th>
                                                    <th class="text-center" scope="col">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${products}">
                                                    <tr>
                                                        <th class="align-middle text-center">${product.id}</th>
                                                        <th class="text-center">
                                                            <a href="${product.image.src}" data-toggle="lightbox"
                                                                data-gallery="image gallery">
                                                                <img class="img-fluid" src="${product.image.src}"
                                                                    alt="Ảnh người dùng" width="80px" height="80px">
                                                            </a>
                                                        </th>
                                                        <td class="align-middle text-center">${product.name}
                                                        </td>
                                                        <td class="align-middle text-center">
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            VNĐ
                                                        </td>
                                                        <td class="align-middle text-center">${product.category.name}
                                                        </td>
                                                        <td class="align-middle text-center">${product.status}
                                                        </td>
                                                        <td class="align-middle text-center">${product.lastModifiedDate}
                                                        </td>
                                                        <td class="align-middle text-center" class="align-middle">
                                                            <a href="/admin/product/${product.id}"
                                                                class="btn btn-success">Xem</a>
                                                            <a href="/admin/product/update/${product.id}"
                                                                class="btn btn-warning  mx-2">Sửa</a>
                                                            <a href="/admin/product/delete/${product.id}"
                                                                class="btn btn-danger">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <c:forEach var="product" items="${products}">
                                        <div class="card-user mb-3">
                                            <div class="card">
                                                <div class="card-header">
                                                    ${product.name}
                                                </div>
                                                <div class="card-body">
                                                    <ul class=" list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${product.id}</li>
                                                        <li class="list-group-item">Sản phẩm: ${product.name}</li>
                                                        <li class="list-group-item">Giá:
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            VNĐ
                                                        </li>
                                                        <li class="list-group-item">Trạng thái: ${product.status}</li>
                                                    </ul>
                                                </div>
                                                <div class="card-footer">
                                                    <a href="/admin/product/${product.id}"
                                                        class="btn btn-success">Xem</a>
                                                    <a href="/admin/product/update/${product.id}"
                                                        class="btn btn-warning  mx-2">Sửa</a>
                                                    <a href="/admin/product/delete/${product.id}"
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
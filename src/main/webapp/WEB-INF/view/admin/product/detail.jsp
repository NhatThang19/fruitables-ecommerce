<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Xem sản phẩm - Fruitables</title>
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
                                    <h2 class="mt-4">Quản lý sản phẩm</h2>
                                    <ol class="breadcrumb mb-5">
                                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                                        <li class="breadcrumb-item active">Chi tiết</li>
                                    </ol>
                                    <div class="row">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h3 class="align-middle">Chi tiết sản phẩm với ID: ${product.id}</h3>
                                        </div>
                                        <hr>
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <button class="nav-link active" id="nav-product-tab"
                                                    data-bs-toggle="tab" data-bs-target="#nav-product" type="button"
                                                    role="tab" aria-controls="nav-product" aria-selected="true">Thông
                                                    tin</button>
                                                <button class="nav-link" id="nav-imgs-tab" data-bs-toggle="tab"
                                                    data-bs-target="#nav-imgs" type="button" role="tab"
                                                    aria-controls="nav-imgs" aria-selected="true">Hình ảnh
                                                </button>
                                                <button class="nav-link" id="nav-desc-tab" data-bs-toggle="tab"
                                                    data-bs-target="#nav-desc" type="button" role="tab"
                                                    aria-controls="nav-desc" aria-selected="false">Mô tả</button>
                                            </div>
                                        </nav>
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="nav-product" role="tabpanel"
                                                aria-labelledby="nav-product-tab" tabindex="0">
                                                <div class="card mx-auto card-detail p-3 mt-4"
                                                    style="max-width: 768px; height: auto;">
                                                    <div class="row g-0">
                                                        <div
                                                            class="col-md-4 d-flex align-items-center justify-content-center">
                                                            <a href="${product.image.src}" data-toggle="lightbox"
                                                                data-gallery="image gallery">
                                                                <img src="${product.image.src}" class="card-img-top"
                                                                    alt="user image">
                                                            </a>
                                                        </div>
                                                        <div class="card-body col-md-8">
                                                            <h5 class="card-title text-center">${product.name}
                                                            </h5>
                                                            <ul class="list-group list-group-flush">
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Giá:</span>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                    VNĐ
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Đã bán:</span>
                                                                    ${product.sold}
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Loại:</span>
                                                                    ${product.category.name}
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Nguồn gốc:</span>
                                                                    ${product.origin.name}
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Trạng thái:</span>
                                                                    ${product.status}
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Đơn vị:</span>
                                                                    ${product.unit.name}
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Ngày tạo:</span>
                                                                    ${product.createdDate}
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span class="fw-bold">Lần cuối sửa:</span>
                                                                    ${product.lastModifiedDate}
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade show" id="nav-imgs" role="tabpanel"
                                                aria-labelledby="nav-imgs-tab" tabindex="0">
                                                <div class="p-3 mt-4 mx-auto d-flex gap-4">
                                                    <c:forEach var="productImg" items="${productImgs}">
                                                        <a href="${productImg.image.src}" data-toggle="lightbox"
                                                            data-gallery="image gallery">
                                                            <img src="${productImg.image.src}"
                                                                class="card-img-top rounded " alt="user image"
                                                                style="max-height: 250px;">
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class=" tab-pane fade show" id="nav-desc" role="tabpanel"
                                                aria-labelledby="nav-desc-tab" tabindex="0">
                                                <div class="p-3 mt-4 mx-auto">
                                                    <h5>Mô tả ngắn:</h5>
                                                    <input class="form-control" type="text" disabled
                                                        value="${product.shortDesc}">
                                                </div>
                                                <h5 class="mt-3">Mô tả chi tiết:</h5>
                                                <div class="border p-5 rounded">
                                                    ${product.detailDesc}
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
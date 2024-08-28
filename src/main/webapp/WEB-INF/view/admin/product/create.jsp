<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Tạo sản phẩm - Fruitables</title>
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
                                        <li class="breadcrumb-item active">Thêm</li>

                                    </ol>
                                    <div class="col col-md-10 mx-auto">
                                        <h3 class="mb-3">Tạo một sản phẩm</h3>
                                        <hr>
                                        <form:form enctype="multipart/form-data" modelAttribute="newProduct"
                                            method="post" action="/admin/product/create">
                                            <div class="row mb-3">
                                                <div class="col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="name" class="form-label">Tên sản phẩm:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName? 'is-invalid':''}"
                                                        id="name" autocomplete="off" path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                    <c:set var="errorPrice">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="price" class="form-label">Giá:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorPrice? 'is-invalid':''}"
                                                        id="price" path="price" />
                                                    ${errorPrice}
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <label for="shortDesc" class="form-label">Mô tả ngắn:</label>
                                                    <form:textarea class="form-control" id="shortDesc" path="shortDesc"
                                                        rows="3" />
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <label for="detailDesc" class="form-label">Mô tả chi tiết:</label>
                                                    <form:textarea class="form-control" id="detailDesc"
                                                        autocomplete="off" path="detailDesc" rows="20"
                                                        name="detailDesc" />
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-12 col-md-6">
                                                    <c:set var="errorCategory">
                                                        <form:errors path="category" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="category" class="form-label">Loại:</label>
                                                    <form:select
                                                        class="form-select ${not empty errorCategory? 'is-invalid':''}"
                                                        id="category" path="category.name">
                                                        <option value="" disabled selected>Chọn loại:</option>
                                                        <c:forEach var="category" items="${categoryList}">
                                                            <form:option value="${category.name}">${category.name}
                                                            </form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                    ${errorCategory}
                                                </div>
                                                <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                    <c:set var="errorOrigin">
                                                        <form:errors path="origin" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="origin" class="form-label">Nguồn gốc:</label>
                                                    <form:select
                                                        class="form-select ${not empty errorOrigin? 'is-invalid':''}"
                                                        id="origin" path="origin.name">
                                                        <option value="" disabled selected>Chọn nguồn gốc:</option>
                                                        <c:forEach var="origin" items="${originList}">
                                                            <form:option value="${origin.name}">${origin.name}
                                                            </form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                    ${errorOrigin}
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-12 col-md-6">
                                                    <c:set var="errorStatus">
                                                        <form:errors path="status" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="status" class="form-label">Trạng thái:</label>
                                                    <form:select
                                                        class="form-select ${not empty errorStatus? 'is-invalid':''}"
                                                        id="status" path="status">
                                                        <option value="" disabled selected>Chọn trạng thái</option>
                                                        <form:option value="sold_out">Hết hàng</form:option>
                                                        <form:option value="stoking">Còn hàng</form:option>
                                                        <form:option value="stop_selling">Ngừng bán</form:option>
                                                    </form:select>
                                                    ${errorStatus}
                                                </div>
                                                <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                    <c:set var="errorUnit">
                                                        <form:errors path="unit" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="unit" class="form-label">Đơn vị:</label>
                                                    <form:select
                                                        class="form-select ${not empty errorOrigin? 'is-invalid':''}"
                                                        id="status" path="unit.name">
                                                        <option value="" disabled selected>Chọn trạng thái</option>
                                                        <c:forEach var="unit" items="${unitList}">
                                                            <form:option value="${unit.name}">${unit.name}
                                                            </form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                    ${errorUnit}
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <label for="avatarFile" class="form-label">Ảnh đại diện:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="avatarFile" />
                                                </div>
                                            </div>
                                            <div class="col-12 mb-3">
                                                <div id="avatarPreviewContainer">
                                                    <img class="mx-auto" style="max-height: 250px; display: none;"
                                                        alt="avatar preview" id="avatarPreview" />
                                                </div>
                                            </div>
                                            <div class="row mb-3 border rounded p-3">
                                                <div class="col-12">
                                                    <div class="file-upload-wrapper d-flex justify-content-center">
                                                        <label for="productImgs" class="custom-file-upload">
                                                            Chọn ảnh
                                                        </label>
                                                        <input type="file" accept=".png, .jpg, .jpeg" multiple=""
                                                            class="upload__inputfile" name="images" id="productImgs">

                                                    </div>
                                                    <div id="productPreviewContainer" src="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 mb-5">
                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                                <%@include file="../layout/js.jsp" %>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                </div>

            </body>

            </html>
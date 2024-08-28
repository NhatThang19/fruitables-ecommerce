<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Tạo thể loại - Fruitables</title>
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
                                    <h2 class="mt-4">Quản lý thể loại</h2>
                                    <ol class="breadcrumb mb-5">
                                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/category">Thể loại</a></li>
                                        <li class="breadcrumb-item active">Thêm</li>
                                    </ol>
                                    <div class="col col-md-10 mx-auto">
                                        <h3 class="mb-3">Tạo một thể loại</h3>
                                        <hr>
                                        <form:form enctype="multipart/form-data" modelAttribute="newCategory"
                                            method="post" action="/admin/category/create">
                                            <div class="row mb-3">
                                                <div class="col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="name" class="form-label">Tên thể loại:</label>
                                                    <form:input type="text-center"
                                                        class="form-control ${not empty errorName? 'is-invalid':''}"
                                                        id="name" autocomplete="off" path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                    <label for="description" class="form-label">Mô tả:</label>
                                                    <form:input type="text" class="form-control" id="description"
                                                        path="description" />
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
                                                <img class="mx-auto" style="max-height: 250px; display: none;"
                                                    alt="avatar preview" id="avatarPreview" />
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
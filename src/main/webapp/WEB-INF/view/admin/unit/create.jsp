<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Tạo đơn vị - Fruitables</title>
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
                                    <h2 class="mt-4">Quản lý đơn vị</h2>
                                    <ol class="breadcrumb mb-5">
                                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/unit">đơn vị</a></li>
                                        <li class="breadcrumb-item active">Thêm</li>

                                    </ol>
                                    <div class="col col-md-10 mx-auto">
                                        <h3 class="mb-3">Tạo một đơn vị</h3>
                                        <hr>
                                        <form:form enctype="multipart/form-data" modelAttribute="newUnit" method="post"
                                            action="/admin/unit/create">
                                            <div class="row mb-3">
                                                <div class="col-12 col-md-6">
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label for="name" class="form-label">Tên đơn vị:</label>
                                                    <form:input type="text-center"
                                                        class="form-control ${not empty errorName? 'is-invalid':''}"
                                                        id="name" autocomplete="off" path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="col-12 col-md-6 mb-3 mt-md-0 mt-3">
                                                    <label for="desc" class="form-label">Mô tả:</label>
                                                    <form:input type="text-center" class="form-control" id="desc"
                                                        autocomplete="off" path="description" />
                                                </div>
                                                <div class="col-12 mt-3">
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
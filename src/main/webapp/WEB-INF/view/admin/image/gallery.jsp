<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>Gallery - Fruitables</title>
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
                                <h2 class="mt-4">Bộ sưu tập</h2>
                                <ol class="breadcrumb mb-5">
                                    <li class="breadcrumb-item">
                                        <a href="/admin">Trang chủ</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        Bộ sưu tập
                                    </li>
                                </ol>
                                <div class="row row-cols-2 row-cols-md-6">
                                    <c:forEach var="img" items="${images}">
                                        <div class="col mb-3">
                                            <a href="${img.src}" data-toggle="lightbox" data-gallery="image gallery">
                                                <div class="square-container">
                                                    <img src="${img.src}" class="img-fluid">
                                                </div>
                                            </a>
                                            <a href="/admin/gallery/delete/${img.id}"
                                                class="btn btn-danger mt-2 d-flex justify-content-center">Xóa
                                                ảnh</a>
                                        </div>
                                    </c:forEach>
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
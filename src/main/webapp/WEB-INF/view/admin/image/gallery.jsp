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
            <title>Gallery - Fruitables</title>
            <link rel="icon" type="image/x-icon" href="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png">
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="/admin/css/main.css">
            <link href="/admin/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.slim.js"
                integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bs5-lightbox@1.8.3/dist/index.bundle.min.js"></script>
            <script src="/admin/js/jquery.js"></script>
            <script src="/admin/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
        </body>

        </html>
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
                <title>Delete image - Fruitables</title>
                <script src="https://code.jquery.com/jquery-3.7.1.slim.js"
                    integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
                <link rel="icon" type="image/x-icon" href="/admin/images/a12f6df44709e908b9e03e68e7bff6c6-removebg.png">
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/admin/css/styles.css" rel="stylesheet" />
                <link rel="stylesheet" href="/admin/css/main.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/loading.jsp" />
                <div id="content">
                    <div class="card mt-5 mx-auto" style="max-width: 80%;">
                        <div class="card-header">
                            Xác nhận
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Bạn chắc chắn muốn xóa ảnh ${image.name} chứ?</h5>
                            <p class="card-text">Hành động này không thể hoàn tác được.</p>
                        </div>
                        <div class="card-footer d-flex">
                            <a href="/admin/gallery" class="btn btn-secondary me-3">Hủy</a>
                            <form:form method="post" enctype="multipart/form-data" action="/admin/gallery/delete"
                                modelAttribute="image">
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">Id:</label>
                                    <form:input value="${image.id}" type="text" class="form-control" path="id" />
                                </div>
                                <div class="col-12 col-md-6 d-none">
                                    <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg"
                                        name="avatarFile" />
                                </div>
                                <button class="btn btn-danger">Xóa</button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/scripts.js"></script>
                <script src="/admin/js/jquery.js"></script>
            </body>

            </html>
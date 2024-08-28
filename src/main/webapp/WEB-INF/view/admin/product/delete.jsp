<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Xóa sản phẩm - Fruitables</title>
                <%@include file="../layout/head.jsp" %>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/loading.jsp" />
                <div id="content">
                    <div class="card mt-5 mx-auto" style="max-width: 80%;">
                        <div class="card-header">
                            Xác nhận
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Bạn chắc chắn muốn xóa người dùng "${product.name}" chứ?
                            </h5>
                            <p class="card-text">Hành động này không thể hoàn tác được.</p>
                        </div>
                        <div class="card-footer d-flex">
                            <a href="/admin/user" class="btn btn-secondary me-3">Hủy</a>
                            <form:form method="post" action="/admin/product/delete" modelAttribute="product">
                                <div class="mb-3" style="display: none;">
                                    <label class="form-label">Id:</label>
                                    <form:input value="${product.id}" type="text" class="form-control" path="id" />
                                </div>
                                <button class="btn btn-danger">Xóa</button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <%@include file="../layout/js.jsp" %>
            </body>

            </html>
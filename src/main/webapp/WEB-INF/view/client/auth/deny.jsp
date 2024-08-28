<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Không có quyền</title>
        <%@include file="../layout/head.jsp" %>
    </head>

    <body>
        <h1 class="text-center mt-5">Bạn không có quyền truy cập tài nguyên này!!!</h1>
        <div class="d-flex justify-content-center">
            <img class="mt-5 img-fluid" src="/client/images/deny.gif">
        </div>
        <div class="d-flex justify-content-center">
            <a class="btn btn-success mt-5 mb-3 text-center" href="/">Trang chủ</a>
        </div>
    </body>

    </html>
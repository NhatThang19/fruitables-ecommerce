<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xin lỗi</title>
        <%@include file="../layout/head.jsp" %>

    </head>

    <body>
        <h1 class="text-center mt-5">Xin lỗi bạn chức năng này đang được xây dựng <br>.·´¯`(>▂<)´¯`·. </h1>
                <div class="d-flex justify-content-center">
                    <img class="mt-5 img-fluid" src="/client/images/sorry.gif">
                </div>
                <div class="d-flex justify-content-center">
                    <form method="post" action="/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <a href="/admin" class="btn btn-success me-3">Admin</a>
                            <button class="btn btn-info my-3 text-white">Đăng xuất</button>
                        </c:if>
                        <c:if test="${empty pageContext.request.userPrincipal}">
                            <a href="/login" class="btn btn-info my-3">
                                Đăng nhập
                            </a>
                        </c:if>
                    </form>
                </div>
    </body>

    </html>
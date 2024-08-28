<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login</title>
                <%@include file="../layout/head.jsp" %>
                    <style>
                        body {
                            background-image: url('/client/images/hinh_nen.jpg');
                            background-color: #f1f1f1;
                            background-repeat: no-repeat;
                            background-size: cover;
                            background-position: center;
                            height: 100vh;
                            width: 100vw;
                        }

                        .btn-login {
                            font-size: 0.9rem;
                            letter-spacing: 0.05rem;
                            padding: 0.75rem 1rem;
                        }
                    </style>
            </head>

            <body>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                            <div class="card border-0 shadow rounded-3 my-5" style="
                            background-color: rgba(255, 255, 255, 0.7);
                        ">
                                <div class="card-body p-4 p-sm-5">
                                    <h5 class="card-title text-center mb-5 fs-4 text-white">Đăng nhập</h5>
                                    <form method="post" action="/login">
                                        <c:if test="${param.error != null}">
                                            <div class="my-2" style="color: red;">Sai email hoặc mật khẩu!!!.</div>
                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="my-2" style="color: green;">Đăng xuất thành công!!!.
                                            </div>
                                        </c:if>
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="floatingInput"
                                                placeholder="name@example.com" name="username" autocomplete="off">
                                            <label for="floatingInput">Email</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="floatingPassword"
                                                placeholder="Password" name="password">
                                            <label for="floatingPassword">Mật khẩu</label>
                                        </div>
                                        <div><input type="hidden" name="${_csrf.parameterName}"
                                                value="${_csrf.token}" /></div>
                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-login text-uppercase fw-bold"
                                                type="submit" style="
                                                background-color: rgba(255, 255, 255, 0.4);
                                                border: none;
                                            ">Đăng nhập</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>
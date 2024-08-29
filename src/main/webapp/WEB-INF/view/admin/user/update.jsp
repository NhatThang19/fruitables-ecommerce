<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>>
                <title>Cập nhật người dùng - Fruitables</title>
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
                                    <h2 class="mt-4">Quản lý người dùng</h2>
                                    <ol class="breadcrumb mb-5">
                                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/user">Người dùng</a></li>
                                        <li class="breadcrumb-item active">Sửa</li>
                                    </ol>
                                    <div class="col col-md-10 mx-auto">
                                        <h3 class="mb-3">Tạo một người dùng</h3>
                                        <hr>
                                        <form:form enctype="multipart/form-data" modelAttribute="currentUser"
                                            method="post" action="/admin/user/update">
                                            <div class="row mb-3">
                                                <div class="mb-3" style="display: none;">
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3" style="display: none;">
                                                    <form:input type="email" class="form-control" path="email" />
                                                </div>
                                                <div class="mb-3" style="display: none;">
                                                    <form:input type="password" class="form-control" path="password" />
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-12 col-md-6">
                                                        <c:set var="errorSurname">
                                                            <form:errors path="surname" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="surname" class="form-label">Họ và tên đệm: </label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorSurname? 'is-invalid':''}"
                                                            id="surname" autocomplete="off" path="surname" />
                                                        ${errorSurname}
                                                    </div>
                                                    <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                        <label for="name" class="form-label">Tên</label>
                                                        <form:input type="text" class="form-control" id="name"
                                                            autocomplete="off" path="name" />
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-12 col-md-6">
                                                        <c:set var="errorPhone">
                                                            <form:errors path="phone" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="phone" class="form-label">Số điện thoại: </label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errorPhone? 'is-invalid':''}"
                                                            id="phone" autocomplete="off" path="phone" />
                                                        ${errorPhone}
                                                    </div>
                                                    <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                        <c:set var="errorAddress">
                                                            <form:errors path="address" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="address" class="form-label">Địa chỉ: </label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorAddress? 'is-invalid':''}"
                                                            id="address" autocomplete="off" path="address" />
                                                        ${errorAddress}
                                                    </div>
                                                </div>
                                                <div class="row mb-3">
                                                    <div class="col-12 col-md-6">
                                                        <c:set var="errorRole">
                                                            <form:errors path="role" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="role" class="form-label">Vai trò: </label>
                                                        <form:select
                                                            class="form-select ${not empty errorRole? 'is-invalid':''}"
                                                            id="role" path="role.name">
                                                            <option value="" disabled selected>Chọn vai trò: </option>
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>
                                                        ${errorRole}
                                                    </div>
                                                    <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                        <c:set var="errorGender">
                                                            <form:errors path="gender" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label for="gender" class="form-label">Giới tính: </label>
                                                        <form:select
                                                            class="form-select ${not empty errorGender? 'is-invalid':''}"
                                                            id="gender" path="gender">
                                                            <option value="" disabled selected>Chọn giới tính: </option>
                                                            <form:option value="male">Nam</form:option>
                                                            <form:option value="female">Nữ</form:option>
                                                        </form:select>
                                                        ${errorGender}
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
                                                            <form:option value="active">Hoạt động</form:option>
                                                            <form:option value="inactive">Không hoạt động</form:option>
                                                        </form:select>
                                                        ${errorStatus}
                                                    </div>
                                                    <div class="col-12 col-md-6 mt-md-0 mt-3">
                                                        <label for="avatarFile" class="form-label">Ảnh đại diện:</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            accept=".png, .jpg, .jpeg" name="avatarFile" />
                                                    </div>
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img class="mx-auto" style="max-height: 250px; display: none;"
                                                        alt="avatar preview" id="avatarPreview"
                                                        data-src="${currentUser.image.src}" />
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </div>
                                        </form:form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ - Servlet CRUD</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body style="background: #fdfdfd; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
<jsp:include page="/common/topbar.jsp"></jsp:include>
<div class="container" style="margin-top: 50px;">
    <div class="jumbotron" style="background: #f1f8fc; border-radius: 8px; border: 1px solid #d8e8f5;">
        <h2>BÀI TẬP LẬP TRÌNH WEB 01</h2>
        <c:if test="${sessionScope.account != null}">
            <div class="alert alert-success">
                Đang đăng nhập dưới tài khoản: <strong>${sessionScope.account.userName}</strong> (${sessionScope.account.fullName}) - Role ID: <strong>${sessionScope.account.roleid}</strong>
            </div>
            <c:if test="${sessionScope.account.roleid == 1}">
                <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-warning">
                    <i class="fa fa-cogs"></i> Đi đến Quản lý danh mục (Category)
                </a>
            </c:if>
        </c:if>
        <c:if test="${sessionScope.account == null}">
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Đăng nhập ngay</a>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-default">Đăng ký tài khoản</a>
        </c:if>
    </div>
</div>
</body>
</html>

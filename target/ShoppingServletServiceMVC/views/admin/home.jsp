<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Trị Hệ Thống (Admin)</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body style="background: #fdfdfd; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
<jsp:include page="/common/topbar.jsp"></jsp:include>
<div class="container" style="margin-top: 50px;">
    <div class="panel panel-danger">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shield"></i> Trang Quản Trị Hệ Thống (Admin Dashboard)</h3>
        </div>
        <div class="panel-body">
            <p>Chào mừng Admin <strong>${sessionScope.account.fullName}</strong> đến với trang quản trị.</p>
            <div class="alert alert-info">
                Bạn đang truy cập tài nguyên dành cho Role ID = 1 (Administrator).
            </div>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-default">Về trang chủ</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Đăng xuất</a>
        </div>
    </div>
</div>
</body>
</html>
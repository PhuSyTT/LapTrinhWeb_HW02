<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập Vào Hệ Thống</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .login-box { max-width: 440px; margin: 60px auto; padding: 30px; background: #fff; border: 1px solid #e0e0e0; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.08); }
        .login-box h2 { text-align: center; margin-bottom: 25px; color: #333; font-weight: 600; }
        .alert-danger { padding: 10px 15px; margin-bottom: 20px; font-size: 14px; border-radius: 4px; }
        .input-group { margin-bottom: 18px; }
        .btn-primary { background-color: #007bff; border-color: #007bff; font-size: 16px; padding: 10px; border-radius: 4px; }
        .btn-primary:hover { background-color: #0056b3; }
    </style>
</head>
<body>
<jsp:include page="/common/topbar.jsp"></jsp:include>
<div class="login-box">
    <form action="${pageContext.request.contextPath}/login" method="post">
        <h2>Đăng Nhập Vào Hệ Thống</h2>

        <c:if test="${not empty alert}">
            <h3 class="alert alert-danger">${alert}</h3>
        </c:if>

        <section>
            <label class="input login-input" style="width: 100%;">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
                </div>
            </label>
        </section>

        <section>
            <label class="input login-input" style="width: 100%;">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" placeholder="Mật khẩu" name="password" class="form-control" required>
                </div>
            </label>
        </section>

        <div style="margin-bottom: 18px; display: flex; justify-content: space-between; align-items: center;">
            <label style="font-weight: normal; margin-bottom: 0;">
                <input type="checkbox" name="remember"> Nhớ tôi
            </label>
            <a href="#" class="pull-right">Quên mật khẩu?</a>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

        <p style="margin-top: 20px; text-align: center; color: #666;">
            Nếu bạn chưa có tài khoản trên hệ thống, thì hãy <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
        </p>
    </form>
</div>
</body>
</html>
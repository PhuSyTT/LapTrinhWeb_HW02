<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục mới</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body style="background: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
<jsp:include page="/common/topbar.jsp"></jsp:include>
<div class="container" style="max-width: 600px; margin-top: 40px; background: #fff; padding: 30px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <h3 style="margin-top: 0; border-bottom: 2px solid #00adb5; padding-bottom: 10px; color: #333;">Thêm danh mục mới</h3>
    
    <form role="form" action="${pageContext.request.contextPath}/admin/category/add" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label>Tên danh mục:</label>
            <input class="form-control" placeholder="please enter category Name" name="name" required />
        </div>
        <div class="form-group">
            <label>Ảnh đại diện</label>
            <input type="file" name="icon" class="form-control" accept="image/*" />
        </div>
        <div style="margin-top: 20px;">
            <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Thêm</button>
            <button type="reset" class="btn btn-primary">Hủy</button>
            <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-default pull-right">Quay lại danh sách</a>
        </div>
    </form>
</div>
</body>
</html>

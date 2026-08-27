<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa danh mục</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body style="background: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
<jsp:include page="/common/topbar.jsp"></jsp:include>
<div class="container" style="max-width: 600px; margin-top: 40px; background: #fff; padding: 30px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
    <h3 style="margin-top: 0; border-bottom: 2px solid #f0ad4e; padding-bottom: 10px; color: #333;">Chỉnh sửa danh mục</h3>
    
    <form role="form" action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${category.id}">
        
        <div class="form-group">
            <label>Tên danh sách:</label>
            <input type="text" class="form-control" value="${category.name}" name="name" required />
        </div>
        
        <div class="form-group">
            <label>Ảnh hiện tại:</label><br/>
            <c:choose>
                <c:when test="${not empty category.icon}">
                    <c:url value="/image?fname=${category.icon}" var="imgUrl"></c:url>
                    <img class="img-responsive" width="100px" style="border-radius: 4px; border: 1px solid #ddd; margin-bottom: 10px;" src="${imgUrl}" alt="${category.name}" />
                </c:when>
                <c:otherwise>
                    <p class="text-muted">Chưa có ảnh</p>
                </c:otherwise>
            </c:choose>
            <label>Ảnh đại diện mới (nếu muốn thay đổi):</label>
            <input type="file" name="icon" class="form-control" accept="image/*" />
        </div>
        
        <div style="margin-top: 20px;">
            <button type="submit" class="btn btn-warning"><i class="fa fa-pencil"></i> Edit</button>
            <button type="reset" class="btn btn-primary">Reset</button>
            <a href="${pageContext.request.contextPath}/admin/category/list" class="btn btn-default pull-right">Quay lại danh sách</a>
        </div>
    </form>
</div>
</body>
</html>

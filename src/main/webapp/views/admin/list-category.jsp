<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục - Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; }
        .main-wrapper { display: flex; min-height: calc(100vh - 55px); }
        .sidebar { width: 230px; background: #222d32; color: #fff; padding-top: 15px; }
        .sidebar .user-panel { padding: 15px; text-align: center; border-bottom: 1px solid #1a2226; }
        .sidebar .user-panel i { font-size: 50px; color: #00adb5; }
        .sidebar-menu { list-style: none; padding: 0; margin: 15px 0 0 0; }
        .sidebar-menu li a { color: #b8c7ce; display: block; padding: 12px 20px; text-decoration: none; border-left: 3px solid transparent; }
        .sidebar-menu li a:hover, .sidebar-menu li.active a { background: #1e282c; color: #fff; border-left-color: #3c8dbc; }
        .content-wrapper { flex: 1; padding: 25px; background: #fff; margin: 15px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .table img { object-fit: cover; border-radius: 4px; border: 1px solid #ddd; }
    </style>
</head>
<body>
<jsp:include page="/common/topbar.jsp"></jsp:include>
<div class="main-wrapper">
    <div class="sidebar">
        <div class="user-panel">
            <i class="fa fa-user-circle"></i>
            <p style="margin-top: 10px; font-weight: bold;">Bạn là Admin</p>
        </div>
        <ul class="sidebar-menu">
            <li class="active"><a href="${pageContext.request.contextPath}/admin/category/list"><i class="fa fa-folder-open"></i> Quản lý Danh mục</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/category/add"><i class="fa fa-plus-circle"></i> Thêm danh mục mới</a></li>
            <li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-home"></i> Về trang chủ</a></li>
        </ul>
    </div>
    
    <div class="content-wrapper">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; border-bottom: 2px solid #00adb5; padding-bottom: 10px;">
            <div>
                <h2 style="margin: 0; color: #333;">Quản lý danh mục</h2>
                <small style="color: #777;">Nơi bạn có thể quản lý danh mục của mình</small>
            </div>
            <a href="${pageContext.request.contextPath}/admin/category/add" class="btn btn-primary">
                <i class="fa fa-plus"></i> Thêm danh mục mới
            </a>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <strong>Danh sách danh mục</strong>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr style="background: #f9f9f9;">
                            <th style="width: 60px; text-align: center;">STT</th>
                            <th style="width: 160px; text-align: center;">Hình ảnh</th>
                            <th>Tên danh mục</th>
                            <th style="width: 140px; text-align: center;">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cateList}" var="cate" varStatus="STT">
                            <tr class="odd gradeX">
                                <td style="text-align: center; vertical-align: middle;">${STT.index + 1}</td>
                                <td style="text-align: center; vertical-align: middle;">
                                    <c:choose>
                                        <c:when test="${not empty cate.icon}">
                                            <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                                            <img height="90" width="120" src="${imgUrl}" alt="${cate.name}" />
                                        </c:when>
                                        <c:otherwise>
                                            <span class="label label-default">Không có ảnh</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="vertical-align: middle; font-weight: 600;">${cate.name}</td>
                                <td style="text-align: center; vertical-align: middle;">
                                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}" class="btn btn-xs btn-warning">
                                        <i class="fa fa-edit"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}" 
                                       class="btn btn-xs btn-danger" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?');">
                                        <i class="fa fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

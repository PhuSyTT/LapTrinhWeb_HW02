<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="topbar-container" style="background: #24292e; color: #fff; padding: 12px 30px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    <div style="display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto;">
        <div>
            <a href="${pageContext.request.contextPath}/home" style="color: #fff; text-decoration: none; font-weight: 600; font-size: 16px;">
                <i class="fa fa-shopping-bag" style="color: #00adb5;"></i> ShoppingServletServiceMVC
            </a>
        </div>
        <div>
            <c:choose>
                <c:when test="${sessionScope.account == null}">
                    <ul class="list-inline right-topbar" style="list-style: none; margin: 0; padding: 0; display: inline-flex; gap: 12px; align-items: center;">
                        <li><a href="${pageContext.request.contextPath}/login" style="color: #00adb5; text-decoration: none; font-weight: bold;">Đăng nhập</a></li>
                        <li style="color: #666;">|</li>
                        <li><a href="${pageContext.request.contextPath}/register" style="color: #eee; text-decoration: none;">Đăng ký</a></li>
                        <li><i class="search fa fa-search search-button" style="cursor: pointer; margin-left: 8px;"></i></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="list-inline right-topbar" style="list-style: none; margin: 0; padding: 0; display: inline-flex; gap: 12px; align-items: center;">
                        <li>Xin chào, <a href="${pageContext.request.contextPath}/home" style="color: #00adb5; text-decoration: none; font-weight: bold;">${sessionScope.account.fullName}</a></li>
                        <li style="color: #666;">|</li>
                        <li><a href="${pageContext.request.contextPath}/logout" style="color: #ff6b6b; text-decoration: none;">Đăng Xuất</a></li>
                        <li><i class="search fa fa-search search-button" style="cursor: pointer; margin-left: 8px;"></i></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
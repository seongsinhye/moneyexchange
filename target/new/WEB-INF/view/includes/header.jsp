<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
            <span class="fs-4">ME</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="#" class="nav-link" aria-current="page">환율조회</a></li>
            <li class="nav-item"><a href="#" class="nav-link">환율알림서비스</a></li>
            <li class="nav-item"><a href="#" class="nav-link">맞춤환전</a></li>
            <li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/login" class="nav-link">로그인</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/join" class="nav-link">회원가입</a></li>

        </ul>
    </header>
</div>

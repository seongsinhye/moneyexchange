<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><style>
    @font-face {
        font-family: 'OTWelcomeRA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    header {
        font-family: 'OTWelcomeRA';
        background-color: rgb(255, 219, 68);
        padding: 0px 100px;
    }
    .nav-link {
        color: black !important;
    }
    .border {
        border-radius: 10px;
        padding: 10px;
        margin: 10px 0px;
    }
</style>
<header class="d-flex flex-wrap justify-content-center py-3 mb-4 ">

    <a href="${pageContext.request.contextPath}/main"
       class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32">
            <use xlink:href="#bootstrap"></use>
        </svg>
        <span class="fs-4">ME</span>
    </a>

    <ul class="nav nav-pills">
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/total" class="nav-link" aria-current="page">전체환율조회</a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/type" class="nav-link" aria-current="page">통화별조회</a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/alarm" class="nav-link">환율알림서비스</a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/calculator" class="nav-link">환율계산기</a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/notice" class="nav-link">게시판</a>
        </li>
        <c:if test="${not empty loginSession}">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout" class="nav-link">로그아웃</a>
            </li>
        </c:if>
        <c:if test="${empty loginSession}">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/login" class="nav-link">로그인</a>
            </li>
        </c:if>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/join" class="nav-link">회원가입</a>
        </li>
    </ul>
</header>

<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trend-two.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="includes/header.jsp"%>
<div class="container">
    <h1>게시판</h1>
    <div id="wrapper">
        <div id="title_wrapper" class="title_txt line two_area">
            <input type="hidden" name="noticeIdx" value="${noticeInfo.noticeIdx}">
            <div style="padding: 25px;"> <span class="" name="noticeTitle"> ${noticeInfo.noticeTitle} </span></div>
            <div class="right">
                <span class=""> ${noticeInfo.noticeInsertDate}</span>
            </div>
        </div>
        <div id="contents_wrapper" class="line" style="padding: 25px 25px 18px 25px;">
            <p name="noticeContent"> ${noticeInfo.noticeContent} </p>
            <div style="max-width: 100%">
                <img style="width: 100%;" src="${pageContext.request.contextPath}/img/${noticeInfo.fileName}">

            </div>
        </div>
        <div id="file_wrapper" style="padding: 25px 25px 18px 25px; ">
            <a href="${pageContext.request.contextPath}/img/${noticeInfo.fileName}" download=""> 다운로드 하기 </a>
            <br>
            <c:if test="${empty noticeInfo.fileName}">
                <input type="file" name="uploadFile" style="display: none" >
            </c:if>
            <img style="width: 40px" src="${pageContext.request.contextPath}/img/${noticeInfo.fileName}">
        </div>

        <div id="btn_wrapper" class="line">
            <a href="${pageContext.request.contextPath}/notice"><button type="button" id="goToList" class="goToList_btn">목록으로</button> </a>
            <a href="${pageContext.request.contextPath}/notice/update/page?noticeIdx=${noticeInfo.noticeIdx}"><button type="button"  class="goToList_btn">수정하기</button> </a>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>

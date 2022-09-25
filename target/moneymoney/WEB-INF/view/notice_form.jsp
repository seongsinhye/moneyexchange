<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  Date nowTime = new Date();
  SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
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


<div class="container col-xxl-8 px-4 py-5">
  <h2>공지사항</h2>

  <c:if test="${empty param.noticeIdx}">
    <div id="wrapper" class=" ">
      <form:form action="${pageContext.request.contextPath}/notice/Add" method="get">

        <div id="title_wrapper">
          <input type="text" name="noticeTitle" class="title_txt title" id="form_detail_text" placeholder="제목을 입력하세요." style="padding: 20px;">
          <span class="updateday"> <%= sf.format(nowTime) %> </span>
        </div>

        <textarea name="noticeContent" id="contents_wrapper" style="padding: 30px; width: 100%; min-height: 500px;" class=" contents" placeholder="내용을 입력하세요"></textarea>

        <input type="hidden" name="noticeWriter" value="admin">
        <div id="file_wrapper">
          <img src="../img/img.png" alt=""><a href="#">첨부파일</a>
        </div>

        <div id="btn_wrapper">
          <button type="submit" id="goToSubmit" class="goToList_btn">등록하기</button>
        </div>
      </form:form>
    </div>
  </c:if>

  <c:if test="${not empty param.noticeIdx}">
    <div id="wrapper" class=" ">
      <form:form action="${pageContext.request.contextPath}/notice/update?noticeIdx=${noticeInfo.noticeIdx}" method="post">
        <input type="hidden" name="noticeIdx" value="${noticeInfo.noticeIdx}">
        <div id="title_wrapper">
          <input type="text" name="noticeTitle" class="title_txt title" id="form_detail_text" value="${noticeInfo.noticeTitle}" style="padding: 20px;">
          <span class="updateday"> <%= sf.format(nowTime) %> </span>
        </div>
        <textarea name="noticeContent" id="contents_wrapper" style="padding: 30px; width: 100%; min-height: 500px;" class=" contents"  >${noticeInfo.noticeContent}</textarea>
        <input type="hidden" name="noticeWriter" value="admin">
        <div id="file_wrapper">
          <img src="../img/img.png" alt=""><a href="#">첨부파일</a>
        </div>
        <div id="btn_wrapper">
          <button type="submit" id="goToSubmit" class="goToList_btn">수정하기</button>
          <a href="${pageContext.request.contextPath}/notice/delete?noticeIdx=${noticeInfo.noticeIdx}"> <button type="button" class="goToList_btn">삭제하기</button></a>
        </div>
      </form:form>
    </div>
  </c:if>
</div>
<%@include file="includes/footer.jsp"%>


<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>


</script>




</body>
</html>

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
      <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
      <li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>

    </ul>
  </header>
</div>

<div class="container">
  <h1>공지사항</h1>

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
    </div>

    <div id="file_wrapper" class="line">
      <img src="../img/img.png" alt=""><a href="#">첨부파일</a>
    </div>

    <div id="btn_wrapper" class="line">
      <a href="http://localhost:8080/moneyexchange/notice"><button type="button" id="goToList" class="goToList_btn">목록으로</button> </a>
      <a href="http://localhost:8080/moneyexchange/notice/update/page?noticeIdx=${noticeInfo.noticeIdx}"><button type="button"  class="goToList_btn">수정하기</button> </a>
    </div>

  </div>

</div>




<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Company, Inc</p>
  </footer>
</div>




</body>
</html>

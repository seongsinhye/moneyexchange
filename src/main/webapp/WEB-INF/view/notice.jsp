<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 10:49 PM
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
  <link rel="stylesheet" href="trend-two.css">

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
  <h1 style="text-align: center;
        margin: 50px 0px 40px 0px;">공지사항</h1>

  <a href="http://localhost:8080/moneyexchange/notice/form" >공지사항 작성하기</a>





  <c:forEach items="${noticeInfoList}" var="noticeInfo">


      <div class="list-group">

        <a href="http://localhost:8080/moneyexchange/notice/detail?noticeIdx=${noticeInfo.noticeIdx}" class="list-group-item list-group-item-action ">


            ${noticeInfo.noticeTitle}
        </a>

      </div>


  </c:forEach>




  <div style="padding-left: 43%;">
    <nav aria-label="Page navigation example" >
      <ul class="pagination" style="margin-top: 1rem;">

        <c:forEach begin="1" end="${Math.ceil(amount/10)}" var="number">
          <li class="page-item"><a class="page-link" href="http://localhost:8080/moneyexchange/notice?pageNumber=${number}">${number}</a></li>

        </c:forEach>


      </ul>
    </nav>
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

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
  <%@include file="includes/header.jsp"%>

<div class="container">
  <h1 style="text-align: center;
        margin: 50px 0px 40px 0px;">공지사항</h1>

  <a href="http://localhost:8080/moneyexchange/notice/form" >공지사항 작성하기</a>

  <c:if test="${empty noticeInfoList}">
  <div class="list-group">
    <a href="#" class="list-group-item list-group-item-action ">
        공지사항이 없습니다.
    </a>
  </div>

  </c:if>


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
<%@include file="includes/footer.jsp"%>


</body>
</html>

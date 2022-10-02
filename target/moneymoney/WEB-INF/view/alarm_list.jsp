<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<%@include file="includes/header.jsp" %>
<div class="container col-xxl-8 px-4 py-5">
    <form action="${pageContext.request.contextPath}/alarm/phone" method="POST">
        <div>
            <h3>알림신청내역</h3>
            <hr>
            <div class="border">
                신청 번호를 입력하고 조회하기를 누르면 신청내역을 알 수 있습니다.
            </div>
            <div>
                <label for="name">이름</label>
                <input type="text" name="user_name" id="name" placeholder="홍길동">
            </div>
            <div>
                <label for="tel">전화번호</label>
                <input type="text" name="tel" id="tel" placeholder="01012341234">
            </div>
            <br>
            <input type="submit" value="조회하기"
                   style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);">
        </div>
    </form>
    <hr>
    <c:forEach items="${alarmCommandList}" var="alarmCommand">
        <div class="border">
            <p>${alarmCommand.user_name}</p>

            <p>${alarmCommand.tel}</p>
            <p>${alarmCommand.type}</p>
            <p>${alarmCommand.ac}</p>
            <p>${alarmCommand.exchangeTime}</p>
            <a href="${pageContext.request.contextPath}/alarm/delete?idx=${alarmCommand.idx}">
                <button type="button">삭제하기</button>
            </a>
        </div>
    </c:forEach>
</div>

<%@include file="includes/footer.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/query-3.6.0.min.js"></script>
<script>
    $("#today-btn").on("click", function () {
        $(this).css('color', 'red');
    });
</script>

</body>
</html>

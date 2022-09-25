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
<form action="${pageContext.request.contextPath}/search/total" method="get">

        <div >
            <h3>전체환율조회</h3>
            <hr>
            <div class="border">
                조회일을 입력하고 조회하기를 누르면 현재시간 기준의 전체통화 환율 목록을 조회할 수 있습니다.
            </div>
            <div>
                <label for="day">조회일</label>
                <input type="text" name="day" id="day" placeholder="20220919">
                <input type="submit" value="조회하기" style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);">
            </div>

        </div>

</form>
</div>
<c:if test="${not empty exchangeInfoList}">
    <div class="table-responsive exchange-list container px-4 col-xxl-8" style="margin-top: 100px;">
        <h3> 환율 정보 </h3>
        <p>${day} </p>
        <table class="table table-striped table-sm " >
            <thead>
            <tr>
                <th scope="col">통화종류</th>
                <th scope="col">통화종류</th>
                <th scope="col">매매기준율</th>
                <th scope="col">현찰(살때)</th>
                <th scope="col">현찰(팔떄)</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="exchangeInfo" items="${exchangeInfoList}">
                <tr>
                    <td>${exchangeInfo.cur_unit}</td>
                    <td>${exchangeInfo.cur_nm}</td>
                    <td>${exchangeInfo.deal_bas_r}</td>
                    <td>${exchangeInfo.ttb}</td>
                    <td>${exchangeInfo.tts}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    </div>
</c:if>

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

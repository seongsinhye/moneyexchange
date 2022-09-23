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

<form action="${pageContext.request.contextPath}/search/total" method="get">
    <div class="container col-xxl-8 px-4 py-5">
        <div style="margin-left: 280px;">
            <h3>전체통화</h3>

            <div style="margin: 20px 0 20px 0;">
                <label> 조회일 예시 20220919 형식으로 작성해주세요.
                    <input type="text" name="day">
                </label>
            </div>
        </div>
        <input type="submit" value="조회" style="margin-left: 425px; font-size: 24px;">
    </div>
</form>
<hr style="margin-top: 100px;">
<div class="table-responsive exchange-list" style="margin-left: 180px;">


    <h3> 환율 정보 </h3>
    <p>${today} </p>
    <table class="table table-striped table-sm " style="width: 700px;">
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

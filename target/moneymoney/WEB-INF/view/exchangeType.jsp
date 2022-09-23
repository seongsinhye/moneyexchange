<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
<form action="http://localhost:8080/moneyexchange/search/type" method="get">
    <div class="container col-xxl-8 px-4 py-5">
        <div style="margin-left: 280px;">
            <h3>통화별 검색 </h3>
            <label> 통화종류
                <select class="form-select" aria-label="Default select example" name="type">
                    <option value="USD">USD (미국 달러)</option>
                    <option value="JPY(100)">JPY (일본 100엔)</option>
                    <option value="EUR">EUR (유럽연합 유로)</option>
                </select>
            </label>
        </div>
        <div>
            <div style="margin: 20px 0 20px 0;">
                <label> 조회일 예시 20220919 형식으로 작성해주세요.
                    <input type="text" name="day">
                </label>
            </div>
        </div>
        <input type="submit" value="조회" style=" margin-left: 425px;font-size: 24px;">
    </div>
</form>


<hr style="margin-top: 20px;">
<div class="table-responsive exchange-list" style="margin-left: 180px;">
    <h3> 환율 정보 </h3>
    <table class="table table-striped table-sm " style="width: 700px;">
        <thead>
        <tr>
            <th scope="col">통화종류</th>
            <th scope="col">통화종류</th>
            <th scope="col">매매기준율</th>
            <th scope="col">현찰(살때)</th>
            <th scope="col">현찰(팔때)</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty exchangeInfoList}">
            <tr>
                <td>서비스 가능 시간이 아닙니다.</td>
            </tr>
        </c:if>
        <c:forEach items="${exchangeInfoList}" var="exchangeInfo">
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
<%@include file="includes/footer.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</body>
</html>

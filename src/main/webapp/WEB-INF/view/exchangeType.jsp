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

<div class="container col-xxl-8 px-4 py-5">
    <form action="http://localhost:8080/moneyexchange/search/type" method="get">
        <div>
            <h3>통화별 검색 </h3>
            <hr>
            <div class="border">
                통화종류와 조회일을 입력하면 해당일의 해당통화 환율을 조회할 수 있습니다.
            </div>
            <label for="type"> 통화종류</label>
            <select class="form-select" aria-label="Default select example" name="type" id="type"
                    style="margin-bottom: 20px">
                <option value="USD">USD (미국 달러)</option>
                <option value="JPY(100)">JPY (일본 100엔)</option>
                <option value="EUR">EUR (유럽연합 유로)</option>
            </select>

        </div>
        <div>
            <div>
                <label for="day">조회일</label>
                <input type="text" name="day" id="day" placeholder="20220919">
                <input type="submit" value="조회하기"
                       style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);">
            </div>
        </div>
    </form>
</div>


<c:if test="${not empty exchangeInfoList}">
    <div class="table-responsive exchange-list col-xxl-8 container">
        <h3> 환율 정보 </h3>
        <table class="table table-striped table-sm ">
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
</c:if>


<%@include file="includes/footer.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</body>
</html>

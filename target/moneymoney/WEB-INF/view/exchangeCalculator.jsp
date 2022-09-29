<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<%@include file="includes/header.jsp" %>

<div class="container col-xxl-8 px-4 py-5">
    <form action="${pageContext.request.contextPath}/calculator.do">
        <div>
            <h3>환전 - 환율 계산기 </h3>
            <hr>

            <label for="when"> 환전 계산 방식</label>
            <select class="form-select" aria-label="Default select example" id="when" name="when"
                    style="margin-bottom: 20px">
                <option value="ttb">현찰 살때</option>
                <option value="tts">현찰 팔때</option>
            </select>


            <label for="type"> 통화종류</label>
            <select class="form-select" aria-label="Default select example" id="type" name="type"
                    style="margin-bottom: 20px">
                <option value="USD">USD (미국 달러)</option>
                <option value="JPY(100)">JPY (일본 100엔)</option>
                <option value="EUR">EUR (유럽연합 유로)</option>
            </select>


            <label for="money"> 필요한 금액 입력하세요</label>
            <input type="text" id="money" name="money">


        </div>
        <hr>
        <input type="submit" value="조회"
               style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);">
    </form>
</div>


<c:if test="${not empty exchangeInfo}">
    <div class="table-responsive exchange-list container col-xxl-8 ">
        <h3> 계산 정보 </h3>
        <p>기준일 : 당일 날짜로 출력하기 </p>
        <table class="table table-striped table-sm ">
            <thead>
            <tr>
                <th scope="col">통화종류</th>
                <th scope="col">기준율</th>
                <th scope="col">고시환율 적용시</th>
                <th scope="col">우대환율 적용시</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${exchangeInfo.cur_unit}</td>
                <td>${exchangeInfo.cur_nm}</td>
                <td>${calculateInfo.return_money}</td>
                <td>-</td>
            </tr>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/pay?money=${calculateInfo.money}" class="container col-xxl-8">
        <button type="button"
                style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);">환전하기
        </button>
    </a>

</c:if>


<%@include file="includes/footer.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</body>
</html>

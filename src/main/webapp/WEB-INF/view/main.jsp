<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 7:48 PM
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
    <style>

    </style>
</head>
<body>
<%@include file="includes/header.jsp" %>

<div class="container col-xxl-8 px-4 py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="col-10 col-sm-8 col-lg-6">
            <h1 class="display-5 fw-bold lh-1 mb-3">MONEY EXCHANGE</h1>
            <p class="lead">쉽고 간단하게 환율 정보를 조회하고, 환율을 계산해 환전을 할 수 있는 사이트입니다.

            </p>


        </div>
        <div class="col-lg-6">
            <h3>공지사항</h3>
            <div style="text-align: left" class="border">
                ※ 주말, 공휴일, 밤 12시~ 오전 11시까지 서비스 이용이 제한
                <br>
                ※ 로그인, 회원가입 기능은 항상 이용 가능
                <br>
                ※ 프로젝트 기간: 2022.09.17 - 2022.09.23
                <br>
                ※ 팀 프로젝트: 인원 2명(백엔드) / 프론트는 각자 진행
            </div>
            <a href="https://github.com/seongsinhye/moneyexchange">
                <button class="w-100 btn btn-lg" type="submit" style=" background: rgb(255, 219, 68);">깃 허브 READ ME
                    바로가기
                </button>
            </a>

        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>

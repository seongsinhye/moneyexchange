<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<section class="container col-xxl-8 px-4 py-5">
    <div class="">
        <h1>환율알림서비스</h1>
        <hr>
    </div>

    <div class="exchange_alarm ">
        <div>
            <h3>환율서비스란 ? </h3>
            <p>일정 기간 내에 고객님께서 등록하신 환율범위 내로 환율이 도달하는 경우, <br>
                문자메시지 또는 이메일로 고객님께 안내 드리는 서비스입니다.</p><br><br>
            <h3>신청안내</h3>
            <p>신청가능시간: 365일 24시간 신청 가능<br>
                신청가능통화: 국민은행에서 환율을 고시하는 모든 통화<br>
                환율종류: 매매기준율, 현찰사실때/파실때, 송금 보내실때/받으실때</p> <br><br>
            <h3>알림안내</h3>
            <p>알림전송조건: 일정 기간 내에 등록하신 환율범위 내로 환율이 도달하는 경우<br>
                알림시간/방법: 09:10 ~ 16:00, 문자메시지(SMS) 또는 이메일 안내</p>
            <hr>
            <div id="btn_wrapper">
                <button type="button" id="goToList" class="goToList_btn"
                        style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);">신청하기
                </button>
            </div>
        </div>
    </div>
</section>
<%@include file="includes/footer.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</body>
</html>

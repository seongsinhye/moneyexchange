<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 8:47 PM
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
<div class="exchange_alarm container col-xxl-8 px-4 py-5" ;>
    <h3>환율 알림 서비스 신청하기</h3>
    <hr>
    <form:form action="${pageContext.request.contextPath}/alarm/add" method="post" modelAttribute="alarmCommand">
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <form:input path="user_name" class="form-control" id="inputEmail3"/>
            </div>
        </div>

        <div class="row mb-3 ">
            <label for="inputEmail3" class="col-sm-2 col-form-label">신청하실 통화</label>
            <div class="col-sm-10">
                <div class="col-12">
                    <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                    <form:select class="form-select" id="inlineFormSelectPref" name="ac" path="ac">

                        <form:option value="USD">USD 달러</form:option>
                        <form:option value="JPY(100)">JPY 100 일본</form:option>
                        <form:option value="EUR">EUR 유럽연합 유로 </form:option>
                    </form:select>
                </div>

            </div>
        </div>


        <div class="row mb-3 ">
            <label for="inputEmail3" class="col-sm-2 col-form-label">알림시간</label>
            <div class="col-sm-10">
                <div class="col-12">
                    <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                    <select class="form-select" id="inlineFormSelectPref" name="type">

                        <option value="buy">현찰 살때</option>
                        <option value="sell">현찰 팔때</option>
                        <option value="meme">매매 기준</option>
                    </select>
                </div>

            </div>
        </div>


        <div class="row mb-3 ">
            <label for="inputEmail3" class="col-sm-2 col-form-label">알림시간</label>
            <div class="col-sm-10">
                <div class="col-12">
                    <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                    <form:select class="form-select" id="inlineFormSelectPref" name="exchangeTime" path="exchangeTime">

                        <form:option value="am11">오전 11시</form:option>
                        <form:option value="pm2">오후 2시</form:option>
                        <form:option value="pm5">오후 5시</form:option>
                    </form:select>
                </div>

            </div>
        </div>


        <fieldset class="row mb-3 ">
            <legend class="col-form-label col-sm-2 pt-0">알림방법</legend>

            <div class="input-group">
                <div class="input-group-text">
                    <input class="form-check-input mt-0" type="radio" value=""
                           aria-label="Radio button for following text input" checked>
                </div>
                <input type="text" class="form-control" aria-label="Text input with radio button"
                       placeholder="휴대폰 번호 입력하세요" name="tel">
            </div>


        </fieldset>
        <hr>

        <div id="btn_wrapper" style="text-align: center">
            <form:button type="submit" id="goToList" class="goToList_btn" style="border-radius: 5px; padding: 5px 10px; border: none; background: rgb(255, 219, 68);">신청하기</form:button>
        </div>

    </form:form>


</div>
<%@include file="includes/footer.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</body>
</html>

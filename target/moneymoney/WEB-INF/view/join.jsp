<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


<div class="col-md-7 col-lg-8" style="margin: auto;">

    <h4 class="mb-3">회원가입</h4>
    <hr class="my-4">
    <form:form cssClass="needs-validation" action="${pageContext.request.contextPath}/join/input" modelAttribute="joinCommand">
        <div class="row g-3">
            <div class="col-12">
                <label for="id" class="form-label">아이디</label>
                <form:input path="id" cssClass="form-control" id="id" placeholder="id123"/>
                <form:errors path="id" />
            </div>
            <div class="col-12">
                <label for="pw" class="form-label">비밀번호</label>
                <form:password path="pw" cssClass="form-control" id="pw" placeholder="password123"/>
                <form:errors path="pw" />
            </div>
            <div class="col-12">
                <label for="pw_check" class="form-label">비밀번호 확인</label>
                <form:password path="pw_check" cssClass="form-control" id="pw_check" placeholder="비밀번호 다시 입력하세여"/>
                <form:errors path="pw_check" />
            </div>
            <div class="col-12">
                <label for="name" class="form-label">이름</label>
                <form:input path="name" cssClass="form-control" id="name" placeholder="길동이는 길동동동"/>
                <form:errors path="name" />
            </div>
            <div class="col-12">
                <label for="tel" class="form-label">전화번호</label>
                <form:input path="tel" cssClass="form-control" id="tel" placeholder="010-0000-0000"/>
                <form:errors path="tel" />
            </div>
            <div class="col-12">
                <label for="addr" class="form-label">주소</label>
                <form:input path="addr" cssClass="form-control" id="addr" placeholder="서면로 10"/>
                <form:errors path="addr" />
            </div>
        </div>

        <hr class="my-4">

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">Shipping address is the same as my billing
                address</label>
        </div>

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">Save this information for next time</label>
        </div>
        <form:button class="w-100 btn btn-primary btn-lg">회원가입</form:button>
    </form:form>

</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>
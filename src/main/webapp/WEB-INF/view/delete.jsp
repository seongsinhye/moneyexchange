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
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="col-lg-6" style="margin: auto;">
            <c:if test="${not empty loginSession}">
                <form action="${pageContext.request.contextPath}/delete/userInfo"
                      cssClass="p-4 p-md-5 border rounded-3 bg-light" method="post">
                    <div class="mb-3">
                        <label for="pw">비밀번호</label>
                        <input type="password" id="pw" name="pw">
                    </div>
                    <button type="submit" class="w-100 btn btn-lg btn-primary">탈퇴하기</button>
                    <hr class="my-4">
                    <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                </form>
            </c:if>
            <c:if test="${empty loginSession}">
                <script>
                    alert("로그인 후 이용가능합니다. ");
                    location.href = "${pageContext.request.contextPath}/login";
                </script>
            </c:if>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>
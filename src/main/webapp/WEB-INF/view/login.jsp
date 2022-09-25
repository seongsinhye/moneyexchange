<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String clientId = "e8iMkjKdq3B2ZDuDopyG";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/moneyexchange/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
%>

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
    <h2>로그인</h2>
    <hr>
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="" style="margin: auto;">
            <c:if test="${not empty loginSession}">
                <div class="p-4 p-md-5 border rounded-3 bg-light">
                    <div>${loginSession.name}(${loginSession.id})님 반갑습니다.</div>
                    <div>
                        <a href="${pageContext.request.contextPath}/logout">
                            <button style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);"
                                    type="submit">로그아웃
                            </button>
                        </a>
                        <a href="${pageContext.request.contextPath}/userinfo">
                            <button style="border-radius: 5px; padding: 5px 10px; border:none; background: rgb(255, 219, 68);"
                                    type="submit">정보수정하기
                            </button>
                        </a>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty loginSession}">
                <form:form action="${pageContext.request.contextPath}/login/self" modelAttribute="loginCommand"
                           cssClass="p-4 p-md-5 border rounded-3 bg-light">
                    <div class="mb-3">
                        <label for="floatingInput">아이디</label>
                        <form:input path="id" cssClass="control" id="floatingInput" placeholder="아이디"/>
                        <form:errors path="id"/>
                    </div>
                    <div class="mb-3">
                        <label for="floatingPassword">비밀번호</label>
                        <form:password path="pw" cssClass="form" id="floatingPassword" placeholder="비밀번호"/>
                        <form:errors path="pw"/>
                    </div>
                    <div class="checkbox mb-3">
                        <label>
                            <form:checkbox path="remember_me"/>Remember me
                        </label>
                    </div>
                    <button class="w-100 btn btn-lg" type="submit" style=" background: rgb(255, 219, 68);">로그인</button>

                    <hr class="my-4">
                    <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
                </form:form>
            </c:if>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>
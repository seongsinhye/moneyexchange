<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="org.json.simple.parser.JSONParser" %>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="java.util.Set" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="java.nio.charset.StandardCharsets" %>
<%@page import="java.nio.charset.Charset" %>
<%@page import="java.io.InputStreamReader" %>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.net.URL" %>
<%@page import="java.net.HttpURLConnection" %>
<%@page import="java.util.Enumeration" %>
<%@ page import="org.springframework.ui.Model" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String getBirthday = "";
    String getName = "";
    String getPhone = "";
%>


<%
    request.setCharacterEncoding("UTF-8");
    String resultCode = request.getParameter("resultCode");
    String resultMsg = request.getParameter("resultMsg");


    // STEP2 에 이어 인증결과가 성공일(resultCode=0000) 경우 STEP2 에서 받은 인증결과로 아래 승인요청 진행

    JSONObject resJson = null;
    if ("0000".equals(resultCode)) {

        String authRequestUrl = request.getParameter("authRequestUrl");
        String txId = request.getParameter("txId");

        String token = request.getParameter("token");     // 최초 요청시 reservedMsg="isUseToken=Y" 일경우 개인정보SEED 복호화를 위한 토큰값 전달

        JSONParser parser = new JSONParser();
        URL url = new URL(authRequestUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        if (conn != null) {
            conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            conn.setRequestMethod("POST");
            conn.setDefaultUseCaches(false);
            conn.setConnectTimeout(3000);
            conn.setReadTimeout(3000);
            conn.setDoOutput(true);

            JSONObject reqJson = new JSONObject();
            reqJson.put("mid", "INIiasTest");    // 부여받은 MID(상점ID) 입력(영업담당자 문의)

            reqJson.put("txId", txId);

            if (conn.getDoOutput()) {
                conn.getOutputStream().write(reqJson.toString().getBytes());
                conn.getOutputStream().flush();
                conn.getOutputStream().close();
            }

            conn.connect();

            if (conn.getResponseCode() == HttpServletResponse.SC_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                resJson = (JSONObject) parser.parse(br);

                br.close();
            }
        }

        String userBirthday = "userBirthday";
        String userName = "userName";
        String userPhone = "userPhone";

        for (Object key : resJson.keySet()) {
            if (key.equals(userBirthday)) {
                getBirthday = resJson.get(key).toString();
            } else if (key.equals(userName)) {
                getName = resJson.get(key).toString();
            } else if (key.equals(userPhone)) {
                getPhone = resJson.get(key).toString();
            }
        }

// -------------------- 결과 수신 -------------------------------------------//
    } else {
        out.print("<p>" + resultCode + "</p>");
        out.print("<p>" + resultMsg + "</p>");
    }
%>

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

    <h2>회원가입</h2>
    <hr>
    <form:form cssClass="needs-validation" action="${pageContext.request.contextPath}/join/input"
               modelAttribute="joinCommand">
        <div class="row g-3">
            <div class="col-12">
                <label for="id" class="form-label">아이디</label>

                <c:if test="${empty sns}">
                    <form:input path="id" cssClass="form-control" id="id" placeholder="id123"/>
                    <form:errors path="id"/>
                </c:if>
                <c:if test="${not empty sns}">
                    <form:input path="id" cssClass="form-control" id="id" placeholder="id123" value="${joinCommand.id}" readonly="true"/>
                    <form:errors path="id"/>
                </c:if>
            </div>
            <div class="col-12">
                <label for="pw" class="form-label">비밀번호</label>
                <c:if test="${empty sns}">
                    <form:password path="pw" cssClass="form-control" id="pw" placeholder="password123"/>
                    <form:errors path="pw"/>
                </c:if>
                <c:if test="${not empty sns}">
                    <form:password path="pw" cssClass="form-control" id="pw" disabled="true"/>
                    <form:errors path="pw"/>
                </c:if>
            </div>
            <div class="col-12">
                <label for="pw_check" class="form-label">비밀번호 확인</label>
                <c:if test="${empty sns}">
                    <form:password path="pw_check" cssClass="form-control" id="pw_check" placeholder="비밀번호 다시 입력하세여"/>
                    <form:errors path="pw_check"/>
                </c:if>
                <c:if test="${not empty sns}">
                    <form:password path="pw_check" cssClass="form-control" id="pw_check" placeholder="비밀번호 다시 입력하세여" disabled="true"/>
                    <form:errors path="pw_check"/>
                </c:if>

            </div>
            <div class="col-12">
                <label for="name" class="form-label">이름</label>
                <c:if test="${empty sns}">
                    <form:input path="name" cssClass="form-control" id="name" placeholder="길동이는 길동동동" value="<%=getName%>"
                                readonly="true"/>
                    <form:errors path="name"/>
                </c:if>
                <c:if test="${not empty sns}">
                    <form:input path="name" cssClass="form-control" id="name" placeholder="길동이는 길동동동" value="${joinCommand.name}"
                                readonly="true"/>
                    <form:errors path="name"/>
                </c:if>
            </div>
            <div class="col-12">
                <label for="tel" class="form-label">전화번호</label>
                <c:if test="${empty sns}">
                    <form:input path="tel" cssClass="form-control" id="tel" placeholder="010-0000-0000"
                                value="<%=getPhone%>" readonly="true"/>
                    <form:errors path="tel"/>
                </c:if>
                <c:if test="${not empty sns}">
                    <form:input path="tel" cssClass="form-control" id="tel" placeholder="010-0000-0000"
                                value="${joinCommand.tel}" readonly="true"/>
                    <form:errors path="tel"/>
                </c:if>

            </div>
            <div class="col-12">
                <label for="addr" class="form-label">주소</label>
                <form:input path="addr" cssClass="form-control" id="addr" placeholder="서면로 10"/>
                <form:errors path="addr"/>
            </div>
        </div>

        <hr class="my-4">

        <form:button class="w-100 btn  btn-lg" style="background: rgb(255, 219, 68);">회원가입</form:button>
    </form:form>

</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>

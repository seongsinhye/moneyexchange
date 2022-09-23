<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page import="javax.xml.bind.DatatypeConverter" %>
<%@page import="java.security.MessageDigest" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String mid = "INIiasTest";                                    // 부여받은 MID(상점ID) 입력(영업담당자 문의)
    String apiKey = "TGdxb2l3enJDWFRTbTgvREU3MGYwUT09";      // 부여받은 MID 에 대한 apiKey
    String reqSvcCd = "01";
    String mTxId = "mTxId_" + Calendar.getInstance().getTimeInMillis();
    String reservedMsg = "isUseToken=N";                 // 결과조회 응답시 개인정보SEED 암호화 처리 요청

// 등록가맹점 확인
    String plainText1 = mid + mTxId + apiKey;
    MessageDigest authmd = MessageDigest.getInstance("SHA-256");
    authmd.update(plainText1.getBytes("UTF-8"));
    String authHash = DatatypeConverter.printHexBinary(authmd.digest()).toLowerCase();

    String userName = "";           // 사용자 이름
    String userPhone = "01011112222";  // 사용자 핸드폰
    String userBirth = "19800101";         // 사용자 생년월일
    String userHash = "";
    String flgFixedUser = "N";              // 특정사용자 고정시 Y

    if ("Y".equals(flgFixedUser)) {
        String plainText2 = userName + mid + userPhone + mTxId + userBirth + reqSvcCd;
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(plainText2.getBytes("UTF-8"));
        userHash = DatatypeConverter.printHexBinary(md.digest()).toLowerCase();
    }
%>
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
    <script language="javascript">
        function callSa() {
            let window = popupCenter();
            if (window != undefined && window != null) {
                //document.saForm.setAttribute("target", "sa_popup");
                document.saForm.setAttribute("post", "post");
                document.saForm.setAttribute("action", "https://sa.inicis.com/auth");
                document.saForm.submit();
            }
        }

        function popupCenter() {
            let _width = 400;
            let _height = 620;
            var xPos = (document.body.offsetWidth / 2) - (_width / 2); // 가운데 정렬
            xPos += window.screenLeft; // 듀얼 모니터일 때

            return window.open("", "sa_popup", "width=" + _width + ", height=" + _height + ", left=" + xPos + ", menubar=yes, status=yes, titlebar=yes, resizable=yes");
        }
    </script>
</head>
<body>
<%@include file="includes/header.jsp" %>


<div class="col-md-7 col-lg-8" style="margin: auto;">

    <h4 class="mb-3">회원가입</h4>
    <hr class="my-4">
    <div>
        <button type="submit" onclick="callSa()">본인인증</button>
    </div>
    <form name="saForm">
        <input type="text" name="mid" value="<%=mid %>" hidden>
        <input type="text" name="reqSvcCd" value="<%=reqSvcCd %>" hidden>
        <input type="text" name="mTxId" value="<%=mTxId %>" hidden>
        <input type="text" name="authHash" value="<%=authHash %>" hidden>
        <input type="text" name="flgFixedUser" value="<%=flgFixedUser %>" hidden>
        <input type="text" name="userName" value="<%=userName %>" id="userName" hidden>
        <input type="text" name="userPhone" value="<%=userPhone %>" id="userPhone" hidden>
        <input type="text" name="userBirth" value="<%=userBirth %>" id="userBirth" hidden>
        <input type="text" name="userHash" value="<%=userHash %>" hidden>
        <input type="text" name="reservedMsg" value="<%=reservedMsg %>" hidden>
        <input type="text" name="directAgency" value="" hidden>
        <input type="text" name="successUrl" value="http://localhost:8080/moneyexchange/join2" hidden>
        <input type="text" name="failUrl" value="http://localhost:8080/moneyexchange/join" hidden>
        <!-- successUrl/failUrl 은 분리하여도 됩니다. !-->
    </form>
    <form:form cssClass="needs-validation" action="${pageContext.request.contextPath}/join/input"
               modelAttribute="joinCommand">
        <div class="row g-3">
            <div class="col-12">
                <label for="id" class="form-label">아이디</label>
                <form:input path="id" cssClass="form-control" id="id" placeholder="id123" disabled="true"/>
                <form:errors path="id"/>
            </div>
            <div class="col-12">
                <label for="pw" class="form-label">비밀번호</label>
                <form:password path="pw" cssClass="form-control" id="pw" placeholder="password123" disabled="true"/>
                <form:errors path="pw"/>
            </div>
            <div class="col-12">
                <label for="pw_check" class="form-label">비밀번호 확인</label>
                <form:password path="pw_check" cssClass="form-control" id="pw_check" disabled="true" placeholder="비밀번호 다시 입력하세여"/>
                <form:errors path="pw_check"/>
            </div>
            <div class="col-12">
                <label for="name" class="form-label">이름</label>
                <form:input path="name" cssClass="form-control" id="name" placeholder="길동이는 길동동동" disabled="true"/>
                <form:errors path="name"/>
            </div>
            <div class="col-12">
                <label for="tel" class="form-label">전화번호</label>
                <form:input path="tel" cssClass="form-control" id="tel" placeholder="010-0000-0000" disabled="true"/>
                <form:errors path="tel"/>
            </div>
            <div class="col-12">
                <label for="addr" class="form-label">주소</label>
                <form:input path="addr" cssClass="form-control" id="addr" placeholder="서면로 10" disabled="true"/>
                <form:errors path="addr"/>
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

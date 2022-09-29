<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/18
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

</head>
<body>
<script>
    $(location).attr("href", "${pageContext.request.contextPath}/login");
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: gangjiyeon
  Date: 2022/09/17
  Time: 8:56 PM
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trendinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trendtwo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="includes/header.jsp"%>


<div class="container">
    <h1>공지사항</h1>

    <div id="wrapper" class=" ">
        <form action="/exchange/notice/write" method="post">
            <div id="title_wrapper">
                <input type="text" name="title" class="title_txt title" id="form_detail_text" placeholder="제목을 입력하세요." style="padding: 20px;">
                <span class="updateday"> 등록일 : 2022-05-05 </span>

            </div>

            <textarea name="contents" id="contents_wrapper" style="padding: 30px; width: 100%; min-height: 500px;" class=" contents" placeholder="내용을 입력하세요"></textarea>

            <div id="file_wrapper">
                <img src="../img/img.png" alt=""><a href="#">첨부파일</a>
            </div>

            <div id="btn_wrapper">
                <button type="submit" id="goToSubmit" class="goToList_btn">등록하기</button>

                <button type="button" id="goToDelete" class="goToList_btn">삭제하기</button>
            </div>



        </form>
    </div>

</div>

<%@include file="includes/footer.jsp"%>


</body>
</html>

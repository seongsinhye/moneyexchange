
<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
  <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-4">ME</span>
    </a>

    <ul class="nav nav-pills">
      <li class="nav-item"><a href="#" class="nav-link" aria-current="page">환율조회</a></li>
      <li class="nav-item"><a href="#" class="nav-link">환율알림서비스</a></li>
      <li class="nav-item"><a href="#" class="nav-link">맞춤환전</a></li>
      <li class="nav-item"><a href="#" class="nav-link">공지사항</a></li>
      <li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
      <li class="nav-item"><a href="#" class="nav-link">회원가입</a></li>

    </ul>
  </header>
</div>

<form>



  <div class="container col-xxl-8 px-4 py-5">

    <div style="margin-left: 280px;">
      <h3>전체통화</h3>

      <div style="margin: 20px 0 20px 0;">
        <label> 조회일
          <div class="inq_period">
            <button type="button" class="btn-sub1">오늘</button>
            <button type="button" class="btn-sub1">전일</button>
          </div>
        </label>
      </div>




      <div class="dropdown-menu p-2 shadow rounded-3" style="text-align: center; display: block;  width: 340px" id="dropdownCalendar">
        <div class="d-grid gap-1">
          <div class="cal">
            <div class="cal-month">
              <button class="btn cal-btn" type="button">
                <svg class="bi" width="16" height="16"><use xlink:href="#arrow-left-short"></use></svg>
              </button>
              <strong class="cal-month-name">June</strong>
              <select class="form-select cal-month-name d-none">
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option selected="" value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>
              </select>
              <button class="btn cal-btn" type="button">
                <svg class="bi" width="16" height="16"><use xlink:href="#arrow-right-short"></use></svg>
              </button>
            </div>
            <div class="cal-weekdays text-muted" style="grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
                display: grid;">
              <div class="cal-weekday">Sun</div>
              <div class="cal-weekday">Mon</div>
              <div class="cal-weekday">Tue</div>
              <div class="cal-weekday">Wed</div>
              <div class="cal-weekday">Thu</div>
              <div class="cal-weekday">Fri</div>
              <div class="cal-weekday">Sat</div>
            </div>
            <div class="cal-days">
              <button class="btn cal-btn" disabled="" type="button">30</button>
              <button class="btn cal-btn" disabled="" type="button">31</button>

              <button class="btn cal-btn" type="button">1</button>
              <button class="btn cal-btn" type="button">2</button>
              <button class="btn cal-btn" type="button">3</button>
              <button class="btn cal-btn" type="button">4</button>
              <button class="btn cal-btn" type="button">5</button>
              <button class="btn cal-btn" type="button">6</button>
              <button class="btn cal-btn" type="button">7</button>

              <button class="btn cal-btn" type="button">8</button>
              <button class="btn cal-btn" type="button">9</button>
              <button class="btn cal-btn" type="button">10</button>
              <button class="btn cal-btn" type="button">11</button>
              <button class="btn cal-btn" type="button">12</button>
              <button class="btn cal-btn" type="button">13</button>
              <button class="btn cal-btn" type="button">14</button>

              <button class="btn cal-btn" type="button">15</button>
              <button class="btn cal-btn" type="button">16</button>
              <button class="btn cal-btn" type="button">17</button>
              <button class="btn cal-btn" type="button">18</button>
              <button class="btn cal-btn" type="button">19</button>
              <button class="btn cal-btn" type="button">20</button>
              <button class="btn cal-btn" type="button">21</button>

              <button class="btn cal-btn" type="button">22</button>
              <button class="btn cal-btn" type="button">23</button>
              <button class="btn cal-btn" type="button">24</button>
              <button class="btn cal-btn" type="button">25</button>
              <button class="btn cal-btn" type="button">26</button>
              <button class="btn cal-btn" type="button">27</button>
              <button class="btn cal-btn" type="button">28</button>

              <button class="btn cal-btn" type="button">29</button>
              <button class="btn cal-btn" type="button">30</button>
              <button class="btn cal-btn" type="button">31</button>
            </div>
          </div>
        </div>
      </div>
    </div>



    <input type="submit" value="조회">




</form>



<hr style="margin-top: 350px;">

<div class="table-responsive exchange-list" style="margin-left: 180px;">


  <h3> 환율 정보 </h3>
  <p>기준일 : 2022년 5월 22일 </p>
  <table class="table table-striped table-sm " style="width: 700px;">
    <thead>
    <tr>
      <th scope="col">통화종류</th>
      <th scope="col">통화종류</th>
      <th scope="col">매매기준율</th>
      <th scope="col">현찰(살때)</th>
      <th scope="col">현찰(팔떄)</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="exchangeInfo" items="${exchangeInfoList}">
      <tr>
        <td>${exchangeInfo.cur_unit}</td>
        <td>${exchangeInfo.cur_nm}</td>
        <td>${exchangeInfo.deal_bas_r}</td>
        <td>${exchangeInfo.ttb}</td>
        <td>${exchangeInfo.tts}</td>
      </tr>
    </c:forEach>

    </tbody>
  </table>
</div>



</div>

<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Company, Inc</p>
  </footer>
</div>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
</body>
</html>

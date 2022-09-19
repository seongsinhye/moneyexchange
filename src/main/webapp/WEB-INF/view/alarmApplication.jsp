<%--
  Created by IntelliJ IDEA.
  User: seongsinhye
  Date: 2022/09/17
  Time: 8:49 PM
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


<section style="margin-left: 400px;">
    <div class="inner">
        <h1 class="ta-l innerTxt">환율알림서비스</h1>

    </div>

    <div class="exchange_alarm" style="width: 650px;">
        <form>
            <div class="row mb-3">
                <label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail3">

                </div>
            </div>

            <div class="row mb-3 ">
                <label for="inputEmail3" class="col-sm-2 col-form-label">신청하실 통화</label>
                <div class="col-sm-10">
                    <div class="col-12">
                        <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                        <select class="form-select" id="inlineFormSelectPref">
                            <option selected="">선택하세요</option>
                            <option value="1">USD 달러</option>
                            <option value="2">JPY 100 일본</option>
                            <option value="3">EUR 유럽연합 유로 </option>
                        </select>
                    </div>

                </div>
            </div>

            <div class="row mb-3 ">
                <label for="inputEmail3" class="col-sm-2 col-form-label">환율 종류</label>
                <div class="col-sm-10">
                    <div class="col-12">
                        <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                        <select class="form-select" id="inlineFormSelectPref">
                            <option selected="">선택하세요</option>
                            <option value="1">현찰살때</option>
                            <option value="2">현찰팔때</option>
                            <option value="3">매매기준율</option>
                        </select>
                    </div>

                </div>
            </div>

            <div class="row mb-3 ">
                <label for="inputEmail3" class="col-sm-2 col-form-label">알림시간</label>
                <div class="col-sm-10">
                    <div class="col-12">
                        <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
                        <select class="form-select" id="inlineFormSelectPref">
                            <option selected="">선택하세요</option>
                            <option value="1">오전 9시</option>
                            <option value="2">오후 1시</option>
                            <option value="3">오후 5시</option>
                        </select>
                    </div>

                </div>
            </div>



            <fieldset class="row mb-3 ">
                <legend class="col-form-label col-sm-2 pt-0">알림방법</legend>

                <div class="input-group">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with radio button" placeholder="휴대폰 번호 입력하세요">
                </div>
                <div class="input-group">
                    <div class="input-group-text">
                        <input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
                    </div>
                    <input type="text" class="form-control" aria-label="Text input with radio button" placeholder="이메일 주소 입력하세요">
                </div>

            </fieldset>

            <div id="btn_wrapper" style="margin-left: 200px; margin-top: 50px;">

                <button type="button" id="goToList" class="goToList_btn">신청하기</button>
                <button type="button" id="goToList" class="goToList_btn">변경하기</button>
                <button type="button" id="goToList" class="goToList_btn">해지하기</button>
            </div>

        </form>





    </div>




    </div>




</section>


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

<div class="exchange_alarm" style="width: 650px;">
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
                    <select class="form-select" id="inlineFormSelectPref"  name="type">

                        <option value="buy">현찰 살때 </option>
                        <option value="sell">현찰 팔때 </option>
                        <option value="meme">매매 기준  </option>
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
                    <input class="form-check-input mt-0" type="radio" value="" aria-label="Radio button for following text input">
                </div>
                <input type="text" class="form-control" aria-label="Text input with radio button" placeholder="휴대폰 번호 입력하세요" name="tel">
            </div>


        </fieldset>

        <div id="btn_wrapper" style="margin-left: 200px; margin-top: 50px;">

            <form:button type="submit" id="goToList" class="goToList_btn">신청하기</form:button>


            <button type="button" id="goToList" class="goToList_btn">변경하기</button>
            <button type="button" id="goToList" class="goToList_btn">해지하기</button>
        </div>

    </form:form>





</div>
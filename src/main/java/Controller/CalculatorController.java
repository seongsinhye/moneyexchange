package Controller;

import dto.CalculateInfo;
import dto.ExchangeInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CalculatorController {

    //환율계산 뷰 페이지 보여주기
    @GetMapping("/calculator")
    public String calculator(){
        return "exchangeCalculator";
    }


    //환율계산하기
    @GetMapping("/calculator.do")
    public String calculator_do(@RequestParam(value = "when") String when,
                            @RequestParam(value = "type") String type,
                            @RequestParam(value = "money") Integer money,
                            @RequestParam(value = "percentage", required = false) Integer percentage,
                            Model model) throws IOException {

        //현재 날짜 now 변수에 저장하기
        String now = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

        //api 정보를 받아 올 url 생성하기
        String url1 = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=QFBs6p6zXu8qm9N1Lbu0Gn0MJ9JCOMl7&searchdate=" + now +"&data=AP01";
        URL url = new URL(url1);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");

        //응답 정보 받기
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }//if

        //응답정보 result(String) 변수에 저장하기
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        String result = sb.toString();

        //Json 형태로 변환 후 model에 담아서 전송하기
        try {
            JSONParser jsonParser = new JSONParser();
            JSONArray jsonArray = (JSONArray) jsonParser.parse(result);

            for(int i=0 ; i<jsonArray.size() ; i++){
                System.out.println(jsonArray.get(i));
                JSONObject jsonObj = (JSONObject) jsonArray.get(i);

                //cur_unit(통화타입)이 사용자가 계산하고 싶어하는 통화타입이라면
                if(((String)jsonObj.get("cur_unit")).equals(type)){
                    double return_money = 0;

                    //사용자가 통화를 살 때를 선택했다면
                    if (when.equals("tts")){

                        //해당 통화타입의 살 때 금액을 num(String)에 변환 후 저장
                        String num = ((String) jsonObj.get("tts"));

                        //금액이 1000원 단위가 넘어간다면 ',' 제거
                        if(num.contains(",")){
                            num = num.split(",")[0] + num.split(",")[1];
                        }

                        //소수점 이하 자리 제거
                        num = num.split("[.]")[0];

                        //double로 형변환
                        double number = Integer.valueOf(num);

                        //총 필요한 금액 반환
                        return_money = number * money;

                    //사용자가 통화를 팔 떄를 선택했다면
                    }else if(when.equals("ttb")){
                        String num = ((String) jsonObj.get("ttb"));
                        if(num.contains(",")){
                            num = num.split(",")[0] + num.split(",")[1];
                        }
                        num = num.split("[.]")[0];

                        System.out.println(num);
                        double number = Integer.valueOf(num);
                        return_money = number * money;
                    } //if


                    //환전계산 요정정보를 calculateInfo 객체에 저장
                    CalculateInfo calculateInfo = new CalculateInfo(when, type, money, percentage, return_money);

                    //결과를 exchangeInfo 객체에 저장
                    String ttb = (String) jsonObj.get("ttb");
                    String tts = (String) jsonObj.get("tts");
                    String cur_nm = (String) jsonObj.get("cur_nm");
                    String deal_bas_r = (String) jsonObj.get("deal_bas_r");
                    String cur_unit = (String) jsonObj.get("cur_unit");
                    ExchangeInfo exchangeInfo = new ExchangeInfo(cur_unit ,ttb, tts, deal_bas_r, cur_nm);

                    //결과
                    model.addAttribute("calculateInfo", calculateInfo);
                    model.addAttribute("exchangeInfo", exchangeInfo);
                }//if
            }//for
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }//try

        rd.close();
        conn.disconnect();

        return "exchangeCalculator";
    }
}

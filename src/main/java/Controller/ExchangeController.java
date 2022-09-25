package Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dto.ExchangeInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ExchangeController {

    //전체 환율 조회 view 페이지 보여주기
    @GetMapping("/total")
    public String totalPage() {
        return "exchangeTotal";
    }

    //통화별 조회 view 페이지 보여주기
    @GetMapping("/type")
    public String typePage() {
        return "exchangeType";
    }


    @GetMapping("/search/type")
    public String typePage(@RequestParam(value = "day", required = false)String day, @RequestParam(value = "type",required = false) String type,  Model model)throws IOException {

        model.addAttribute("day",day);
        model.addAttribute("type", type);

        //환율 정보 조회 URL 생성
        String url1 = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=QFBs6p6zXu8qm9N1Lbu0Gn0MJ9JCOMl7&searchdate=" + day +"&data=AP01";
        URL url = new URL(url1);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET"); // 보내고 가져오는것을 서버가 가지고 있고
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        //응답정보 구성 후 result 변수에 저장
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        String result = sb.toString();


        List<ExchangeInfo> exchangeInfoList = new ArrayList<>();
        try {
            JSONParser jsonParser = new JSONParser();
            JSONArray jsonArray = (JSONArray) jsonParser.parse(result);


            for(int i=0 ; i<jsonArray.size() ; i++){
                System.out.println(jsonArray.get(i));
                JSONObject jsonObj = (JSONObject) jsonArray.get(i);
                ExchangeInfo exchangeInfo = new ExchangeInfo();
                exchangeInfo.setTtb((String) jsonObj.get("ttb"));
                exchangeInfo.setTts((String) jsonObj.get("tts"));
                exchangeInfo.setCur_nm((String) jsonObj.get("cur_nm"));
                exchangeInfo.setDeal_bas_r((String) jsonObj.get("deal_bas_r"));
                exchangeInfo.setCur_unit((String) jsonObj.get("cur_unit"));

                if(((String)jsonObj.get("cur_unit")).equals(type)){
                    exchangeInfoList.add(exchangeInfo);
                }//if

            }//for
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }//try


        model.addAttribute("exchangeInfoList", exchangeInfoList);
        rd.close();
        conn.disconnect();

        return "exchangeType";
    }


    //전체 환율 조회
    @GetMapping("/search/total")
    public String totalPage(@RequestParam(value = "day")String day, Model model) throws IOException {


        model.addAttribute("day", day);

        //URL 구성
        String url1 = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=QFBs6p6zXu8qm9N1Lbu0Gn0MJ9JCOMl7&searchdate=" + day +"&data=AP01";
        URL url = new URL(url1);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        //응답정보 result에 저장
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        String result = sb.toString();


        //Json 형태로 변환 후 exchangeInfoList에 저장
        List<ExchangeInfo> exchangeInfoList = new ArrayList<>();
        try {
            JSONParser jsonParser = new JSONParser();
            JSONArray jsonArray = (JSONArray) jsonParser.parse(result);

            for(int i=0 ; i<jsonArray.size() ; i++){
                System.out.println(jsonArray.get(i));
                JSONObject jsonObj = (JSONObject) jsonArray.get(i);
                ExchangeInfo exchangeInfo = new ExchangeInfo();
                exchangeInfo.setTtb((String) jsonObj.get("ttb"));
                exchangeInfo.setTts((String) jsonObj.get("tts"));
                exchangeInfo.setCur_nm((String) jsonObj.get("cur_nm"));
                exchangeInfo.setDeal_bas_r((String) jsonObj.get("deal_bas_r"));
                exchangeInfo.setCur_unit((String) jsonObj.get("cur_unit"));

                exchangeInfoList.add(exchangeInfo);
                System.out.println(exchangeInfo.getTtb());
                System.out.println("----------------------------");
            }//for
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }//try

        model.addAttribute("exchangeInfoList", exchangeInfoList);

        rd.close();
        conn.disconnect();

        return "exchangeTotal";
    }
}

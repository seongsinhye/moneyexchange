package Controller;

import dto.ExchangeInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import org.json.simple.parser.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
public class ExchangeController {

    @GetMapping("/total")
    public String totalPage(){
        return "exchangeTotal";
    }

    @GetMapping("/type")
    public String type(){
        return "exchangeType";
    }

    @GetMapping("/search/type")
    public String typePage(@RequestParam(value = "day", required = false)String day, @RequestParam(value = "type",required = false) String type,  Model model)throws IOException {

        model.addAttribute("day",day);
        model.addAttribute("type", type);


        System.out.println("type=" + type);



        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/MsrstnInfoInqireSvc/getMsrstnList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=5s1CLJYo0jELvJ0Iml%2FGBRUnCC%2Fd9qQXco7kXtodmoGjGVdWJZk3dX4zNpZJiMEAttCA3p8tUOAMaFgamtLoHw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*xml 또는 json*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("addr","UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8")); /*주소*/
        urlBuilder.append("&" + URLEncoder.encode("stationName","UTF-8") + "=" + URLEncoder.encode("종로구", "UTF-8")); /*측정소명*/

        String url1 = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=QFBs6p6zXu8qm9N1Lbu0Gn0MJ9JCOMl7&searchdate=" + day +"&data=AP01";

        URL url = new URL(url1);


        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET"); // 보내고 가져오는것을 서버가 가지고 있고
        conn.setRequestProperty("Content-type", "application/json");


        System.out.println("Response code: " + conn.getResponseCode());
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

                }

                System.out.println(exchangeInfo.getTtb());
                System.out.println("----------------------------"); }
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        model.addAttribute("exchangeInfoList", exchangeInfoList);
        rd.close();
        conn.disconnect();


        return "exchangeType";
    }

    @GetMapping("/search/total")
    public String totalPage(@RequestParam(value = "day", required = false)String day, Model model) throws IOException {


        model.addAttribute("day", day);

        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552584/MsrstnInfoInqireSvc/getMsrstnList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=5s1CLJYo0jELvJ0Iml%2FGBRUnCC%2Fd9qQXco7kXtodmoGjGVdWJZk3dX4zNpZJiMEAttCA3p8tUOAMaFgamtLoHw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*xml 또는 json*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("addr","UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8")); /*주소*/
        urlBuilder.append("&" + URLEncoder.encode("stationName","UTF-8") + "=" + URLEncoder.encode("종로구", "UTF-8")); /*측정소명*/

        String url1 = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=QFBs6p6zXu8qm9N1Lbu0Gn0MJ9JCOMl7&searchdate=" + day +"&data=AP01";

        URL url = new URL(url1);


        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET"); // 보내고 가져오는것을 서버가 가지고 있고
        conn.setRequestProperty("Content-type", "application/json");


        System.out.println("Response code: " + conn.getResponseCode());
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

                exchangeInfoList.add(exchangeInfo);
                System.out.println(exchangeInfo.getTtb());
                System.out.println("----------------------------"); }
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        model.addAttribute("exchangeInfoList", exchangeInfoList);
        rd.close();
        conn.disconnect();



        return "exchangeTotal";
    }








}

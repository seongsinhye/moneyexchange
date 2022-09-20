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

    @GetMapping("/calculator")
    public String calculator(){
        return "exchangeCalculator";
    }


    @GetMapping("/calculator.do")
    public String calculator_do(@RequestParam(value = "when") String when,
                            @RequestParam(value = "type") String type,
                            @RequestParam(value = "money") Integer money,
                            @RequestParam(value = "percentage", required = false) Integer percentage,
                            Model model) throws IOException {

        String now = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String url1 = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=QFBs6p6zXu8qm9N1Lbu0Gn0MJ9JCOMl7&searchdate=" + now +"&data=AP01";

        URL url = new URL(url1);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
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

        try {
            JSONParser jsonParser = new JSONParser();
            JSONArray jsonArray = (JSONArray) jsonParser.parse(result);

            for(int i=0 ; i<jsonArray.size() ; i++){
                System.out.println(jsonArray.get(i));
                JSONObject jsonObj = (JSONObject) jsonArray.get(i);

                if(((String)jsonObj.get("cur_unit")).equals(type)){

                    double return_money = 0;


                    if (when.equals("tts")){
                        String num = ((String) jsonObj.get("tts"));

                        if(num.contains(",")){
                            num = num.split(",")[0] + num.split(",")[1];
                        }

                        num = num.split(".")[0];
                        num = num.split("[.]")[0];
                        double number = Integer.valueOf(num);
                        return_money = number * money;
                    }else if(when.equals("ttb")){
                        String num = ((String) jsonObj.get("ttb"));
                        if(num.contains(",")){
                            num = num.split(",")[0] + num.split(",")[1];
                        }
                        System.out.println(num);

                        num = num.split("[.]")[0];

                        System.out.println(num);
                        double number = Integer.valueOf(num);
                        return_money = number * money;
                    }


                    CalculateInfo calculateInfo = new CalculateInfo(when, type, money, percentage, return_money);

                    String ttb = (String) jsonObj.get("ttb");
                    String tts = (String) jsonObj.get("tts");
                    String cur_nm = (String) jsonObj.get("cur_nm");
                    String deal_bas_r = (String) jsonObj.get("deal_bas_r");
                    String cur_unit = (String) jsonObj.get("cur_unit");
                    ExchangeInfo exchangeInfo = new ExchangeInfo(cur_unit ,ttb, tts, deal_bas_r, cur_nm);

                    model.addAttribute("calculateInfo", calculateInfo);
                    model.addAttribute("exchangeInfo", exchangeInfo);
                }


                System.out.println("----------------------------"); }
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }





        rd.close();
        conn.disconnect();


        return "exchangeCalculator";
    }
}

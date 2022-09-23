package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExController {

    @GetMapping("/main")
    public String main(){
        return "main";
    }

    @GetMapping("/pay")
    public String INIStdPayRequest(){
        return "INIStdPayRequest";
    }

    @RequestMapping("/INIStdPayReturn")
    public String INIStdPayReturn(){
        return "INIStdPayReturn";
    }

    @RequestMapping("/close")
    public String close(){
        return "close";
    }

    @RequestMapping("/popup")
    public String popup(){
        return "popup";
    }

}

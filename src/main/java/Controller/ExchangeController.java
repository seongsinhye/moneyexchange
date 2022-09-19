package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExchangeController {

    @GetMapping("/total")
    public String totalPage(){
        return "exchangeTotal";
    }

    @GetMapping("/type")
    public String typePage(){
        return "exchangeType";
    }
}

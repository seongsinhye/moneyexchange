package Etc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExController {

    @GetMapping("/main")
    public String main(){
        return "main";
    }

}

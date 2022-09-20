package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AlarmController {

    @GetMapping("/alarm")
    public String alarmPage(){
        return "alarm";
    }

    @GetMapping("/application")
    public String alarmApplocation(){return "alarmApplication";}
}

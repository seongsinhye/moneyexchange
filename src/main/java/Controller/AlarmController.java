package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AlarmController {

    //알림 view 페이지 보여주기
    @GetMapping("/alarm")
    public String alarmPage() {
        return "alarm";
    }

    @GetMapping("/application")
    public String alarmApplocation() {
        return "alarmApplication";
    }
}

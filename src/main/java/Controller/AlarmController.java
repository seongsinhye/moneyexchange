package Controller;

import Command.AlarmCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import service.AlarmService;

@Controller
public class AlarmController {

//
//    @Autowired
//    private AlarmService alarmService;
//
//    public AalarmController(AlarmService alarmService){
//        this.alarmService = alarmService;
//    }


    @GetMapping("/alarm")
    public String alarmPage(){
        return "alarm";
    }

    @GetMapping("/application")
    public String alarmApplocation(){return "alarmApplication";}

    @PostMapping("/alarm/application")
    public String alarmApplicationPage(AlarmCommand alarmCommand, Model model){




        return "alarm";
    }

}

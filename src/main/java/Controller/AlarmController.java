package Controller;
import User.Validator.AlarmValidator;
import dto.AlarmCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.AlarmService;
import java.util.List;


@Controller
public class AlarmController {
    @Autowired
    private AlarmService alarmService;

    public void setAlarmService(AlarmService alarmService){this.alarmService = alarmService;}


    //알림 view 페이지 보여주기
    @GetMapping("/alarm")
    public String alarmPage() {
        return "alarm";
    }

    @GetMapping("/application")
    public String alarmApplocation(Model model){

        model.addAttribute("alarmCommand", new AlarmCommand());
        return "alarmApplication";
    }

    @PostMapping("/alarm/add")
    public String alarm(AlarmCommand alarmCommand,@RequestParam(value = "type") String type){


        System.out.println(alarmCommand.getType());

        System.out.println(type);



        System.out.println(alarmCommand.getAc());
        System.out.println(alarmCommand.getTel());
        System.out.println(alarmCommand.getUser_name());
        System.out.println(alarmCommand.getExchangeTime());


        alarmCommand.setExchangType(type);

        alarmService.add(alarmCommand);


        return "alarm";
    }


    @GetMapping("/alarm/list")
    public String alarmList(){

        return "alarm_list";
    }

    @GetMapping("/alarm/delete")
    public String alarmDelete(@RequestParam(value = "idx") int idx){

        alarmService.delete(idx);

        return "alarm";
    }

    @PostMapping("/alarm/phone")
    public String alarmListPhone(AlarmCommand alarmCommand, Errors errors, Model model){

        new AlarmValidator().validate(alarmCommand,errors);

        if(errors.hasErrors()){
            return "alarm_list";
        }

        List<AlarmCommand> alarmCommandList = alarmService.select(alarmCommand);

        model.addAttribute("alarmCommandList", alarmCommandList);


        return "alarm_list";
    }




}

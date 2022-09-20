package User.Controller;

import User.Dto.JoinCommand;
import User.Dto.LoginSession;
import User.Exception.CantMakeUserInfoException;
import User.Service.JoinService;
import User.Validator.JoinValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class JoinController {


    private JoinService joinService;

    public void setJoinController(JoinService joinService) {
        this.joinService = joinService;
    }

    @GetMapping("/join")
    public String view_join_page(Model model) {
        model.addAttribute("joinCommand", new JoinCommand());
        return "join";
    }

    @PostMapping("/join/input")
    public String join_input(Model model, JoinCommand joinCommand, Errors errors) {

        new JoinValidator().validate(joinCommand, errors);

        if (errors.hasErrors()) {
            return "join";
        }

        if (!joinService.idPossibleId(joinCommand.getId())) {
            errors.rejectValue("id", "duplicate");
            return "join";
        } else {
            try {
                joinService.join(joinCommand);
                return "join_success";

            } catch (CantMakeUserInfoException e) {
                return "join";
            }
        }


    }

    @GetMapping("/delete/userInfo/view")
    public String view_deleteUserInfo() {
        return "delete";
    }

    @PostMapping("/delete/userInfo")
    public String deleteUserInfo(@RequestParam("pw") String pw, HttpSession session) {

        LoginSession loginSession = (LoginSession) session.getAttribute("loginSession");
        if (joinService.delete_userInfo(loginSession.getId(), pw)) {
            session.removeAttribute("loginSession");
            return "main";
        } else {
            return "delete";
        }


    }
}

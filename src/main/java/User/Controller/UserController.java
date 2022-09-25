package User.Controller;

import User.Dto.JoinCommand;
import User.Dto.LoginSession;
import User.Dto.NaverLoginBO;
import User.Dto.UserInfo;
import User.Exception.CantMakeUserInfoException;
import User.Service.LoginService;
import User.Service.UserService;
import User.Validator.JoinValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/userinfo")
    public String view_userInfo(HttpSession session, Model model){
        LoginSession loginSession = (LoginSession) session.getAttribute("loginSession");

        UserInfo userInfo = userService.select_userInfo(loginSession);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("joinCommand", new JoinCommand());
        return "userInfo";
    }

    @PostMapping("/update/userinfo")
    public String update_userInfo(HttpSession session, JoinCommand joinCommand, Errors errors, Model model){

        LoginSession loginSession = (LoginSession) session.getAttribute("loginSession");

        new JoinValidator().validate(joinCommand, errors);

        if (errors.hasErrors()) {
            return "userInfo";
        }

        int result = userService.update_userInfo(joinCommand);

        if (result==0){
            model.addAttribute("result", false);
        }else {
            UserInfo userInfo = userService.select_userInfo(loginSession);
            session.removeAttribute("loginSession");
            loginSession = new LoginSession(userInfo.getId(), userInfo.getName());
            session.setAttribute("loginSession", loginSession);
            model.addAttribute("result", true);
            model.addAttribute("userInfo", userInfo);
        }



        return "userInfo";
    }

}

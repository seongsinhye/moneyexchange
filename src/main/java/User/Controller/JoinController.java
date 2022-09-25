package User.Controller;

import User.Dto.JoinCommand;
import User.Dto.LoginCommand;
import User.Dto.LoginSession;
import User.Dto.NaverLoginBO;
import User.Exception.CantMakeUserInfoException;
import User.Exception.DuplicateUserException;
import User.Exception.UserNotFoundException;
import User.Service.JoinService;
import User.Service.LoginService;
import User.Validator.JoinValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class JoinController {

    @Autowired
    private JoinService joinService;

    public void setJoinService(JoinService joinService) {
        this.joinService = joinService;
    }

    @GetMapping("/join")
    public String view_join_page(Model model) {
        model.addAttribute("joinCommand", new JoinCommand());
        return "join";
    }

    @PostMapping("/join")
    public String fail(Model model) {
        model.addAttribute("joinCommand", new JoinCommand());
        return "join";
    }

    @PostMapping("/join2")
    public String view_join(Model model) {
        model.addAttribute("joinCommand", new JoinCommand());
        return "join2";
    }

    @PostMapping("/join/input")
    public String join_input(Model model, JoinCommand joinCommand, Errors errors) {

        //입력값 검증
        new JoinValidator().validate(joinCommand, errors);
        if (errors.hasErrors()) {
            return "join";
        }

        if (!joinService.idPossibleId(joinCommand.getId())) {
            errors.rejectValue("id", "duplicate");
            return "join";
        } else {

            try {
                //회원가입
                joinService.join(joinCommand);
                return "join_success";

            } catch (CantMakeUserInfoException e) {
                return "join";
            }
        }


    }

    //회원 탈퇴 뷰 보여주기
    @GetMapping("/delete/userInfo/view")
    public String view_deleteUserInfo() {
        return "delete";
    }

    //회원 탈퇴
    @PostMapping("/delete/userInfo")
    public String deleteUserInfo(@RequestParam("pw") String pw, HttpSession session) {

        //세션 정보 가져오기
        LoginSession loginSession = (LoginSession) session.getAttribute("loginSession");

        //삭제에 성공했다면
        if (joinService.delete_userInfo(loginSession.getId(), pw)) {
            //저장된 세션 삭제
            session.removeAttribute("loginSession");
            return "main";  //메인 페이지
        } else {
            return "delete"; //회원 탈퇴 페이지로
        }
    }
}

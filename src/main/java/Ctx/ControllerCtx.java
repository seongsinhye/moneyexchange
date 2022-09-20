package Ctx;

import Controller.*;
import User.Controller.JoinController;
import User.Controller.LoginController;
import User.Controller.UserController;
import User.Dto.NaverLoginBO;
import User.Service.JoinService;
import User.Service.LoginService;
import User.Service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import service.NoticeService;

@Configuration
public class ControllerCtx {


    @Bean
    public ExController exController() {
        return new ExController();
    }

    @Bean
    public AlarmController alarmController() {
        return new AlarmController();
    }

    @Bean
    public CalculatorController calculatorController() {
        return new CalculatorController();
    }

    private LoginService loginService;

    private JoinService joinService;

    private UserService userService;

    @Bean
    public NaverLoginBO naverLoginBO() {
        return new NaverLoginBO();
    }


    @Bean
    public LoginController loginController() {
        LoginController loginController = new LoginController();
        loginController.setLoginService(loginService, naverLoginBO());
        return loginController;
    }

    @Bean
    public JoinController joinController() {
        JoinController joinController = new JoinController();
        joinController.setJoinService(joinService);
        return joinController;
    }

    @Bean
    public UserController userController() {
        UserController userController = new UserController();
        userController.setUserService(userService);
        return userController;
    }

    @Bean
    public ExchangeController exchangeController() {
        return new ExchangeController();
    }

    private NoticeService noticeService;
    @Bean
    public NoticeController noticeController() {
        return new NoticeController(noticeService);
    }
}

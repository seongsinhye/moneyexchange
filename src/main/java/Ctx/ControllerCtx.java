package Ctx;

import Etc.ExController;
import User.Controller.JoinController;
import User.Controller.LoginController;
import User.Controller.UserController;
import User.Dto.NaverLoginBO;
import User.Service.JoinService;
import User.Service.LoginService;
import User.Service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ControllerCtx {

    @Bean
    public ExController exController() {
        return new ExController();
    }

    private LoginService loginService;

    private JoinService joinService;

    private UserService userService;

    @Bean
    public NaverLoginBO naverLoginBO(){
        return new NaverLoginBO();
    }


    @Bean
    public LoginController loginController(){
        LoginController loginController = new LoginController();
        loginController.setLoginService(loginService, naverLoginBO());
        return loginController;
    }

    @Bean
    public JoinController joinController(){
        JoinController joinController = new JoinController();
        joinController.setJoinService(joinService);
        return joinController;
    }

    @Bean
    public UserController userController(){
        UserController userController = new UserController();
        userController.setUserService(userService);
        return userController;
    }






}

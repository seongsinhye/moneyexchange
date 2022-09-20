package Ctx;

import Controller.*;
import dao.NoticeDao;
import org.apache.tomcat.jdbc.pool.DataSource;
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

    @Bean(destroyMethod = "close")
    public DataSource dataSource() {
        DataSource ds = new DataSource();

        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/moneyExchange");
        ds.setUsername("root");
        ds.setPassword("vldksh1207!");

        return ds;
    }



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

    private NoticeService noticeService;

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
        joinController.setJoinController(joinService);
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

    @Bean
    public NoticeController noticeController() {
        return new NoticeController(noticeService);
    }
}

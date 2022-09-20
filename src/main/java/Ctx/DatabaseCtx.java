
package Ctx;

import dao.NoticeDao;
import User.Dao.MemberInfo_tb_Dao;
import User.Service.JoinService;
import User.Service.LoginService;
import User.Service.UserService;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import service.NoticeService;

@Configuration
public class DatabaseCtx {

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
    public PlatformTransactionManager transactionManager(){
        DataSourceTransactionManager tm = new DataSourceTransactionManager();
        tm.setDataSource(dataSource());
        return tm;
    }


    @Bean
    public NoticeDao noticeDao() {
        return new NoticeDao(dataSource());
    }

    @Bean
    public NoticeService noticeService() {
        NoticeService noticeService = new NoticeService();
        noticeService.setNoticeDao(noticeDao());

        return noticeService;
    }

    @Bean
    public MemberInfo_tb_Dao memberInfo_tb_dao(){
        return new MemberInfo_tb_Dao(dataSource());
    }

    @Bean
    public JoinService joinService(){
        JoinService joinService = new JoinService();
        joinService.setMemberInfo_tb_dap(memberInfo_tb_dao());
        return joinService;
    }
    @Bean
    public LoginService loginService(){
        LoginService loginService = new LoginService();
        loginService.setMemberInfo_tb_dap(memberInfo_tb_dao());
        return loginService;
    }
    @Bean
    public UserService userService(){
        UserService userService = new UserService();
        userService.setMemberInfo_tb_dap(memberInfo_tb_dao());
        return userService;
    }


}

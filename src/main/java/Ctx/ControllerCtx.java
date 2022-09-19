package Ctx;

import Controller.*;
import dao.NoticeDao;
import org.apache.tomcat.jdbc.pool.DataSource;
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
    public NoticeDao noticeDao(){
        return new NoticeDao(dataSource());
    }

    @Bean
    public NoticeService noticeService(){
        NoticeService noticeService = new NoticeService();
        noticeService.setNoticeDao(noticeDao());

        return  noticeService;
    }

    @Bean
    public ExController exController() {
        return new ExController();
    }

    @Bean
    public AlarmController alarmController(){ return new AlarmController();}

    @Bean
    public CalculatorController calculatorController(){return new CalculatorController();}


    @Bean
    public ExchangeController exchangeController(){return new ExchangeController();}

    @Bean
    public NoticeController noticeController(){return new NoticeController(noticeService());}
}

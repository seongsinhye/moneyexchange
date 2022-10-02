
package Ctx;

import Controller.AlarmController;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@EnableScheduling
@Configuration
public class messageCtx {

    @Scheduled(cron = "0 37 11,13,14,17 1-6")// 이 어노테이션을 동작하기를 원하는 메소드 위에 선언
    public void testMethod(){
        AlarmController alarmController = new AlarmController();
        //alarmController.message_test();
        System.out.println("message_test");
    }
}



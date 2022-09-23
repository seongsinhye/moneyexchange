package Ctx;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class TimeCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{

        LocalDateTime todayPt12 = LocalDate.now().atTime(00,00, 00, 00);
        LocalDateTime todayAt11 = LocalDate.now().atTime(11,00, 00, 00);
        LocalDateTime now = LocalDateTime.parse(LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm")));

        LocalDate currentDate = LocalDate.now();
        DayOfWeek dayOfWeek = currentDate.getDayOfWeek();
        int dayOfWeekNumber = dayOfWeek.getValue();

        if(dayOfWeekNumber==6||dayOfWeekNumber==7||
                (todayPt12.isBefore(now) && now.isBefore(todayAt11))
        ){
            return false;
        }else {

            response.sendRedirect(request.getContextPath() + "/main");
            return true;
        }


    }
}

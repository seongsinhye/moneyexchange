package Ctx;

import Controller.AlarmController;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


@Configuration
@EnableWebMvc
public class MvcCtx implements WebMvcConfigurer {

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/view/", ".jsp");
    }



    @Override
    public void addInterceptors(InterceptorRegistry registry){

        registry.addInterceptor(loginCheckInterceptor())
                .addPathPatterns("/pay")
                .excludePathPatterns("");

        registry.addInterceptor(timeCheckInterceptor())
                .addPathPatterns("*")
                .excludePathPatterns("/main", "/login", "join", "/join/input", "join2", "/delete/userInfo/view", "/delete/userInfo",
                        "/login", "/logout", "/login/self", "/login_success", "/login/oauth_kakao", "/userinfo", "/update/userinfo");

    }

    @Bean
    public LoginCheckInterceptor loginCheckInterceptor(){
        return new LoginCheckInterceptor();
    }

    @Bean
    public TimeCheckInterceptor timeCheckInterceptor(){
        return new TimeCheckInterceptor();
    }


    @Bean
    public MessageSource messageSource(){
        ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
        ms.setBasename("message.label_ko");
        ms.setDefaultEncoding("UTF-8");

        return ms;
    }

    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver mr = new CommonsMultipartResolver();
        mr.setMaxInMemorySize(52428800);
        mr.setDefaultEncoding("utf-8");
        return mr;
    }

}
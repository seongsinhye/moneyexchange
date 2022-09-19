package User.Validator;

import User.Dto.JoinCommand;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class JoinValidator implements Validator {

    private static final String user_pwRegExp =
            "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z[0-9]$@$!%*#?&]{8,20}$";

    private Pattern pattern;

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object target, Errors errors) {

        JoinCommand joinCommand = (JoinCommand) target;

        if(joinCommand.getPw()==null){
            errors.reject("pw", "required");
        }else {
            pattern = Pattern.compile(user_pwRegExp);
            Matcher matcher = pattern.matcher(joinCommand.getPw_check());

            if(!matcher.matches()){
                errors.reject("pw", "bad");
            }

            int length = joinCommand.getPw().length();

            if(length < 8 || 20 < length ){
                System.out.println("pw param error");
                errors.rejectValue("pw", "bad");
            }


        }

        if(!joinCommand.getPw_check().equals(joinCommand.getPw())){
            System.out.println("pw not equal");
            errors.rejectValue("pw_check", "not_equal");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pw", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pw_check", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel", "required");


    }
}

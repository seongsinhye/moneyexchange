package User.Validator;

import dto.AlarmCommand;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AlarmValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return AlarmCommand.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"user_name","required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"tel","required");


    }
}

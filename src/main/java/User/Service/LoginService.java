package User.Service;

import User.Dao.MemberInfo_tb_Dao;
import User.Dto.JoinCommand;
import User.Dto.LoginCommand;
import User.Dto.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private MemberInfo_tb_Dao memberInfo_tb_dao;

    public void setMemberInfo_tb_dap(MemberInfo_tb_Dao memberInfo_tb_dao){
        this.memberInfo_tb_dao = memberInfo_tb_dao;
    }

    //로그인
    public UserInfo loginService(LoginCommand loginCommand){
        UserInfo userInfo = memberInfo_tb_dao.loginCheck(loginCommand);
        return userInfo;
    }



    //사용가능한 아이디인지 판단
    public boolean idPossibleId(String id){
        return memberInfo_tb_dao.check_id(id);
    }

    //회원 가입하기
    public void join(JoinCommand joinCommand){
        memberInfo_tb_dao.insert(joinCommand);
    }

}

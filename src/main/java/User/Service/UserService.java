package User.Service;

import User.Dao.MemberInfo_tb_Dao;
import User.Dto.JoinCommand;
import User.Dto.LoginSession;
import User.Dto.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private MemberInfo_tb_Dao memberInfo_tb_dao;

    public void setMemberInfo_tb_dap(MemberInfo_tb_Dao memberInfo_tb_dao){
        this.memberInfo_tb_dao = memberInfo_tb_dao;
    }

    public UserInfo select_userInfo(LoginSession loginSession){
        return memberInfo_tb_dao.select_userinfo(loginSession);
    }

    public void update_userInfo(JoinCommand joinCommand){
        memberInfo_tb_dao.update_userInfo(joinCommand);
    }
}

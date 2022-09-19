package User.Service;

import User.Dao.MemberInfo_tb_Dao;
import User.Dto.JoinCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {

    @Autowired
    private MemberInfo_tb_Dao memberInfo_tb_dao;

    public void setMemberInfo_tb_dap(MemberInfo_tb_Dao memberInfo_tb_dao){
        this.memberInfo_tb_dao = memberInfo_tb_dao;
    }

    public boolean idPossibleId(String id){
        return memberInfo_tb_dao.check_id(id);
    }
    public void join(JoinCommand joinCommand){
        memberInfo_tb_dao.insert(joinCommand);
    }

    public boolean delete_userInfo(String id, String pw){
        return memberInfo_tb_dao.DeleteUserInfo(id, pw);
    }
}

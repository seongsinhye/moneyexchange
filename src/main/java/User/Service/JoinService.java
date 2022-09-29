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

    //사용가능한 아이디인지 판단
    public boolean idPossibleId(String id){
        return memberInfo_tb_dao.check_id(id);
    }

    //회원 가입하기
    public void join(JoinCommand joinCommand){
        memberInfo_tb_dao.insert(joinCommand);
    }

    //회원 탈퇴하기
    public boolean delete_userInfo(String id, String pw){
        return memberInfo_tb_dao.DeleteUserInfo(id, pw);
    }


    //사용자 정보 수정
    public int update_userInfo(JoinCommand joinCommand){
        return memberInfo_tb_dao.update_userInfo(joinCommand);
    }
}

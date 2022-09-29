package User.Dao;

import User.Dto.JoinCommand;
import User.Dto.LoginCommand;
import User.Dto.LoginSession;
import User.Dto.UserInfo;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberInfo_tb_Dao {

    private JdbcTemplate jdbcTemplate;

    public MemberInfo_tb_Dao(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    //로그인(사용자 정보 조회)
    public UserInfo loginCheck(LoginCommand loginCommand){
        String sql = "SELECT * FROM memberInfo_1 WHERE id=? AND pw=?";
        List<UserInfo> results = jdbcTemplate.query(sql, new MemberInfo_tb_Mapper(), loginCommand.getId(), loginCommand.getPw());

        return results.isEmpty() ? null : results.get(0);
    }

    //세션을 사용한 사용자 정보 조회
    public UserInfo select_userinfo(LoginSession loginSession){
        String sql = "SELECT * FROM memberInfo_1 WHERE id=?";
        List<UserInfo> results = jdbcTemplate.query(sql, new MemberInfo_tb_Mapper(), loginSession.getId());
        return results.isEmpty() ? null : results.get(0);
    }

    //사용자 정보 등록(회원가입)
    public void insert(JoinCommand joinCommand){
        String sql = "INSERT INTO memberInfo_1 (id, user_name, tel, addr, pw) VALUES " +
                "(?,?,?,?,?)";
        jdbcTemplate.update(sql, joinCommand.getId(), joinCommand.getName(), joinCommand.getTel(), joinCommand.getAddr(),
                joinCommand.getPw());
    }

    //이미 등록된 아이디인지 체크
    public Boolean check_id(String id){
        String sql = "SELECT * FROM memberInfo_1 WHERE id=?";
        List<UserInfo> results = jdbcTemplate.query(sql, new MemberInfo_tb_Mapper(), id);

        //등록되지 않았으면 사용가능(true), 되어있으면 사용 불가능(false) 반환
        return results.isEmpty() ? true : false;
    }

    //해당 아이디, 비밀번호로 조회된 사용자 정보 삭제
    public boolean DeleteUserInfo(String id, String pw){
        String sql = "DELETE FROM memberInfo_1 WHERE id=? AND pw=?";
        int result = jdbcTemplate.update(sql, id, pw);

        if(result!=0){
            return true;
        }else {
            return false;
        }
    }

    //사용자 정보 업데이트
    public int update_userInfo(JoinCommand joinCommand){
        String sql = "UPDATE memberInfo_1 SET pw=?, user_name=?, tel=?, addr=? WHERE id=?";
        int result = jdbcTemplate.update(sql, joinCommand.getPw(), joinCommand.getName(), joinCommand.getTel(),
                joinCommand.getAddr(),joinCommand.getId());

        return result;

    }
}

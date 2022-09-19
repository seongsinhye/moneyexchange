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

    public UserInfo loginCheck(LoginCommand loginCommand){
        String sql = "SELECT * FROM memberInfo WHERE id=? AND pw=?";
        List<UserInfo> results = jdbcTemplate.query(sql, new MemberInfo_tb_Mapper(), loginCommand.getId(), loginCommand.getPw());

        return results.isEmpty() ? null : results.get(0);
    }

    public UserInfo select_userinfo(LoginSession loginSession){
        String sql = "SELECT * FROM memberInfo WHERE id=?";
        List<UserInfo> results = jdbcTemplate.query(sql, new MemberInfo_tb_Mapper(), loginSession.getId());

        return results.isEmpty() ? null : results.get(0);
    }


    public void insert(JoinCommand joinCommand){
        String sql = "INSERT INTO memberInfo (id, user_name, tel, addr, pw) VALUES " +
                "(?,?,?,?,?)";
        jdbcTemplate.update(sql, joinCommand.getId(), joinCommand.getName(), joinCommand.getTel(), joinCommand.getAddr(),
                joinCommand.getPw());
    }

    public Boolean check_id(String id){
        String sql = "SELECT * FROM memberInfo WHERE id=?";
        List<UserInfo> results = jdbcTemplate.query(sql, new MemberInfo_tb_Mapper(), id);

        return results.isEmpty() ? true : false;
    }

    public boolean DeleteUserInfo(String id, String pw){
        String sql = "DELETE FROM memberInfo WHERE id=? AND pw=?";
        int result = jdbcTemplate.update(sql, id, pw);

        if(result!=0){
            return true;
        }else {
            return false;
        }
    }

    public void update_userInfo(JoinCommand joinCommand){
        String sql = "UPDATE memberInfo SET pw=?, user_name=?, tel=?, addr=? WHERE id=?";
        jdbcTemplate.update(sql, joinCommand.getPw(), joinCommand.getName(), joinCommand.getTel(),
                joinCommand.getAddr());

    }
}

package User.Dao;

import User.Dto.UserInfo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberInfo_tb_Mapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {

        Integer memberIdx = resultSet.getInt("memberIdx");
        String id = resultSet.getString("id");
        String name = resultSet.getNString("user_name");
        String tel = resultSet.getString("tel");
        String addr = resultSet.getString("addr");
        String pw = resultSet.getString("pw");

        UserInfo userInfo = new UserInfo(memberIdx,id, pw, name, tel, addr);

        return userInfo;
    }
}

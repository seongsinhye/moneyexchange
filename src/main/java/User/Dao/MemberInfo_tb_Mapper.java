package User.Dao;

import User.Dto.UserInfo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberInfo_tb_Mapper implements RowMapper {
    @Override
    public Object mapRow(ResultSet resultSet, int i) throws SQLException {


        String id = resultSet.getString("id");
        String name = resultSet.getNString("user_name");
        String tel = resultSet.getString("tel");
        String addr = resultSet.getString("addr");
        String pw = resultSet.getString("pw");
        Boolean sns = resultSet.getBoolean("sns");


        UserInfo userInfo = new UserInfo(id, pw, name, tel, addr, sns);

        return userInfo;
    }
}

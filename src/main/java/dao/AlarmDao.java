package dao;
import dto.AlarmCommand;
import dto.NoticeInfo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class AlarmDao {


    private JdbcTemplate jdbcTemplate;

    public AlarmDao(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public void add(AlarmCommand alarmCommand){

        jdbcTemplate.update("INSERT INTO alarm(user_name, tel, exchangeTime, ac, exchangeType) values (?,?,?,?,?)",
                alarmCommand.getUser_name(), alarmCommand.getTel(), alarmCommand.getExchangeTime(), alarmCommand.getAc(), alarmCommand.getType());
    }

    public  List<AlarmCommand> select(AlarmCommand alarmCommand){
        String sql = "SELECT * from alarm WHERE user_name = ? AND tel = ? ";

        List<AlarmCommand> results =  jdbcTemplate.query(sql, new RowMapper<AlarmCommand>() {
            @Override
            public AlarmCommand mapRow(ResultSet rs, int rowNum) throws SQLException {

                Integer idx = rs.getInt("alarmIdx");
                String exchangeTime = rs.getString("exchangeTime");
                String ac = rs.getString("ac");
                String exchangeType = rs.getString("exchangeType");

                String user_name = alarmCommand.getUser_name();
                String tel = alarmCommand.getTel();

                AlarmCommand alarmCommand = new AlarmCommand(idx, user_name,tel, exchangeType, ac, exchangeTime);


                return alarmCommand;
            }

        },alarmCommand.getUser_name(),alarmCommand.getTel() );

        return results.isEmpty() ? null : results;

    }

    public void delete(int idx){
        String sql = "DELETE FROM alarm WHERE alarmIdx = ?";

        jdbcTemplate.update(sql, idx);


    }



}

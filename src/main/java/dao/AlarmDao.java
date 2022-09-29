package dao;
import dto.AlarmCommand;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class AlarmDao {


    private JdbcTemplate jdbcTemplate;

    public AlarmDao(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public void add(AlarmCommand alarmCommand){

        jdbcTemplate.update("INSERT INTO alarm(user_name, tel, exchangeTime, ac, type) values (?,?,?,?,?)",
                alarmCommand.getUser_name(), alarmCommand.getTel(), alarmCommand.getExchangeTime(), alarmCommand.getAc(), alarmCommand.getType());
    }
}

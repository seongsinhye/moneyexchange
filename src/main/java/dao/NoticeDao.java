package dao;

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
public class NoticeDao {


    private JdbcTemplate jdbcTemplate;

    public NoticeDao(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public void insert(NoticeInfo noticeInfo, String file){

        jdbcTemplate.update("INSERT INTO notice(noticeTitle, noticeContent,noticeWriter, fileName) values (?,?,?,?)",
                noticeInfo.getNoticeTitle(), noticeInfo.getNoticeContent(), noticeInfo.getNoticeWriter(), file);
    }

    public List<NoticeInfo> selectAll(int start) {
        String sql = "SELECT * from notice ORDER BY noticeInsertDate DESC LIMIT ?, 10";

        List<NoticeInfo> results = jdbcTemplate.query(sql, new RowMapper<NoticeInfo>() {

            @Override
            public NoticeInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                int noticeIdx = rs.getInt("noticeIdx");
                String noticeTitle = rs.getString("noticeTitle");
                String noticeContent = rs.getString("noticeContent");
                String noticeWriter = rs.getString("noticeWriter");
                LocalDateTime noticeInsertDate = rs.getTimestamp("noticeInsertDate").toLocalDateTime();



                NoticeInfo noticeInfo =new NoticeInfo(noticeIdx, noticeTitle, noticeContent, noticeWriter, noticeInsertDate);


                return noticeInfo;
            }

        }, start);

        return results.isEmpty() ? null : results;
    }


    public NoticeInfo selectNotice(int noticeIdx) {
        String sql = "SELECT * from notice WHERE noticeIdx = ?";

        List<NoticeInfo> results = jdbcTemplate.query(sql, new RowMapper<NoticeInfo>() {

            @Override
            public NoticeInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
                int noticeIdx = rs.getInt("noticeIdx");
                String noticeTitle = rs.getString("noticeTitle");
                String noticeContent = rs.getString("noticeContent");
                String noticeWriter = rs.getString("noticeWriter");
                LocalDateTime noticeInsertDate = rs.getTimestamp("noticeInsertDate").toLocalDateTime();
                String fileName = rs.getString("fileName");


                NoticeInfo noticeInfo =new NoticeInfo(fileName, noticeIdx, noticeTitle, noticeContent, noticeWriter, noticeInsertDate);


                return noticeInfo;
            }

        }, noticeIdx);

        return results.isEmpty() ? null : results.get(0);
    }

    public int getAmount(){

        int count = 0;

        count = jdbcTemplate.queryForObject("SELECT COUNT(*) AS amount FROM notice", Integer.class);

        return count;
    }

    public void updateNotice(NoticeInfo noticeInfo){
        jdbcTemplate.update("UPDATE notice SET noticeTitle = ?, noticeContent = ?, fileName=? WHERE noticeIdx = ?",
                noticeInfo.getNoticeTitle(), noticeInfo.getNoticeContent(), noticeInfo.getNoticeIdx(), noticeInfo.getFileName());


    }

    public void noticeDelete(int noticeIdx){
        jdbcTemplate.update("DELETE FROM notice WHERE noticeIdx = ?", noticeIdx);
    }





}

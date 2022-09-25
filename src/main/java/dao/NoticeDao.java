package dao;

import dto.NoticeInfo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.lang.reflect.Member;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

@Repository
public class NoticeDao {

    private JdbcTemplate jdbcTemplate;

    public NoticeDao(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    //공지사항 삭제
    public void insert(NoticeInfo noticeInfo){
        jdbcTemplate.update("INSERT INTO notice(noticeTitle, noticeContent,noticeWriter) values (?,?,?)",
                noticeInfo.getNoticeTitle(), noticeInfo.getNoticeContent(), noticeInfo.getNoticeWriter());
    }

    //전체 공지사항 내역 조회
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


    //공지사항 상세 내역 조회
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


                NoticeInfo noticeInfo =new NoticeInfo(noticeIdx, noticeTitle, noticeContent, noticeWriter, noticeInsertDate);


                return noticeInfo;
            }

        }, noticeIdx);

        return results.isEmpty() ? null : results.get(0);
    }

    //공지사항 갯수 조회
    public int getAmount(){

        int count = 0;

        count = jdbcTemplate.queryForObject("SELECT COUNT(*) AS amount FROM notice", Integer.class);

        return count;
    }

    //공지사항 수정
    public void updateNotice(NoticeInfo noticeInfo){
        jdbcTemplate.update("UPDATE notice SET noticeTitle = ?, noticeContent = ? WHERE noticeIdx = ?",
                noticeInfo.getNoticeTitle(), noticeInfo.getNoticeContent(), noticeInfo.getNoticeIdx());


    }

    //공지사항 삭제
    public void noticeDelete(int noticeIdx){
        jdbcTemplate.update("DELETE FROM notice WHERE noticeIdx = ?", noticeIdx);
    }





}

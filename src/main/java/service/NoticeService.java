package service;

import com.mysql.cj.protocol.x.Notice;
import dao.NoticeDao;
import dto.NoticeInfo;

import java.time.LocalDate;
import java.util.List;

public class NoticeService {

    private NoticeDao noticeDao;

    public void setNoticeDao(NoticeDao noticeDao) {
        this.noticeDao = noticeDao;
    }

    public void add(NoticeInfo noticeInfo) {

        NoticeInfo newNotcie = new NoticeInfo(noticeInfo.getNoticeTitle(), noticeInfo.getNoticeContent(), noticeInfo.getNoticeWriter());


        noticeDao.insert(newNotcie);

    }

    public int getAmount() {
        int amount = noticeDao.getAmount();

        return amount;
    }

    public List<NoticeInfo> getNoticeInfoList(int pageNumber) {
        pageNumber = (pageNumber - 1) * 10;


        List<NoticeInfo> noticeInfoList = noticeDao.selectAll(pageNumber);

        return noticeInfoList;

    }

    public NoticeInfo getNoticeInfo(int noticeIdx) {

        NoticeInfo noticeInfo = noticeDao.selectNotice(noticeIdx);

        return noticeInfo;
    }

    public void getNewNoticeInfo(NoticeInfo noticeInfo) {

        noticeDao.updateNotice(noticeInfo);

    }

    public void noticeDelete(int noticeIdx) {
        noticeDao.noticeDelete(noticeIdx);
    }

}

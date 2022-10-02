package service;



import dto.NoticeInfo;
import dao.NoticeDao;

import java.io.IOException;
import java.util.List;

public class NoticeService {

    private NoticeDao noticeDao;

    public void setNoticeDao(NoticeDao noticeDao){
        this.noticeDao = noticeDao;
    }

    //공지사항 추가
    public void add(NoticeInfo noticeInfo, String file) throws IOException {

        NoticeInfo newNotice = new NoticeInfo(noticeInfo.getNoticeTitle(), noticeInfo.getNoticeContent(), noticeInfo.getNoticeWriter());
        noticeDao.insert(newNotice, file);

    }

    //공지사항 갯수 조회
    public int getAmount(){
        int amount =  noticeDao.getAmount();
        return amount;
    }

    //해당 페이지 넘버에 맞는 공지사항 내역 조회
    public List<NoticeInfo> getNoticeInfoList(int pageNumber){
        pageNumber = (pageNumber - 1) * 10;
        List<NoticeInfo> noticeInfoList =  noticeDao.selectAll(pageNumber);
        return noticeInfoList;
    }

    //공지사항 상세 내역 조회
    public NoticeInfo getNoticeInfo(int noticeIdx){
        NoticeInfo noticeInfo = noticeDao.selectNotice(noticeIdx);
        return noticeInfo;
    }

    //공지사항 수정
    public void getNewNoticeInfo(NoticeInfo noticeInfo){
        noticeDao.updateNotice(noticeInfo);
    }

    //공지사항 삭제
    public void noticeDelete(int noticeIdx){
        noticeDao.noticeDelete(noticeIdx);
    }

}

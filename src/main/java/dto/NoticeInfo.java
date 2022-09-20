package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class NoticeInfo {

    public NoticeInfo(int noticeIdx, String noticeTitle, String noticeContent, String noticeWriter, LocalDateTime noticeInsertDate) {
        this.noticeIdx = noticeIdx;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;
        this.noticeInsertDate = noticeInsertDate;
    }

    public NoticeInfo(int noticeIdx, String noticeTitle, String noticeContent, String noticeWriter) {
        this.noticeIdx = noticeIdx;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;
    }

    public NoticeInfo(){}

    public NoticeInfo(String noticeTitle, String noticeContent) {
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
    }

    public NoticeInfo(String noticeTitle, String noticeContent, String noticeWriter) {
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;

    }

    private int noticeIdx;

    public int getNoticeIdx() {
        return noticeIdx;
    }

    public void setNoticeIdx(int noticeIdx) {
        this.noticeIdx = noticeIdx;
    }

    private String noticeTitle;
    private String noticeContent;
    private String noticeWriter;

    private LocalDateTime noticeInsertDate;

    public LocalDateTime getNoticeInsertDate() {
        return noticeInsertDate;
    }

    public void setNoticeInsertDate(LocalDateTime noticeInsertDate) {
        this.noticeInsertDate = noticeInsertDate;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public String getNoticeWriter() {
        return noticeWriter;
    }

    public void setNoticeWriter(String noticeWriter) {
        this.noticeWriter = noticeWriter;
    }
}

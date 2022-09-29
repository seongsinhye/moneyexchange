package dto;

import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

public class NoticeInfo {

    private String noticeTitle;
    private String noticeContent;
    private String noticeWriter;

    private String fileName;

    private LocalDateTime noticeInsertDate;
    public NoticeInfo(String fileName, int noticeIdx, String noticeTitle, String noticeContent, String noticeWriter, LocalDateTime noticeInsertDate) {
        this.fileName = fileName;
        this.noticeIdx = noticeIdx;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;
        this.noticeInsertDate = noticeInsertDate;
    }

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

    public NoticeInfo(String noticeTitle, String noticeContent, String noticeWriter, String fileName) {
    }

    public MultipartFile getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
    }



    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    private MultipartFile uploadFile;
    private int noticeIdx;

    public int getNoticeIdx() {
        return noticeIdx;
    }

    public void setNoticeIdx(int noticeIdx) {
        this.noticeIdx = noticeIdx;
    }



    public NoticeInfo(int noticeIdx, String noticeTitle, String noticeContent, String noticeWriter, LocalDateTime noticeInsertDate, MultipartFile uploadFile) {
        this.noticeIdx = noticeIdx;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeWriter = noticeWriter;
        this.noticeInsertDate = noticeInsertDate;
        this.uploadFile = uploadFile;
    }


    @Override
    public String toString() {
        return "NoticeInfo{" +
                "fileName='" + fileName + '\'' +
                ", uploadFile=" + uploadFile +
                ", noticeIdx=" + noticeIdx +
                ", noticeTitle='" + noticeTitle + '\'' +
                ", noticeContent='" + noticeContent + '\'' +
                ", noticeWriter='" + noticeWriter + '\'' +
                ", noticeInsertDate=" + noticeInsertDate +
                '}';
    }

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

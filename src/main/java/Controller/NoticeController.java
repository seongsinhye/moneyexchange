package Controller;

import dto.NoticeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.NoticeService;

import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    public NoticeController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }


    //공지사항 조회 후 view 페이지 보여주기
    @GetMapping("/notice")
    public String noticePage(Model model, @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber) {

        //작성글의 갯수 구하기
        int amount = noticeService.getAmount();

        //공지사항 목록 조회하기
        List<NoticeInfo> noticeInfoList = noticeService.getNoticeInfoList(pageNumber);

        model.addAttribute("amount", amount);
        model.addAttribute("noticeInfoList", noticeInfoList);

        return "notice";
    }

    //공지사항 작성 view 페이지 보여주기
    @GetMapping("/notice/form")
    public String list() {
        return "notice_form";
    }

    //공지사항 추가
    @GetMapping("/notice/Add")
    public String noticeAdd(NoticeInfo noticeInfo) {

        //공지사항 추가
        noticeService.add(noticeInfo);
        return "redirect:/notice";
    }

    //공지사항 상세페이지 조회
    @GetMapping("/notice/detail")
    public String noticeDetial(@RequestParam(value = "noticeIdx") int noticeIdx, Model model) {

        //idx로 공지사항 내용 조회하기
        NoticeInfo noticeInfo = noticeService.getNoticeInfo(noticeIdx);

        //model에 담아서 view에 전송하기
        model.addAttribute("noticeInfo", noticeInfo);
        return "notice_detail";
    }

    //공지사항 수정 view 페이지 보여주기
    @GetMapping("/notice/update/page")
    public String noticeUpdatePage(@RequestParam(value = "noticeIdx") int noticeIdx, Model model) {

        //공지사항 내용 조회하기
        NoticeInfo noticeInfo = noticeService.getNoticeInfo(noticeIdx);

        //model에 담아서 전송하기
        model.addAttribute("noticeInfo", noticeInfo);

        return "notice_form";
    }

    //공지사항 수정하기
    @PostMapping("/notice/update")
    public String noticeUpdate(NoticeInfo noticeInfo, Model model) {

        //noticeInfo 커맨드객체에 담긴 정보 저장하기
        noticeService.getNewNoticeInfo(noticeInfo);

        model.addAttribute("noticeInfo", noticeInfo);
        return "notice_detail";
    }

    //공지사항 삭제하기
    @GetMapping("/notice/delete")
    public String noticeDelete(@RequestParam(value = "noticeIdx") int noticeIdx) {

        //공지사항 삭제하기
        noticeService.noticeDelete(noticeIdx);

        return "redirect:/notice";
    }


}

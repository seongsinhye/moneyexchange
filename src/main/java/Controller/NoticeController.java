package Controller;

import Command.AddCommand;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.mysql.cj.protocol.x.Notice;
import dto.NoticeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.NoticeService;

import java.util.Collection;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    public NoticeController(NoticeService noticeService){
        this.noticeService = noticeService;
    }


    @GetMapping("/notice")
    public String noticePage(Model model, @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber ){


        int amount = noticeService.getAmount();


        List<NoticeInfo> noticeInfoList = noticeService.getNoticeInfoList(pageNumber);

        model.addAttribute("amount", amount);
        model.addAttribute("noticeInfoList",noticeInfoList);

        System.out.println("noticeInfoList"+noticeInfoList);
        return "notice";
    }

    @GetMapping("/notice/form")
    public String list(){
        return "notice_form";
    }

    @GetMapping("/notice/Add")
    public String noticeAdd(NoticeInfo noticeInfo) {

        noticeService.add(noticeInfo);
        return "redirect:/notice";
    }

    @GetMapping("/notice/detail")
    public String noticeDetial(@RequestParam(value = "noticeIdx") int noticeIdx, Model model){

       NoticeInfo noticeInfo =  noticeService.getNoticeInfo(noticeIdx);

       model.addAttribute("noticeInfo",noticeInfo);

        return "notice_detail";
    }

    @GetMapping("/notice/update/page")
    public String noticeUpdatePage(@RequestParam(value = "noticeIdx") int noticeIdx, Model model){


        NoticeInfo noticeInfo =  noticeService.getNoticeInfo(noticeIdx);

        model.addAttribute("noticeInfo",noticeInfo);

        return "notice_form";
    }


    @PostMapping("/notice/update")
    public String noticeUpdate(NoticeInfo noticeInfo, Model model){


        noticeService.getNewNoticeInfo(noticeInfo);

        model.addAttribute("noticeInfo", noticeInfo);

        return "notice_detail";
    }

    @GetMapping("/notice/delete")
    public String noticeDelete(@RequestParam(value = "noticeIdx") int noticeIdx){

        noticeService.noticeDelete(noticeIdx);

        System.out.println("noticeIdx " + noticeIdx);
        return "redirect:/notice";
    }









}

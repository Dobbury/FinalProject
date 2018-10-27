package kh.com.a.controller;

import java.util.Date;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.fabric.xmlrpc.base.Data;

import kh.com.a.model.MemDto;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.Param;
import kh.com.a.model.PerformScheduleBBSDto;
import kh.com.a.model.ScheduleBBSDto;
import kh.com.a.service.MusiRecuBBSService;
import kh.com.a.service.PerformCastBBSService;
import kh.com.a.service.PerformScheduleBBSService;
import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.TicketService;

@Controller
public class PerformScheduleBBSController {

	private static final Logger logger = LoggerFactory.getLogger(PerformScheduleBBSController.class);

	@Autowired
	PerformScheduleBBSService performScheduleBBSService;

	@Autowired
	TicketService ticketService;
	
	@Autowired
	MusiRecuBBSService musiRecuBBSService;
	
	@Autowired
	PerformCastBBSService performCastBBSService;
	

	@RequestMapping(value = "addperformschedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addperformschedule(Model model) throws Exception {

		return "redirect:/perform_scheduleslist.do";
	}

	@RequestMapping(value = "perform_scheduleslist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_scheduleslist(Model model, Param param) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduleslist " + new Date());

		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String now = transFormat.format(from);

		model.addAttribute("now", now);

		// paging 처리
		int sn = param.getPageNumber();
		logger.info("PageNumber " + sn);
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();

		param.setStart(start);
		param.setEnd(end);

		// 글 개수
		int totalRecordCount = performScheduleBBSService.getPerformScheduleBBSCount(param);

		List<PerformScheduleBBSDto> list = performScheduleBBSService.getPerformSchedulPagingList(param);

		model.addAttribute("PerformSchedulPagingList", list);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());

		return "perform_scheduleslist.tiles";
	}

	@RequestMapping(value = "perform_scheduledetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_scheduledetail(Model model,int perform_schedule_seq) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduledetail " + new Date());
		
		PerformScheduleBBSDto pDto = performScheduleBBSService.getPerformScheduleBBSDto(perform_schedule_seq);
		MusiRecuBBSDto mDto = musiRecuBBSService.getMusiRecuBBSDetail(pDto.getMusi_recu_seq());
		
		model.addAttribute("performScheduleBBSDto",pDto);
		model.addAttribute("performCastBBSDto",performCastBBSService.getPerformCastInfo(mDto.getPerform_seq()));
		
		return "perform_scheduledetail.tiles";
	}
	
	

	@RequestMapping(value = "perform_schedulewrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_schedulewrite(Model model,int perform_seq) throws Exception {
		logger.info("PerformScheduleBBSController perform_scheduledetail " + new Date());
		
		model.addAttribute("performCastBBSDto",performCastBBSService.getPerformCastInfo(perform_seq));
		
		return "perform_schedulewrite.tiles";
	}
	
	@RequestMapping(value = "perform_schedulewriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String perform_schedulewriteAf(Model model,PerformScheduleBBSDto dto) throws Exception {
		logger.info("PerformScheduleBBSController perform_schedulewriteAf " + new Date());
		
		
		
		return "redirect:/perform_scheduleslist.do";
	}
}

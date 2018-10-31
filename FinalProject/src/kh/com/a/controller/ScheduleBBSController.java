package kh.com.a.controller;

import java.util.Date;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.fabric.xmlrpc.base.Data;

import kh.com.a.model.MemDto;
import kh.com.a.model.ScheduleBBSDto;
import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.TicketService;


@Controller
public class ScheduleBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleBBSController.class);
	
	@Autowired
	ScheduleBBSService scheduleBBSService;
	
	@Autowired
	TicketService ticketService;
	
	@RequestMapping(value="schedule.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String schedule(Model model) throws Exception{
	
		logger.info("schedulecontroller schedule" + new Data());
		List<ScheduleBBSDto> bbslist = scheduleBBSService.getScheduleList(); 
		
		model.addAttribute("schedulelist",bbslist);
		
		return "schedule.tiles";
	}
	
	// AddSchedule.jsps
	@RequestMapping(value="AddSchedule.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String AddSchedule()
	{
		logger.info("schedulecontroller AddSchedule" + new Data());
		return "AddSchedule.tiles";
	}
	// 디테일 (임시)
	@RequestMapping(value="scheduleDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String scheduleDetail()
	{
		logger.info("schedulecontroller scheduleDetail" + new Data());
		return "scheduleDetail.tiles";
	}
	
	@RequestMapping(value="AddScheduleAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String AddScheduleAf(ScheduleBBSDto bbs)throws Exception
	{
		logger.info("schedulecontroller AddSchedule" + new Data());
		System.out.println(bbs.toString());
		scheduleBBSService.wirteBbs(bbs);
		System.out.println(bbs.toString());
		return "redirect:/schedule.do";
	}

	
	
}

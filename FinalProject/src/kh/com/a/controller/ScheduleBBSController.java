package kh.com.a.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.TicketService;


@Controller
public class ScheduleBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleBBSController.class);
	
	@Autowired
	ScheduleBBSService scheduleBBSService;
	
	@Autowired
	TicketService ticketService;
	
	@RequestMapping(value="calendar.do", method=RequestMethod.GET)
	public String calendarBbs() {
		
		logger.info("ScheduleBBSController calendarBbs" + new Date());
		
		return "calendar.tiles";
	}
	
	
}

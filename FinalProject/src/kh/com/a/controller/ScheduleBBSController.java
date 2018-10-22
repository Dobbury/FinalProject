package kh.com.a.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.MemDto;
import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.TicketService;


@Controller
public class ScheduleBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleBBSController.class);
	
	@Autowired
	ScheduleBBSService scheduleBBSService;
	
	@Autowired
	TicketService ticketService;
	

}

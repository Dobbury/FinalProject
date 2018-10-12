package kh.com.a.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.service.MemService;


@Controller
public class MemController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemController.class);
	
	@Autowired
	MemService memberService;
	
	@RequestMapping(value="main.do",method=RequestMethod.GET)
	public String mainView() {
		logger.info("KhMemberController login "+ new Date());
		
		return "main.tiles";
	}
}

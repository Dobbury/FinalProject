package kh.com.a.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.MemDto;
import kh.com.a.model.ScheduleBBSDto;
import kh.com.a.model.VideoBBSDto;
import kh.com.a.service.MemService;
import kh.com.a.service.ScheduleBBSService;
import kh.com.a.service.VideoBBSService;


@Controller
public class MemController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemController.class);
	
	@Autowired
	MemService memberService;
	
	@Autowired
	VideoBBSService videoBbsService;
	
	@Autowired
	ScheduleBBSService scheduleBbsService;
	
	@RequestMapping(value="main.do",method=RequestMethod.GET)
	public String mainView(HttpServletRequest req, HttpServletResponse rep, Model model) {
		logger.info("KhMemberController mainView"+ new Date());
		
		List<VideoBBSDto> videoRank = null;
		List<ScheduleBBSDto> ComingSchedule = null;
		List<ScheduleBBSDto> IngSchedule = null;
		
		videoRank = videoBbsService.getVideoForUser();
		ComingSchedule = scheduleBbsService.getComingSchedule();
		IngSchedule = scheduleBbsService.getIngSchedule();
		
		model.addAttribute("videoList", videoRank);
		model.addAttribute("ComingList", ComingSchedule);
		model.addAttribute("IngList", IngSchedule);
		/*model.addAttribute("login", login);*/
		
		return "main.tiles";
	}
	
	@RequestMapping(value="aboutus.do", method=RequestMethod.GET)
	public String aboutusPage() {
		logger.info("KhMemberController aboutus" + new Date());
		
		return "aboutus.tiles";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginPage() {
		logger.info("KhMemberController login" + new Date());
		
		return "login.tiles";
	}
	
	@RequestMapping(value="loginAf.do", method=RequestMethod.GET)
	public String loginAf(HttpServletRequest req, HttpServletResponse rep, MemDto mem) throws IOException{
		logger.info("KhMemberController loginAf" + new Date());
		
		MemDto login = null;
		// login을 DB 확인
		//login = memberService.login(mem);
		PrintWriter out;
		
		
		login = new MemDto("testTN", "testId", "testPwd", "testName", "01020233808", "yuns0316@gmail.com", "Rock", "Seoul", 890209, "IMG", "Vocal", 1, 1, 1, "M", 1);
		
		if(login != null && !login.getId().equals("")) {
			
			req.getSession().setAttribute("login", login);
			
			return "redirect:/main.do";			
		}else {
			req.getSession().invalidate();
			
			out = rep.getWriter();
			out.println("로그인 아이디 또는 비밀번호가 일치하지 않습니다"); 
			out.close();
		 						
			return "login.tiles";
		//	return "forward:/login.do";
		}
		
	}
	
	
}

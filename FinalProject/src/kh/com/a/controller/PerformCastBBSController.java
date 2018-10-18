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
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.service.PerformCastBBSService;


@Controller
public class PerformCastBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(PerformCastBBSController.class);
	
	@Autowired
	PerformCastBBSService performCastBBSService;
	
	@RequestMapping(value="contact.do", method=RequestMethod.GET)
	public String contactPage() {
		
		logger.info("PerformCastBbsController Contact" + new Date());
		
		return "contact.tiles";
	}
	
	
	@RequestMapping(value="castSchedule.do", method={RequestMethod.GET,RequestMethod.POST})
	public String castSchedule(HttpServletRequest req, HttpServletResponse resp,PerformCastBBSDto dto, Model model) throws Exception {
		
		//req.setCharacterEncoding("UTF-8");
		
		if (dto != null) {
			System.out.println("이름="+dto.getName());
			System.out.println("회사="+dto.getCompname());
			System.out.println("이메일="+dto.getEmail());
			System.out.println("지역="+dto.getLocation());
			System.out.println("주소="+dto.getPlace());
			System.out.println("폰="+dto.getPhone());
			System.out.println("횟수="+dto.getTotalcount());
			System.out.println("콘텐트="+dto.getContent());
			System.out.println("가격="+dto.getPrice());
		}
		
		String agegrade[] = new String[6];
		String temp = new String();
		if (agegrade != null) {
			
			for (int i = 0; i < agegrade.length; i++) {
				agegrade = req.getParameterValues("agegrade");
				System.out.println(agegrade[i]);
				temp += (agegrade[i]);
				if (i < agegrade.length-1) {
					temp += ("/");
				}else break;
				
			}
		}
		dto.setAgegrade(temp);
		System.out.println(dto.toString());
		performCastBBSService.sendCompInfo(dto);
	
		return "redirect:/contact.do";  
	}
	
	@RequestMapping(value="castbbs.do", method=RequestMethod.GET)
	public String getCastbbs(Model model) {
		
		List<PerformCastBBSDto> castbbslist = performCastBBSService.getCastBbs();
		
		model.addAttribute("bbslist", castbbslist);
		if (castbbslist != null) {
			for (int i = 0; i < castbbslist.size(); i++) {
				System.out.println(castbbslist.get(i).toString());
			}
		}else {
			System.out.println("its null");
		}
		return "castbbs.tiles";
	}
	
	
}

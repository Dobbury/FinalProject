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

import kh.com.a.model.LocationDto;
import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.service.LocationService;
import kh.com.a.service.PerformCastBBSService;


@Controller
public class PerformCastBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(PerformCastBBSController.class);
	
	@Autowired
	PerformCastBBSService performCastBBSService;
	
	@Autowired
	LocationService locationService;
	
	@RequestMapping(value="contact.do", method=RequestMethod.GET)
	public String contactPage(Model model) {
		
		logger.info("PerformCastBbsController Contact" + new Date());
		
		/*model.addAttribute("locationList",locationService.getLocationList());*/
		List<LocationDto> locationList = locationService.getLocationList();
		model.addAttribute("locationList", locationList);
		
		return "contact.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="moreList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public List<PerformCastBBSDto> getMoreList(PerformCastBBSDto dto, Model model) {
		
		List<PerformCastBBSDto> list = performCastBBSService.getMoreList(dto);
		
		model.addAttribute("castbbslist", list);
		return list;
		
	}
	
	
	@RequestMapping(value="castSchedule.do", method={RequestMethod.GET,RequestMethod.POST})
	public String castSchedule(HttpServletRequest req, HttpServletResponse resp,PerformCastBBSDto dto, Model model) throws Exception {
		
		//req.setCharacterEncoding("UTF-8");
		System.out.println("공연섭외:"+dto.toString());
		
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
	
	@ResponseBody
	@RequestMapping(value="approveAf.do", method=RequestMethod.GET)
	public void approveAf(int seq_approve,PerformCastBBSDto dto){
		System.out.println(dto.toString());
		performCastBBSService.approveAf(seq_approve);
		
	}
	
	@RequestMapping(value="castbbs.do", method=RequestMethod.GET)
	public String getCastbbs(Model model) {
		
		List<PerformCastBBSDto> castbbslist = performCastBBSService.getCastBbs();
		
		model.addAttribute("castbbslist", castbbslist);
		
		
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

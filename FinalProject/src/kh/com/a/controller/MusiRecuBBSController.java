package kh.com.a.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.MemDto;
import kh.com.a.service.MusiRecuBBSService;
import kh.com.a.service.PerformCastBBSService;


@Controller
public class MusiRecuBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(MusiRecuBBSController.class);
	
	@Autowired
	MusiRecuBBSService musiRecuBBSService;
	
	@RequestMapping(value="musireculist.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String musireculist(Model model) {
		logger.info("MusiRecuBBSController musireculist "+ new Date());
		
		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String now = transFormat.format(from);

		model.addAttribute("now",now);
		model.addAttribute("musiRecuList", musiRecuBBSService.getMusiRecuList());
		return "musireculist.tiles";
	}
}

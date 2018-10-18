package kh.com.a.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.service.VideoBBSService;
import kh.com.a.service.Video_CommentService;


@Controller
public class VideoBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(VideoBBSController.class);
	
	@Autowired
	VideoBBSService videoBBSService;
	
	@Autowired
	Video_CommentService video_CommentService;
	
	@RequestMapping(value="videoBbs.do", method=RequestMethod.GET)
	public String videoBbs() {
		
		return "videoBbs.tiles";
	}
	
	
	
}

package kh.com.a.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.a.model.BbsDto;
import kh.com.a.model.MemDto;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.MusiRecuParam;
import kh.com.a.service.MusiRecuBBSService;
import kh.com.a.service.PerformCastBBSService;

@Controller
public class MusiRecuBBSController {

	private static final Logger logger = LoggerFactory.getLogger(MusiRecuBBSController.class);

	@Autowired
	MusiRecuBBSService musiRecuBBSService;

	@RequestMapping(value = "musireculist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musireculist(Model model,MusiRecuParam param) {
		logger.info("MusiRecuBBSController musireculist " + new Date());

		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String now = transFormat.format(from);

		model.addAttribute("now", now);
		//model.addAttribute("musiRecuList", musiRecuBBSService.getMusiRecuList());

		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();

		param.setStart(start);
		param.setEnd(end);

		// 글 개수
		int totalRecordCount = musiRecuBBSService.getBbsCount(param);

		List<MusiRecuBBSDto> list = musiRecuBBSService.getMusiRecuPagingList(param);

		model.addAttribute("bbslist", list);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
		
		
		return "musireculist.tiles";
	}
}

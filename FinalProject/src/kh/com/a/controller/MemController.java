package kh.com.a.controller;


import java.io.File;
import java.util.HashMap;
import java.util.Map;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.api.Session;


import kh.com.a.arrow.FUpUtil;
import kh.com.a.model.GenreDto;
import kh.com.a.model.LocationDto;
import kh.com.a.model.PositionDto;
import kh.com.a.service.GenreService;
import kh.com.a.service.LocationService;
import kh.com.a.service.PositionService;

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
	LocationService locationService;
	@Autowired
	GenreService genreService;
	@Autowired
	PositionService positionService;
	
	
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
	
	@RequestMapping(value="myPage.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String myPage(Model model) {
		logger.info("MemController myPage "+ new Date());
		
		model.addAttribute("genreList",genreService.getGenreList());
		model.addAttribute("positionList",positionService.getPositionList());
		model.addAttribute("locationList",locationService.getLocationList());
	
		return "mypage.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="login.do",method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String ,Object> login(String id,String pwd,String id_rem, HttpServletResponse resp,HttpSession session) {
		logger.info("MemController login "+ new Date());
		
		Cookie cookie= null;
		
		//아이디 비번 체크
		MemDto dto=memberService.login(id);
		
		Map<String, Object> map = new HashMap<>();

		if(dto == null) {
			map.put("result", "아이디가 없습니다.");
			return map;
		}else if(!dto.getPwd().equals(pwd)) { //비밀번호가 다르다면
			map.put("result", "비밀번호가 틀립니다.");
			return map;
		}
		
		
		map.put("result", "success");
		session.setAttribute("user", dto);
		session.setAttribute("login", dto);
		return map;
	}
	
	@RequestMapping(value="logoff.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String logoff(HttpSession session) {
		logger.info("MemController logoff "+ new Date());
		
		session.invalidate();//모든 세션 삭제
		//session.removeAttribute("login");
		//session.removeValue("user");
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="regi.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String regi(Model model) {
		logger.info("MemController regi "+ new Date());
		
		model.addAttribute("genreList",genreService.getGenreList());
		model.addAttribute("positionList",positionService.getPositionList());
		model.addAttribute("locationList",locationService.getLocationList());
		
		return "regi.tiles";
	}
	
	@RequestMapping(value="generalregi.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String generalregi(MemDto dto) {
		logger.info("MemController generalregi "+ new Date());
		
		dto.setAuth(1);
		memberService.addGeneral(dto);
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="musitionregi.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musitionregi(MemDto dto, HttpServletRequest req, Model model,
			@RequestParam(value = "profileImgUpload", required = false) MultipartFile fileload) throws Exception {
		logger.info("MemController musitionregi " + new Date());
		
		System.out.println(dto.toString());
		// filename 취득
		dto.setOri_profilIMG(fileload.getOriginalFilename());

		// upload 경로
		// tomcat
		// String fupload = req.getServletContext().getRealPath("/upload");
		// logger.info("업로드 경로: " + fupload);

		// 폴더
		String fupload = "d:\\tmp";

		String f = dto.getOri_profilIMG();
		String newFile = FUpUtil.getNewFile(f);

		dto.setNew_profilIMG(newFile);
		logger.info("변경된 파일명: " + newFile);

		File file = new File(fupload + "/" + newFile);
		logger.info("경로와 파일명: " + fupload + "/" + newFile);

		// 실제로 업로드 되는 부분
		FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		
		dto.setAuth(2);
		// DB 저장
		memberService.addMusition(dto);

		return "redirect:/main.do";
	}
	
	@RequestMapping(value="generalUpdate.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String generalUpdate(MemDto dto) {
		logger.info("MemController generalUpdate "+ new Date());
		
		dto.setAuth(1);
		memberService.updateGeneral(dto);
		return "redirect:/main.do";
	}
	@RequestMapping(value="musitionUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String musitionUpdate(MemDto dto, HttpServletRequest req, Model model,
			@RequestParam(value = "profileImgUpload", required = false) MultipartFile fileload) throws Exception {
		logger.info("MemController musitionUpdate " + new Date());
		
		System.out.println(dto.toString());
		// filename 취득
		dto.setOri_profilIMG(fileload.getOriginalFilename());

		// upload 경로
		// tomcat
		// String fupload = req.getServletContext().getRealPath("/upload");
		// logger.info("업로드 경로: " + fupload);

		// 폴더
		String fupload = "d:\\tmp";

		String f = dto.getOri_profilIMG();
		String newFile = FUpUtil.getNewFile(f);

		dto.setNew_profilIMG(newFile);
		logger.info("변경된 파일명: " + newFile);

		File file = new File(fupload + "/" + newFile);
		logger.info("경로와 파일명: " + fupload + "/" + newFile);

		// 실제로 업로드 되는 부분
		FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		
		dto.setAuth(2);
		// DB 저장
		memberService.updateMusition(dto);

		return "redirect:/main.do";
	}

	@RequestMapping(value="aboutus.do", method=RequestMethod.GET)
	public String aboutusPage() {
		logger.info("KhMemberController aboutus" + new Date());
		
		return "aboutus.tiles";
	}
	
	@RequestMapping(value="loginAf.do", method=RequestMethod.GET)
	public String loginAf(HttpServletRequest req, HttpServletResponse rep, MemDto mem) throws IOException{
		logger.info("KhMemberController loginAf" + new Date());
		
		MemDto login = null;
		// login을 DB 확인
		//login = memberService.login(mem);
		PrintWriter out;
		
		
		login = new MemDto("testId", "testPwd", "testName", "01020233808", "yuns0316@gmail.com", "Rock", "Seoul", "890209", "testTN", "IMG", "IMG", "Vocal", 1, 1, 1, "M", 1);
				/*new MemDto("testTN", "testId", "testPwd", "testName", "01020233808", "yuns0316@gmail.com", "Rock", "Seoul", 890209, "IMG", "Vocal", 1, 1, 1, "M", 1);*/
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

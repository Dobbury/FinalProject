package kh.com.a.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kh.com.a.model.MemDto;
import kh.com.a.model.PositionDto;
import kh.com.a.service.GenreService;
import kh.com.a.service.LocationService;
import kh.com.a.service.MemService;
import kh.com.a.service.PositionService;


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
	
	
	@RequestMapping(value="main.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String mainView() {
		logger.info("MemController mainView "+ new Date());
		
		return "main.tiles";
	}
	
	@RequestMapping(value="myPage.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String myPage(HttpSession session, Model model) {
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
		
		
		if(id_rem!=null && id_rem.trim().equals("on")) { //체크가 되어있다면
			cookie = new Cookie("id",java.net.URLEncoder.encode(id));
			cookie.setMaxAge(60*60*24*365);//유효기간 1년
			resp.addCookie(cookie);//쿠키값 클라이언트에 저장
		}else {
			cookie = new Cookie("id",null);
			cookie.setMaxAge(0);
			resp.addCookie(cookie);//쿠키값 클라이언트에 저장
		}
		map.put("result", "success");
		session.setAttribute("user", dto);
		
		return map;
	}
	
	@RequestMapping(value="logoff.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String logoff(HttpSession session) {
		logger.info("MemController logoff "+ new Date());
		
		session.invalidate();//모든 세션 삭제
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
}

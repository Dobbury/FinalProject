package kh.com.a.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.x.json.JsonArray;

import kh.com.a.arrow.FUpUtil;
import kh.com.a.model.MemDto;
import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_CommentDto;
import kh.com.a.service.VideoBBSService;
import kh.com.a.service.Video_CommentService;


@Controller
public class VideoBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(VideoBBSController.class);
	
	@Autowired
	VideoBBSService videoBBSService;
	
	@Autowired
	Video_CommentService video_CommentService;
	
	@RequestMapping(value="VideoBBS.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBBSList(Model model) throws Exception
	{
		logger.info("VideoBBSController VideoBBSList" + new Date());
		
		List<VideoBBSDto> bbslist = videoBBSService.getVideoBbsList();
		
		model.addAttribute("bbslist", bbslist);
		
		return "VideoBBS.tiles";
	}
		
	
	@RequestMapping(value="VideoBBSWrite.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBBSWrite()
	{
		logger.info("VideoBBSController VideoBBSWrite" + new Date());
		
		return "VideoBBSWrite.tiles";
	}
	
	
	@RequestMapping(value="VideoBBSWriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBBSWriteAf(VideoBBSDto dto, HttpServletRequest req, Model model,
				@RequestParam(value="videofile", required=false)MultipartFile fileload)
	{
		logger.info("VideoBBSController VideoBBSWriteAf" + new Date());
		String oname = fileload.getOriginalFilename();
		dto.setVideo(oname);
		logger.info("OriginalFilename : " + dto.getVideo().toString());
		
		String fupload = req.getServletContext().getRealPath("/upload");
		//String fupload = "C:\\Users\\jackb\\Documents\\Git\\FinalProject\\WebContent\\upload";

		String f = dto.getVideo();
		String newFile = FUpUtil.getNewFile(f);
		/*String videoFilename = newFile;*/
		logger.info("변경된 파일명" + newFile);
		
		Process p = null;
		
		try {
			
			File file = new File(fupload + "\\" + newFile);
			logger.info("경로와 파일명:" + fupload + "\\" + newFile);
			
			
			
			//실제로 업로드 되는 부분		
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			//String videofile = "C:\\Users\\jackb\\eclipse-workspace\\springSample\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\upload\\" + newFile;
			String cfile = file.toString();
			System.out.println(cfile);
			System.out.println("oname = " + oname);
			
			
			//dto.setVideo(cfile);
			
			
			//String command = "C:\\windows\\explorer.exe";
			
			String ffmpegPath = "C:\\Windows\\ffmpeg\\bin\\ffmpeg.exe";
			String fResult = fupload + "\\" + oname + "_%2d.png";
			
			String[] command = new String[]{ffmpegPath,
                                "-i",
                                cfile,      
                                "-ss",
                                "00:00:01",                
                                "-vcodec",
                                "png",                      
                                "-vframes",
                                "1",
                                fResult};
			
			
			ProcessBuilder pb = new ProcessBuilder(command);
			pb.redirectErrorStream(true);
			
			p = pb.start();
			
			//run.exec("cmd.exe chcp 65001");
			//run.exec(command);
			
			dto.setVideo("/FinalProject/upload/"+newFile);
			dto.setThumbnail("/FinalProject/upload/"+oname+".png");
			
			
			// DB 저장
			System.out.println(dto.toString());
			videoBBSService.writeVideoBBS(dto);	
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("catch로 들어옴]]]]]]]]]]]]]]");
			p.destroy();
			return null;
		}
		
		try {
			p.waitFor();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			p.destroy();
		}
		
		return "redirect:/VideoBBS.do";
	}
	
	
	@RequestMapping(value="VideoBbsDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBbsDetail(int seq, Model model) throws Exception
	{
		logger.info("VideoBBSController VideoBbsDetail" + new Date());
		
		VideoBBSDto dto = videoBBSService.getVideoBbs(seq);
		List<VideoBBSDto> bbslist = videoBBSService.getVideoBbsList();
		
		model.addAttribute("bbslist", bbslist);
		model.addAttribute("getVideoBbs", dto);
		
		return "VideoBbsDetail.tiles";
	}
	
	@RequestMapping(value="videoBbsDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBbsDelete(int seq) throws Exception
	{
		logger.info("VideoBBSController VideoBbsDelete" + new Date());
		
		videoBBSService.videoBbsDelete(seq);
		
		return "redirect:/VideoBBS.do";
	}
	
	@RequestMapping(value="videoBbsUpdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBbsUpdate(int seq, Model model)
	{
		logger.info("VideoBBSController VideoBbsUpdate" + new Date());
		logger.info("VideoBBSController VideoBbsUpdate seq = " + seq );
		VideoBBSDto dto =  videoBBSService.getVideoBbs(seq);
		model.addAttribute("getVideoBbs", dto);
		
		return "VideoBbsUpdate.tiles";
	}
	
	@RequestMapping(value="videoBbsUpdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBbsUpdate(VideoBBSDto dto, int seq) throws Exception
	{
		logger.info("VideoBBSController VideoBbsUpdateAf " + new Date());
		dto.setVideo_seq(seq);
		logger.info("VideoBBSController VideoBbsUpdateAf " + dto);
		videoBBSService.videoBbsUpdate(dto);
		
		return "redirect:/VideoBBS.do";
	}
	
	@RequestMapping(value="addComment.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String addComment(HttpServletRequest req) throws Exception
	{
		logger.info("VideoBBSController addComment " + new Date());
		
		HttpSession session = req.getSession();
		MemDto mdto = (MemDto)session.getAttribute("user");
		
		int seq = Integer.parseInt(req.getParameter("video_seq"));
		String comment = req.getParameter("comment");
		
		System.out.println("seq = " + seq + " comment = " + comment);
		
		Video_CommentDto vcDto = new Video_CommentDto();
		
		vcDto.setVideo_seq(seq);
		vcDto.setVcomment(comment);
		vcDto.setId(mdto.getId());
		
		System.out.println(vcDto.toString());
		video_CommentService.addComment(vcDto);
		
		return "success";
	}
	
	@RequestMapping(value="commentList.do", produces="application/json; charset=utf8")
    @ResponseBody
    public ArrayList<HashMap> commentList(HttpServletRequest req)
    {
		logger.info("VideoBBSController commentList " + new Date());
		
		ArrayList<HashMap> hlist = new ArrayList<HashMap>();
		
		int seq = Integer.parseInt(req.getParameter("video_seq"));
		
		List<Video_CommentDto> cList  = video_CommentService.getCommetList(seq);
		
		if(cList.size() > 0)
		{
			for(int i = 0; i < cList.size(); i++)
			{
				HashMap hm = new HashMap();
				hm.put("vcomment_seq", cList.get(i).getVcomment_seq());
				hm.put("video_seq", cList.get(i).getVideo_seq());
				hm.put("id", cList.get(i).getId());
				hm.put("vcomment", cList.get(i).getVcomment());
				hm.put("wdate", cList.get(i).getWdate());
				
				hlist.add(hm);
			}
		}
		
		return hlist;
    }
	
}

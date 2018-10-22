package kh.com.a.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.arrow.FUpUtil;
import kh.com.a.model.VideoBBSDto;
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
		
		for(int i = 0; i < bbslist.size(); i++)
		{
			System.out.println(bbslist.get(i).getTitle().toString());
			
		}
		
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
			/*Thread.sleep(5000);*/
			
			//String videofile = "C:\\Users\\jackb\\eclipse-workspace\\springSample\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\upload\\" + newFile;
			String cfile = file.toString();
			System.out.println(cfile);
			System.out.println("oname = " + oname);
			
			
			//dto.setVideo(cfile);
			
			
			//String command = "C:\\windows\\explorer.exe";
			
			String ffmpegPath = "C:\\Windows\\thumbnail\\bin\\ffmpeg.exe";
			String fResult = "C:\\Users\\jackb\\Desktop\\Thumbnail\\" + oname + ".png";
			
			String[] command = new String[]{ffmpegPath,
                                "-i",
                                cfile,      
                                "-ss",
                                "00:00:20",                
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
			
			dto.setThumbnail(fResult);
			
			
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
	public String VideoBbsDetail(int seq, Model model)
	{
		logger.info("VideoBBSController VideoBbsDetail" + new Date());
		
		VideoBBSDto dto = videoBBSService.getVideoBbs(seq);
		
		System.out.println(dto.toString());
		
		model.addAttribute("getVideoBbs", dto);
		
		return "VideoBbsDetail.tiles";
	}
	
	@RequestMapping(value="videoBbsDelete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String VideoBbsDelete()
	{
		logger.info("VideoBBSController VideoBbsDelete" + new Date());
		
		return "redirect:/VideoBBS";
	}
	
}

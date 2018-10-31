package kh.com.a.service;

import java.util.List;

import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;


public interface VideoBBSService {
	public boolean writeVideoBBS(VideoBBSDto dto);
	
	public List<VideoBBSDto> getVideoBbsList() throws Exception;
	
	public VideoBBSDto getVideoBbs(int seq);

	public List<VideoBBSDto> getVideoForUser();
	
	public void videoBbsUpdate(VideoBBSDto bbs)throws Exception;
	
	public void videoBbsDelete(int seq)throws Exception;
	
	public void like(Video_LikeDto vlDto);
	
	public void unLike(Video_LikeDto vlDto);
	
	public boolean getLike(Video_LikeDto vlDto);
	
	public boolean incReadCount(int seq);
}

package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.VideoBBSDto;

public interface VideoBBSDao {
	public boolean writeVideoBBS(VideoBBSDto dto);
	
	public List<VideoBBSDto> getVideoBbsList() throws Exception;
	
	public VideoBBSDto getVideoBbs(int seq);

	public List<VideoBBSDto> getVideoForUser();
	
	public void videoBbsUpdate(VideoBBSDto bbs)throws Exception;
	
	public void videoBbsDelete(int seq)throws Exception;
}

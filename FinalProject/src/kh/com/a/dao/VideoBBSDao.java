package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.VideoBBSDto;

public interface VideoBBSDao {
	public boolean writeVideoBBS(VideoBBSDto dto);
	
	public List<VideoBBSDto> getVideoBbsList() throws Exception;
	
	public VideoBBSDto getVideoBbs(int seq);
}

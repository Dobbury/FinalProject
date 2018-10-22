package kh.com.a.service;

import java.util.List;

import kh.com.a.model.VideoBBSDto;


public interface VideoBBSService {
	public boolean writeVideoBBS(VideoBBSDto dto);
	
	public List<VideoBBSDto> getVideoBbsList() throws Exception;
	
	public VideoBBSDto getVideoBbs(int seq);

	public List<VideoBBSDto> getVideoForUser();
}

package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;
import kh.com.a.service.VideoBBSService;

@Service
public class VideoBBSServiceImpl implements VideoBBSService {
	
	@Autowired
	VideoBBSDao dao;

	@Override
	public boolean writeVideoBBS(VideoBBSDto dto) {
		
		return dao.writeVideoBBS(dto);
	}

	@Override
	public List<VideoBBSDto> getVideoBbsList() throws Exception {
		
		return dao.getVideoBbsList();
	}

	@Override
	public VideoBBSDto getVideoBbs(int seq) {
		
		return dao.getVideoBbs(seq);
	}
	
	public List<VideoBBSDto> getVideoForUser() {
		return dao.getVideoForUser();
	}

	@Override
	public void videoBbsUpdate(VideoBBSDto bbs) throws Exception {
		dao.videoBbsUpdate(bbs);
	}

	@Override
	public void videoBbsDelete(int seq) throws Exception {
		dao.videoBbsDelete(seq);
		
	}

	@Override
	public void like(Video_LikeDto vlDto) {
		dao.like(vlDto);
	}

	@Override
	public void unLike(Video_LikeDto vlDto) {
		dao.unlike(vlDto);
		
	}

	@Override
	public boolean getLike(Video_LikeDto vlDto) {
		return dao.getLike(vlDto);
		
	}

	@Override
	public boolean incReadCount(int seq) {
		
		return dao.incReadCount(seq);
	}
	
	
	
	
	
}	

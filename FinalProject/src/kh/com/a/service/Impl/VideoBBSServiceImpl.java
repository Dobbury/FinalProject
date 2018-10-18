package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.VideoBBSDto;
import kh.com.a.service.VideoBBSService;

@Service
public class VideoBBSServiceImpl implements VideoBBSService {
	
	@Autowired
	VideoBBSDao dao;

	@Override
	public List<VideoBBSDto> getVideoForUser() {
		return dao.getVideoForUser();
	}
}	

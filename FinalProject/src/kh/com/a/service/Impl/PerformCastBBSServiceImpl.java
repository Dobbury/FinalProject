package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.PerformCastBBSDao;
import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.PerformCastBBSDto;
import kh.com.a.service.PerformCastBBSService;

@Service
public class PerformCastBBSServiceImpl implements PerformCastBBSService{
	
	@Autowired
	PerformCastBBSDao dao;

	@Override
	public boolean sendCompInfo(PerformCastBBSDto dto) throws Exception {
		return dao.sendCompInfo(dto);
	}

	@Override
	public List<PerformCastBBSDto> getCastBbs() {
		
		return dao.getCastBbs();
		 
	}

	
}	

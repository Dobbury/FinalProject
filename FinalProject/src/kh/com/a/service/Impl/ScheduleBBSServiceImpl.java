package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.ScheduleBBSDto;
import kh.com.a.service.ScheduleBBSService;

@Service
public class ScheduleBBSServiceImpl implements ScheduleBBSService {
	
	@Autowired
	ScheduleBBSDao dao;

	@Override
	public List<ScheduleBBSDto> getIngSchedule() {
		return dao.getIngSchedule();
	}

	@Override
	public List<ScheduleBBSDto> getComingSchedule() {
		return dao.getComingSchedule();
	}
	
	@Override
	public List<ScheduleBBSDto> getScheduleList() throws Exception {
		return dao.getScheduleList();
	}

	@Override
	public List<ScheduleBBSDto> getScheduleOne() throws Exception {
		return dao.getScheduleOne();
	}

	@Override
	public boolean wirteBbs(ScheduleBBSDto bbs) throws Exception {
		System.out.println("ServiceImpl");
		return dao.writeBbs(bbs);
	}

	
	
}	

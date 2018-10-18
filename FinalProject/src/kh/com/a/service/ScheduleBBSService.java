package kh.com.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.model.ScheduleBBSDto;

public interface ScheduleBBSService {
	
	public List<ScheduleBBSDto> getIngSchedule();
	
	public List<ScheduleBBSDto> getComingSchedule();
	
}

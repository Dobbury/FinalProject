package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ScheduleBBSDto;

public interface ScheduleBBSDao {

	public List<ScheduleBBSDto> getComingSchedule();
	
	public List<ScheduleBBSDto> getIngSchedule();
}

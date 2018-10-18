package kh.com.a.service;

import java.util.List;

import kh.com.a.model.PerformCastBBSDto;

public interface PerformCastBBSService {

	public boolean sendCompInfo(PerformCastBBSDto dto) throws Exception;
	
	public List<PerformCastBBSDto> getCastBbs();

}

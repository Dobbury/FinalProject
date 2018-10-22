package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.MusiRecuParam;

public interface MusiRecuBBSDao {

	public List<MusiRecuBBSDto> getMusiRecuPagingList(MusiRecuParam param);
	public int getMusiRecuBBSCount(MusiRecuParam param);
	
}

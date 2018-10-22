package kh.com.a.service;

import java.util.List;

import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.MusiRecuParam;

public interface MusiRecuBBSService {
	public List<MusiRecuBBSDto> getMusiRecuPagingList(MusiRecuParam param);
	public int getMusiRecuBBSCount(MusiRecuParam param);
}

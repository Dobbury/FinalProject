package kh.com.a.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MusiRecuBBSDao;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.service.MusiRecuBBSService;


@Service
public class MusiRecutBBSServiceImpl implements MusiRecuBBSService{
	
	@Autowired
	MusiRecuBBSDao dao;

	@Override
	public List<MusiRecuBBSDto> getMusiRecuList() {
		return dao.getMusiRecuList();
	}
}	
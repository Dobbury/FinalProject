package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MuseRecuBBSDao;
import kh.com.a.service.MuseRecuBBSService;


@Service
public class MuseRecutBBSServiceImpl implements MuseRecuBBSService{
	
	@Autowired
	MuseRecuBBSDao dao;
}	

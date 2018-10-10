package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MuseMemDao;
import kh.com.a.service.MuseMemService;

@Service
public class MuseMemServiceImpl implements MuseMemService {
	
	@Autowired
	MuseMemDao dao;
}	

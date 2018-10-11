package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.service.VideoBBSService;

@Service
public class VideoBBSServiceImpl implements VideoBBSService {
	
	@Autowired
	VideoBBSDao dao;
}	

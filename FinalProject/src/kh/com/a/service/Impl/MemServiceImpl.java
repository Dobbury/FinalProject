package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MemDao;
import kh.com.a.service.MemService;

@Service
public class MemServiceImpl implements MemService{

	@Autowired
	MemDao memberDao;
}

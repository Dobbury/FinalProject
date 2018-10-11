package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.TicketDao;
import kh.com.a.dao.VideoBBSDao;
import kh.com.a.dao.Video_CommentDao;
import kh.com.a.service.TicketService;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	TicketDao dao;
}	

package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.dao.Video_CommentDao;
import kh.com.a.service.Video_CommentService;

@Service
public class Video_CommentServiceImpl implements Video_CommentService{
	
	@Autowired
	Video_CommentDao dao;
}	

package kh.com.a.dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.Video_CommentDao;

@Repository
public class Video_CommentDaoImpl implements Video_CommentDao{
	@Autowired
	SqlSessionTemplate sqlSession;
}
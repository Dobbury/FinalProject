package kh.com.a.dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.VideoBBSDao;

@Repository
public class VideoBBSDaoImpl implements VideoBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
}

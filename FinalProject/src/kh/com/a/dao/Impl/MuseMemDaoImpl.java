package kh.com.a.dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MuseMemDao;

@Repository
public class MuseMemDaoImpl implements MuseMemDao{
	@Autowired
	SqlSessionTemplate sqlSession;
}

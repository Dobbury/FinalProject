package kh.com.a.dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MuseRecuBBSDao;

@Repository
public class MuseRecuBBSDaoImpl implements MuseRecuBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
}

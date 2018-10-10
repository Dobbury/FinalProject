package kh.com.a.dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ScheduleBBSDao;

@Repository
public class ScheduleBBSDaoImpl implements ScheduleBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
}

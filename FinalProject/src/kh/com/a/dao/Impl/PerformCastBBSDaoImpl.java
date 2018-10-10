package kh.com.a.dao.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.PerformCastBBSDao;

@Repository
public class PerformCastBBSDaoImpl implements PerformCastBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
}

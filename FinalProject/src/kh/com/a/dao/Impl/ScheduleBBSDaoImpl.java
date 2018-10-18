package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ScheduleBBSDao;
import kh.com.a.model.ScheduleBBSDto;

@Repository
public class ScheduleBBSDaoImpl implements ScheduleBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "ScheduleBBS.";

	@Override
	public List<ScheduleBBSDto> getComingSchedule() {
		return sqlSession.selectList(namespace + "getComingSchedule");
	}
	@Override
	public List<ScheduleBBSDto> getIngSchedule() {
		return sqlSession.selectList(namespace + "getIngSchedule");
	}
}

package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.VideoBBSDto;

@Repository
public class VideoBBSDaoImpl implements VideoBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "VideoBBS.";

	@Override
	public List<VideoBBSDto> getVideoForUser() {
		return sqlSession.selectList(namespace + "getVideoRank");
	}


}

package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.VideoBBSDto;

@Repository
public class VideoBBSDaoImpl implements VideoBBSDao {
	
	private String namespace = "VideoBBS.";
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public boolean writeVideoBBS(VideoBBSDto dto) {
		
		sqlSession.insert(namespace + "videoBbsWrite", dto);
		return true;
	}

	@Override
	public List<VideoBBSDto> getVideoBbsList() throws Exception {
		List<VideoBBSDto> list = sqlSession.selectList(namespace + "getVideoBbsList");
		return list;
	}

	@Override
	public VideoBBSDto getVideoBbs(int seq) {
		VideoBBSDto dto = sqlSession.selectOne(namespace + "getVideoBbs", seq);
		return dto;
	}
	

	@Override
	public List<VideoBBSDto> getVideoForUser() {
		return sqlSession.selectList(namespace + "getVideoRank");
	}

}

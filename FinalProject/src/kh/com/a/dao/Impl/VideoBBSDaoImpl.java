package kh.com.a.dao.Impl;

import java.util.HashMap;
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

	@Override
	public void videoBbsUpdate(VideoBBSDto bbs) throws Exception {
		sqlSession.update(namespace + "videoBbsUpdate", bbs);
	}

	@Override
	public void videoBbsDelete(int seq) throws Exception {
		sqlSession.update(namespace + "videoBbsDelete", seq);
		
	}

	@Override
	public int CheckFollow(HashMap<String, String> map) throws Exception {
		
		return sqlSession.selectOne(namespace + "checkfollow", map);
	}

	@Override
	public int CancelFollow(HashMap<String, String> map) throws Exception {
		int seq = sqlSession.selectOne(namespace + "checkSeq", map);	
		sqlSession.delete(namespace + "cancelFollow", seq);
		return 0;
		
		
	}

	@Override
	public int doFollow(HashMap<String, String> map) throws Exception {
		
		sqlSession.insert(namespace + "dofollow", map);
		
		return 1;
	}

	
	
	
}

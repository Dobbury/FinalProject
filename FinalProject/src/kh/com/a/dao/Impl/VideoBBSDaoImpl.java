package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.VideoBBSDao;
import kh.com.a.model.VideoBBSDto;
import kh.com.a.model.Video_LikeDto;

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
	public void like(Video_LikeDto vlDto) {
		sqlSession.insert(namespace + "like", vlDto);
		
	}

	@Override
	public void unlike(Video_LikeDto vlDto) {
		sqlSession.delete(namespace + "unLike", vlDto);
		
	}

	@Override
	public boolean getLike(Video_LikeDto vlDto) {
		Video_LikeDto vl = sqlSession.selectOne(namespace + "getLike", vlDto);
		boolean like = true;
		
		if(vl == null)
			like = false;
		else if(vl != null)
			like = true;
		
		return like;
		
	}

	@Override
	public boolean incReadCount(int seq) {
		sqlSession.update(namespace + "incReadCount", seq);
		return true;
	}
	
	
	
	
	
}

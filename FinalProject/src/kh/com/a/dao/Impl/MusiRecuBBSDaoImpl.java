package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MusiRecuBBSDao;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.MusiRecuParam;

@Repository
public class MusiRecuBBSDaoImpl implements MusiRecuBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	private String namespace="MusiRecuBBS.";
	
	@Override
	public List<MusiRecuBBSDto> getMusiRecuPagingList(MusiRecuParam param) {
		return sqlSession.selectList(namespace + "getMusiRecuPagingList",param);
	}

	@Override
	public int getMusiRecuBBSCount(MusiRecuParam param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getMusiRecuBBSCount",param);
	}
}

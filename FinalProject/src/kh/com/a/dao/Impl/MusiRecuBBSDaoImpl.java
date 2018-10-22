package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MusiRecuBBSDao;
import kh.com.a.model.MusiRecuBBSDto;

@Repository
public class MusiRecuBBSDaoImpl implements MusiRecuBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	private String namespace="MusiRecuBBS.";
	
	@Override
	public List<MusiRecuBBSDto> getMusiRecuList() {
		return sqlSession.selectList(namespace + "getMusiRecuList");
	}
}

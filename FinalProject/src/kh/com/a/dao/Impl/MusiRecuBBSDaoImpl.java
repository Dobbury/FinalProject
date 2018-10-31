package kh.com.a.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MusiRecuBBSDao;
import kh.com.a.model.MusiRecuBBSDto;
import kh.com.a.model.Param;
import kh.com.a.model.RecuMusiInfoDto;

@Repository
public class MusiRecuBBSDaoImpl implements MusiRecuBBSDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	private String namespace="MusiRecuBBS.";
	
	@Override
	public List<MusiRecuBBSDto> getMusiRecuPagingList(Param param) {
		return sqlSession.selectList(namespace + "getMusiRecuPagingList",param);
	}

	@Override
	public int getMusiRecuBBSCount(Param param) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getMusiRecuBBSCount",param);
	}

	@Override
	public MusiRecuBBSDto getMusiRecuBBSDetail(int musi_recu_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getMusiRecuBBSDetail",musi_recu_seq);
	}

	@Override
	public void addRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "addRecuMusiInfo", recuMusiInfoDto);
	}

	@Override
	public int getRecuMusiCount(RecuMusiInfoDto recuMusiInfoDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getRecuMusiCount", recuMusiInfoDto);
	}

	@Override
	public int getRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "getRecuMusiInfo", recuMusiInfoDto);
	}

	@Override
	public void delRecuMusiInfo(RecuMusiInfoDto recuMusiInfoDto) {
		sqlSession.delete(namespace + "delRecuMusiInfo",recuMusiInfoDto);
	}

	@Override
	public List<MusiRecuBBSDto> getRecuMusiDeadLineList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "getRecuMusiDeadLineList");
	}

	@Override
	public List<MusiRecuBBSDto> moreMusiRecuDeadLineList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "moreMusiRecuDeadLineList");
	}

	@Override
	public void addMusiRecuBBS(MusiRecuBBSDto dto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+ "addMusiRecuBBS",dto);
	}
}

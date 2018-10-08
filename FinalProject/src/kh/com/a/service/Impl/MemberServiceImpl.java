package kh.com.a.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MemberDao;

@Service
public class MemberServiceImpl {

	@Autowired
	MemberDao memberDao;
}

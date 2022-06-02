package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.MemberVo;

@Repository
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void joinMember(MemberVo memberVo) {
		memberDao.joinMember(memberVo);
		System.out.println("service" + memberVo);
	}

	@Override
	public MemberVo login(String userid, String userpw) {
		MemberVo memberVo = memberDao.login(userid, userpw);
		return memberVo;
	}

	@Override
	public boolean updateMember(MemberVo memberVo) {
		return false;
	}

	@Override
	public boolean deleteMember(String userid) {
		return false;
	}

}

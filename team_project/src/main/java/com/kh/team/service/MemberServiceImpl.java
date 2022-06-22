package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public boolean joinMember(MemberVo memberVo) {
		boolean result = memberDao.joinMember(memberVo);
		return result;
	}

	@Override
	public MemberVo login(String userid, String userpw) {
		MemberVo memberVo = memberDao.login(userid, userpw);
		return memberVo;
	}

	@Override
	public boolean updateMember(MemberVo memberVo) {
		boolean result = memberDao.updateMember(memberVo);
		return result;
	}

	@Override
	public boolean deleteMember(String userid) {
		boolean result = memberDao.deleteMember(userid);
		return result;
	}

	@Override
	public String getU_picById(String userid) {
		String u_pic = memberDao.getU_picById(userid);
		return u_pic;
	}

	@Override
	public MemberVo memberByUserid(String userid) {
		MemberVo memberVo = memberDao.memberByUserid(userid);
		return memberVo;
	}

	@Override
	public boolean isExist(String userid) {
		return memberDao.isExist(userid);
	}

	@Override
	public MemberVo findId(String username, String email) {
		return memberDao.findId(username, email);
	}

	@Override
	public MemberVo findPw(String userid, String email) {
		return memberDao.findPw(userid, email);
	}

	@Override
	public boolean updatePw(String userid, String userpw) {
		return memberDao.updatePw(userid, userpw);
	}

	@Override
	public List<MemberVo> getLatestMember() {
		return memberDao.getLatestMember();
	}

	@Override
	public List<MemberVo> getMemberList() {
		return memberDao.getMemberList();
	}

}

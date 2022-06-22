package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MemberVo;

public interface MemberService {
	
	public boolean joinMember(MemberVo memberVo);
	
	public MemberVo login(String userid, String userpw);
	
	public boolean updateMember(MemberVo memberVo);
	
	public boolean deleteMember(String userid);
	
	public String getU_picById(String userid);
	
	public MemberVo memberByUserid(String userid);
	
	public boolean isExist(String userid);
	
	public MemberVo findId(String username, String email);
	
	public MemberVo findPw(String userid, String email);
	
	public boolean updatePw(String userid, String userpw);
	
	public List<MemberVo> getLatestMember();
}

package com.kh.team.service;

import com.kh.team.vo.MemberVo;

public interface MemberService {
	
	public boolean joinMember(MemberVo memberVo);
	
	public MemberVo login(String userid, String userpw);
	
	public boolean updateMember(MemberVo memberVo);
	
	public boolean deleteMember(String userid);
	
	public String getU_picById(String userid);
	
	public MemberVo memberByUserid(String userid);
}

package com.kh.team.dao;

import com.kh.team.vo.MemberVo;

public interface MemberDao  {

	public boolean joinMember(MemberVo memberVo);
	
	public MemberVo login(String userid, String userpw);
	
	public boolean updateMember(MemberVo memberVo);
	
	public boolean deleteMember(String userid);
	
	public String getU_picById(String userid);
	
	public MemberVo memberByUserid(String userid);
	
	public boolean isExist(String userid);
	
	public MemberVo findId(String username, String email);
}

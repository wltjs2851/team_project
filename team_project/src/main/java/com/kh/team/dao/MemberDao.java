package com.kh.team.dao;

import com.kh.team.vo.MemberVo;

public interface MemberDao  {

	public void joinMember(MemberVo memberVo);
	
	public MemberVo login(String userid, String userpw);
	
	public boolean updateMember(MemberVo memberVo);
	
	public boolean deleteMember(String userid);
}

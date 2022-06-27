package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.testVo;

public interface AdminDao {
	public List<AdminVo> adminList(String userid);
	
	public List<testVo> getGroupInfo();
	
	// userid, userid - join table => gno, gno - group userid(member), update gleader
	// 강퇴시킬 회원의 gno 얻기 
	public List<Integer> getGno(String userid);
	
	// 그 gno 의 멤버 찾기 
	public List<String> getGmember(int gno);
	
	//그룹장 바꾸기
	public boolean updateGLeader(int gno, String userid);
	
}

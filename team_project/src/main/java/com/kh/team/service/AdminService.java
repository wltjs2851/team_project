package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.testVo;

public interface AdminService {
	public List<AdminVo> adminList(String nickname);
	
	public List<testVo> getGroupInfo();
	
	// 회원 강퇴
	public boolean userOut(String userid);
}

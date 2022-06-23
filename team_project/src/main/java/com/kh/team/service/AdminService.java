package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.testVo;

public interface AdminService {
	public List<AdminVo> adminList(String userid);
	
	public List<testVo> getGroupInfo();
}

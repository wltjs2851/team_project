package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.testVo;

public interface AdminDao {
	public List<AdminVo> adminList(String userid);
	
	public List<testVo> getGroupInfo();
}

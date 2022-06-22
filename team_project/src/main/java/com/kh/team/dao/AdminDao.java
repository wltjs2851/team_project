package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.AdminVo;

public interface AdminDao {
	public List<AdminVo> adminList(String userid);
}

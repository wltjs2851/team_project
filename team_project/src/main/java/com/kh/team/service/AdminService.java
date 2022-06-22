package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.AdminVo;

public interface AdminService {
	public List<AdminVo> adminList(String userid);
}

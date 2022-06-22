package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.AdminDao;
import com.kh.team.vo.AdminVo;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	@Override
	public List<AdminVo> adminList(String userid) {
		return adminDao.adminList(userid);
	}

}

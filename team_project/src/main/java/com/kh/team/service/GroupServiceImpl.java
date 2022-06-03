package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.GroupDao;
import com.kh.team.vo.GroupVo;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private GroupDao groupDao;

	@Override
	public boolean addGroup(GroupVo groupVo) {
		return groupDao.insertGroup(groupVo);
	}

	@Override
	public List<GroupVo> groupList() {
		return groupDao.selectGroup();
	}

	@Override
	public boolean moidfyGroup(GroupVo groupVo) {
		// TODO Auto-generated method stub
		return false;
	}

}

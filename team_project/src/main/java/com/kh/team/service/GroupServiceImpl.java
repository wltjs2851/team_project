package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.GroupDao;
import com.kh.team.vo.GroupVo;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private GroupDao groupDao;

	@Override
	@Transactional
	public boolean addGroup(GroupVo groupVo) {
		int gno = groupDao.getNextGno();
		groupVo.setGno(gno);
		boolean groupResult = groupDao.insertGroup(groupVo);
		boolean memberResult = groupDao.updateMemberGno(groupVo.getGno(), groupVo.getG_leader());
		if(groupResult && memberResult) {
			return true;
		}
		return groupDao.insertGroup(groupVo);
	}

	@Override
	public List<GroupVo> groupList() {
		return groupDao.selectGroup();
	}

	@Override
	public boolean moidfyGroup(GroupVo groupVo) {
		return groupDao.updateGroup(groupVo);
	}

	@Override
	public GroupVo groupByGno(int gno) {
		return groupDao.groupByGno(gno);
	}
	
	@Override
	public boolean removeGroup(int gno) {
		return groupDao.deleteGroup(gno);
	}

	@Override
	@Transactional
	public boolean joinGroup(GroupVo groupVo, String userid) {
		boolean groupResult = groupDao.updateGroupMember(groupVo, userid);
		boolean memberResult = groupDao.updateMemberGno(groupVo.getGno(), userid);
		if(groupResult && memberResult) {
			return true;
		}
		return false;
	}

}

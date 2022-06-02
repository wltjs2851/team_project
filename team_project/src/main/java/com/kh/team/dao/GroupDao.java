package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupVo;

public interface GroupDao {
	public boolean insertGroup(GroupVo groupVo);
	public List<GroupVo> selectGroup();
	public boolean updateGroup(GroupVo groupVo);
	public boolean deleteGroup(int gno);
}
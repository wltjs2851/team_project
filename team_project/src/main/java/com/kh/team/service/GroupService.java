package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.GroupVo;

public interface GroupService {
	public boolean addGroup(GroupVo groupVo);
	public List<GroupVo> groupList();
	public boolean moidfyGroup(GroupVo groupVo);
	public GroupVo groupByGno(int gno);
	public boolean joinGroup(GroupVo groupVo, String userid);
}

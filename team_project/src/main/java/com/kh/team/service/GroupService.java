package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;

public interface GroupService {
	public boolean addGroup(GroupVo groupVo);
	public List<GroupVo> groupList();
	public boolean moidfyGroup(GroupVo groupVo);
	public boolean removeGroup(int gno);
	public GroupVo groupByGno(int gno);
	public boolean joinGroup(int gno, String userid);
	public boolean banGroup(int gno, String userid);
	public List<GroupJoinVo> list(int gno);
}

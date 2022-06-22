package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;

public interface GroupService {
	public boolean addGroup(GroupVo groupVo);
	public List<GroupVo> groupList();
	public boolean moidfyGroup(GroupVo groupVo);
	public boolean removeGroup(int gno, String userid);
	public GroupVo groupByGno(int gno);
	public boolean joinGroup(int gno, String userid);
	public boolean banGroup(int gno, String userid);
	public List<GroupJoinVo> list(int gno);
	public List<GroupJoinVo> list(String userid);
	public List<GroupVo> groupListOrder();
	public List<LocationVo> groupLocation();
	public List<LocationVo> groupLocationSno(int dno);
	public List<LocationVo> groupLocationSgno(int dno, int sno);
	
	public List<String> getNickname(int gno);
}

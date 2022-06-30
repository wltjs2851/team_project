package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;
import com.kh.team.vo.PagingDto;

public interface GroupService {
	public boolean addGroup(GroupVo groupVo);
	public List<GroupVo> groupList();
	public List<GroupVo> adminGroupList(PagingDto pagingDto);
	public List<GroupVo> selectGroupList(int startRow, int endRow);
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
	public List<GroupVo> groupByLocation(int dno);
	public List<GroupVo> searchLocation(LocationVo locationVo);
	public int getCount(PagingDto pagingDto);
	
	public List<String> getNickname(int gno);
	public List<GroupVo> getGroupByUserId(String userid);
}

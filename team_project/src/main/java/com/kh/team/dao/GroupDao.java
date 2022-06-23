package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;

public interface GroupDao {
	public boolean insertGroup(GroupVo groupVo);
	public List<GroupVo> selectGroup();
	public List<GroupVo> selectGroupList(int startRow, int endRow);
	public int getCount();
	public boolean updateGroup(GroupVo groupVo);
	public boolean deleteGroup(int gno);
	public GroupVo groupByGno(int gno);
	public boolean updateGroupMember(int gno, int cnt);
	public int getNextGno();
	public boolean insertJoinGroup(int gno, String userid);
	public boolean deleteJoinGroup(int gno, String userid);
	public List<GroupJoinVo> list(int gno);
	public List<GroupJoinVo> list(String userid);
	public List<GroupVo> groupListOrder();
	public List<LocationVo> groupLocation();
	public List<LocationVo> groupLocationSno(int dno);
	public List<LocationVo> groupLocationSgno(int dno, int sno);
	public List<GroupVo> groupByLocation(int dno);
	public List<GroupVo> searchLocation(LocationVo locationVo);
	
	// 가입한 그룹 닉네임 가져오기 
	public List<String> getNickname(int gno);
}

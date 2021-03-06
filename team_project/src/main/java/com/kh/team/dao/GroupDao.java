package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;
import com.kh.team.vo.PagingDto;

public interface GroupDao {
	public boolean insertGroup(GroupVo groupVo);
	public List<GroupVo> selectGroup();
	public List<GroupVo> adminGroupList(PagingDto pagingDto);
	public List<GroupVo> selectGroupList(int startRow, int endRow);
	public int getCount(PagingDto pagingDto);
	public boolean updateGroup(GroupVo groupVo);
	public boolean deleteGroup(int gno);
	public GroupVo groupByGno(int gno);
	public boolean updateGroupMember(int gno, int cnt);
	public int getNextGno();
	public boolean insertJoinGroup(int gno, String userid, String nickname);
	public boolean deleteJoinGroup(int gno, String userid);
	public boolean deleteJoinGroupNickname(int gno, String nickname);
	public List<GroupJoinVo> list(int gno);
	public List<GroupJoinVo> list(String userid);
	public List<GroupVo> groupListOrder();
	public List<LocationVo> groupLocation();
	public List<LocationVo> groupLocationSno(int dno);
	public List<LocationVo> groupLocationSgno(int dno, int sno);
	public List<GroupVo> groupByLocation(int dno);
	public List<GroupVo> searchLocation(LocationVo locationVo);
	
	public boolean deleteGroupBoard(int gno);
	public boolean deleteGroupComment(int gno);
	public boolean deleteGroupLike(int gno);
	public boolean deleteGroupReport(int gno);
	public boolean deleteGroupCalendar(int gno);
	
	// 가입한 그룹 닉네임 가져오기 
	public List<String> getNickname(int gno);
	// 특정회원 가입한 그룹정보 가져오기
	public List<GroupVo> getGroupByUserId(String userid);
	
	public int isExistMyGroupList(String userid);
}

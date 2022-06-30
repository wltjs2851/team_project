package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.GroupDao;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;
import com.kh.team.vo.PagingDto;

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
		boolean memberResult = groupDao.insertJoinGroup(groupVo.getGno(), groupVo.getG_leader());
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
	@Transactional
	public boolean removeGroup(int gno, String userid) {
		boolean deleteLike = groupDao.deleteGroupLike(gno);
		boolean deleteComment = groupDao.deleteGroupComment(gno);
		boolean deleteBoard = groupDao.deleteGroupBoard(gno);
		boolean deleteReport = groupDao.deleteGroupReport(gno);
		boolean deleteCalendar = groupDao.deleteGroupCalendar(gno);
		boolean deleteMember = groupDao.deleteJoinGroup(gno, userid);
		boolean deleteGroup = groupDao.deleteGroup(gno);
		if(deleteMember && deleteGroup && deleteBoard && deleteComment && deleteLike && deleteReport && deleteCalendar) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean joinGroup(int gno, String userid) {
		boolean groupResult = groupDao.updateGroupMember(gno, 1);
		boolean memberResult = groupDao.insertJoinGroup(gno, userid);
		if(groupResult && memberResult) {
			return true;
		}
		return false;
	}
	
	@Override
	@Transactional
	public boolean banGroup(int gno, String userid) {
		boolean groupResult = groupDao.updateGroupMember(gno, -1);
		boolean joinGroupResult = groupDao.deleteJoinGroup(gno, userid);
		if (groupResult && joinGroupResult) {
			return true;
		}
//		groupDao.
		return false;
	}
	
	@Override
	public List<GroupJoinVo> list(int gno) {
		List<GroupJoinVo> groupJoinMember = groupDao.list(gno);
		return groupJoinMember;
	}

	@Override
	public List<GroupJoinVo> list(String userid) {
		List<GroupJoinVo> groupJoinList = groupDao.list(userid);
		return groupJoinList;
	}

	@Override
	public List<GroupVo> groupListOrder() {
		return groupDao.groupListOrder();
	}

	@Override
	public List<String> getNickname(int gno) {
		return groupDao.getNickname(gno);
	}

	@Override
	public List<LocationVo> groupLocation() {
		return groupDao.groupLocation();
	}

	@Override
	public List<LocationVo> groupLocationSno(int dno) {
		return groupDao.groupLocationSno(dno);
	}

	@Override
	public List<LocationVo> groupLocationSgno(int dno, int sno) {
		return groupDao.groupLocationSgno(dno, sno);
	}

	@Override
	public List<GroupVo> groupByLocation(int dno) {
		return groupDao.groupByLocation(dno);
	}

	@Override
	public List<GroupVo> searchLocation(LocationVo locationVo) {
		return groupDao.searchLocation(locationVo);
	}

	@Override
	public List<GroupVo> selectGroupList(int startRow, int endRow) {
		return groupDao.selectGroupList(startRow, endRow);
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		return groupDao.getCount(pagingDto);
	}

	@Override
	public List<GroupVo> getGroupByUserId(String userid) {
		return groupDao.getGroupByUserId(userid);
	}

	@Override
	public List<GroupVo> adminGroupList(PagingDto pagingDto) {
		return groupDao.adminGroupList(pagingDto);
	}
}

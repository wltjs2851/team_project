package com.kh.team.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.GroupBoardDao;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.ReportVo;
import com.kh.team.vo.SearchDto;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {
	
	@Autowired
	private GroupBoardDao groupBoardDao;

	@Override
	public boolean create(GroupBoardVo groupBoardVo) {
		boolean result = groupBoardDao.create(groupBoardVo);
		return result;
	}

	@Override
	public GroupBoardVo read(int gbno) {
		GroupBoardVo groupVo = groupBoardDao.read(gbno);
		return groupVo;
	}

	@Override
	public boolean update(GroupBoardVo groupBoardVo) {
		boolean result = groupBoardDao.update(groupBoardVo);
		return result;
	}

	@Override
	public boolean delete(int gbno) {
		boolean result = groupBoardDao.delete(gbno);
		return result;
	}

	@Override
	public List<GroupBoardVo> list(SearchDto searchDto) {
		List<GroupBoardVo> groupList = groupBoardDao.list(searchDto);
		return groupList;
	}

	@Override
	public List<GroupBoardVo> notice(String gb_notice) {
		List<GroupBoardVo> noticeList = groupBoardDao.notice(gb_notice);
		return noticeList;
	}

	@Override
	public int countComment(int gbno) {
		
		return groupBoardDao.countComment(gbno);
	}

	@Override
	public String getGb_picById(int gbno) {
		String gb_pic = groupBoardDao.getGb_picdById(gbno);
		return gb_pic;
	}

	@Override
	public boolean deleteMember(String userid, int gno) {
		boolean result = groupBoardDao.deleteMember(userid, gno);
		groupBoardDao.updateCtnMember(gno);
		return result;
	}

	@Override
	public void updateCtnMember(int gno) {
		groupBoardDao.updateCtnMember(gno);
	}

	@Override
	public boolean updateGLeader(GroupVo groupVo) {
		boolean result = groupBoardDao.updateGLeader(groupVo);
		return result;
	}

	@Override
	public MemberVo pickGroupMember(String userid) {
		MemberVo memberVo = groupBoardDao.pickGroupMember(userid);
		return memberVo;
	}

	@Override
	public List<GroupBoardVo> adminGroupBoardList(String userid) {
		return groupBoardDao.adminGroupBoardList(userid);
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = groupBoardDao.getCount(pagingDto);
		return count;
	}

}

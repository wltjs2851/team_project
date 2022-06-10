package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.GroupBoardDao;
import com.kh.team.vo.GroupBoardVo;

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
	public List<GroupBoardVo> list(int gno) {
		List<GroupBoardVo> groupList = groupBoardDao.list(gno);
		return groupList;
	}

	@Override
	public List<GroupBoardVo> notice(String gb_notice) {
		List<GroupBoardVo> noticeList = groupBoardDao.notice(gb_notice);
		return noticeList;
	}

//	@Override
//	public boolean updateComment(int gbno) {
//		boolean result = groupBoardDao.updateComment(gbno);
//		return result;
//	}

	@Override
	public int countComment(int gbno) {
		
		return groupBoardDao.countComment(gbno);
	}

	@Override
	public String getGb_picById(int gbno) {
		String gb_pic = groupBoardDao.getGb_picdById(gbno);
		return gb_pic;
	}

}

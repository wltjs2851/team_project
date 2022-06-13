package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.GroupBoardCommentDao;
import com.kh.team.vo.GroupBoardCommentVo;

@Service
public class GroupBoardCommentServiceImpl implements GroupBoardCommentService {
	
	@Autowired
	private GroupBoardCommentDao groupBoardCommentDao;

	@Override
	public boolean insertGroupComment(GroupBoardCommentVo groupBoardCommentVo) {
		
		return groupBoardCommentDao.insertGroupComment(groupBoardCommentVo);
	}

	@Override
	public List<GroupBoardCommentVo> groupCommentList(int gbno) {
		
		return groupBoardCommentDao.groupCommentList(gbno);
	}

	@Override
	public boolean updateGroupComment(GroupBoardCommentVo groupBoardCommentVo) {
		
		return groupBoardCommentDao.updateGroupComment(groupBoardCommentVo);
	}

	@Override
	public boolean deleteGroupComment(int gbcno) {
		
		return groupBoardCommentDao.deleteGroupComment(gbcno);
	}

	@Override
	public void updateComment(int gbno) {
		groupBoardCommentDao.updateComment(gbno);
	}

	@Override
	public void updateCommentDelete(int gbno) {
		groupBoardCommentDao.updateCommentDelete(gbno);
	}

}

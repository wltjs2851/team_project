package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupBoardCommentVo;

public interface GroupBoardCommentDao {
	
	public boolean insertGroupComment(GroupBoardCommentVo groupBoardCommentVo);
	public List<GroupBoardCommentVo> groupCommentList(int gbno);
	public boolean updateGroupComment(GroupBoardCommentVo groupBoardCommentVo);
	public boolean deleteGroupComment(int gbcno);

}

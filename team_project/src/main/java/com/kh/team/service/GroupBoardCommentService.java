package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.GroupBoardCommentVo;

public interface GroupBoardCommentService {
	
	public boolean insertGroupComment(GroupBoardCommentVo groupBoardCommentVo);
	public List<GroupBoardCommentVo> groupCommentList(int gbno);
	public boolean updateGroupComment(GroupBoardCommentVo groupBoardCommentVo);
	public boolean deleteGroupComment(int gbcno);
	public void updateComment(int gbno);
	public void updateCommentDelete(int gbno);

}

package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.FreeCommentVo;
import com.kh.team.vo.GroupBoardCommentVo;

public interface GroupBoardCommentDao {
	
	public boolean insertGroupComment(GroupBoardCommentVo groupBoardCommentVo);
	public List<GroupBoardCommentVo> groupCommentList(int gbno);
	public boolean updateGroupComment(GroupBoardCommentVo groupBoardCommentVo);
	public boolean deleteGroupComment(int gbcno);
	public void updateComment(int gbno);
	public void updateCommentDelete(int gbno);
	
	public boolean deleteAllGComment(int gbno);
	
	public List<GroupBoardCommentVo> adminGroupBoardComment(String nickname);

}

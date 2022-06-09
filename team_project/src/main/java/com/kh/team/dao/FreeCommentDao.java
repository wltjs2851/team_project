package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.FreeCommentVo;

public interface FreeCommentDao {
	public boolean insertFreeComment(FreeCommentVo freeCommentVo);
	public List<FreeCommentVo> commentFreeList(int fno);
	public boolean updateFreeComment(FreeCommentVo freeCommentVo);
	public boolean deleteFreeComment(int fcno);
}

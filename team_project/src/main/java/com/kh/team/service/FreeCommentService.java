package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.FreeCommentVo;

public interface FreeCommentService {
	public boolean addFreeComment(FreeCommentVo freeCommentVo);
	public List<FreeCommentVo> commentFreeList(int fno);
	public boolean modifyFreeComment(FreeCommentVo freeCommentVo);
	public boolean removeFreeComment(int fcno);
}

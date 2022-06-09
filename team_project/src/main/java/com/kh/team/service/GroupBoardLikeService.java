package com.kh.team.service;

import com.kh.team.vo.GroupBoardLikeVo;

public interface GroupBoardLikeService {
	
	public void addLike(GroupBoardLikeVo groupBoardLikeVo);
	public void deleteLike(GroupBoardLikeVo groupBoardLikeVo);
	public void updateLike(int gbno);
	public int countLike(GroupBoardLikeVo groupBoardLikeVo);

}

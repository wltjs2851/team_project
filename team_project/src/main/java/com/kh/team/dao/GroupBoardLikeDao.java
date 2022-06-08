package com.kh.team.dao;

import com.kh.team.vo.GroupBoardLikeVo;

public interface GroupBoardLikeDao {
	
	public void addLike(GroupBoardLikeVo groupBoardLikeVo);
	public void deleteLike(GroupBoardLikeVo groupBoardLikeVo);
	public void updateLike(int gbno);
	public int countLike(GroupBoardLikeVo groupBoardLikeVo);

}

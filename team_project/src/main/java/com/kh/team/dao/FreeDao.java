package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.FreeVo;
import com.kh.team.vo.PagingDto;

public interface FreeDao {
	public boolean insertFreeArticle(FreeVo freeVo);
	public List<FreeVo> selectFreeArticle(PagingDto pagingDto);
	public boolean updateFreeArticle(FreeVo freeVo);
	public boolean deleteFreeArticle(int fno);
	public FreeVo contentByFno(int fno);
	public void updateViewcnt(int fno, int f_viewcnt);
	public List<FreeVo> categoryList();
	public List<FreeVo> selectByViewCnt();
	public boolean insertLike(int fno, String userid);
	public boolean deleteLike(int fno, String userid);
	public boolean deleteLikeAll(int fno);
	public int countLike(int fno, String userid);
	public boolean updateLikecnt(int fno, int f_like);
	public int getCount(PagingDto pagingDto);
	
	// 유저가 작성한 글 찾기 
	public List<FreeVo> adminFreeList(String userid);
}

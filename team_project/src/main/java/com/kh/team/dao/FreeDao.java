package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.FreeVo;

public interface FreeDao {
	public boolean insertFreeArticle(FreeVo freeVo);
	public List<FreeVo> selectFreeArticle();
	public boolean updateFreeArticle(FreeVo freeVo);
	public boolean deleteFreeArticle(int fno);
	public FreeVo contentByFno(int fno);
	public void updateViewcnt(int fno, int f_viewcnt);
	public List<FreeVo> categoryList();
}

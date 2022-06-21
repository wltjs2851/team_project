package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.FreeVo;
import com.kh.team.vo.PagingDto;

public interface FreeService {
	public boolean addFree(FreeVo freeVo);
	public List<FreeVo> freeList(PagingDto pagingDto);
	public boolean modifyFree(FreeVo freeVo);
	public boolean removeFree(int fno);
	public FreeVo contentByFno(int fno);
	public void updateViewcnt(int fno, int f_viewcnt);
	public List<FreeVo> categoryList();
	public List<FreeVo> selectByViewCnt();
	public int countLike(int fno, String userid);
	public boolean decreaseLike(int fno, int f_like, String userid);
	public boolean increaseLike(int fno, int f_like, String userid);
	public int getCount(PagingDto pagingDto);
}

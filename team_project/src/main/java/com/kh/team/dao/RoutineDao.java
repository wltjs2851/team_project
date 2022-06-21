package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineVo;

public interface RoutineDao {
	public boolean insertRoutine(RoutineVo routineVo);
	public List<RoutineVo> selectRoutine(PagingDto pagingDto);
	public boolean updateRoutine(RoutineVo routineVo);
	public boolean deleteRoutine(int uno);
	public RoutineVo contentByUno(int uno);
	public void updateViewcnt(int uno, int ur_viewcnt);
	public List<RoutineVo> selectByViewCnt();
	public boolean insertLike(int uno, String userid);
	public boolean deleteLike(int uno, String userid);
	public boolean deleteLikeAll(int uno);
	public int countLike(int uno, String userid);
	public boolean updateLikecnt(int uno, int ur_like);
	public int getCount(PagingDto pagingDto);
}

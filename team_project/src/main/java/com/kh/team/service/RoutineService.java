package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RoutineVo;

public interface RoutineService {
	public boolean addRoutine(RoutineVo routineVo);
	public List<RoutineVo> routineList(PagingDto pagingDto);
	public boolean modifyRoutine(RoutineVo routineVo);
	public boolean removeRoutine(int uno);
	public RoutineVo contentByUno(int uno);
	public void updateViewcnt(int uno, int ur_viewcnt);
	public List<RoutineVo> selectByViewCnt();
	public int isLike(int uno, String userid);
	public boolean decreaseLike(int uno, int ur_like, String userid);
	public boolean increaseLike(int uno, int ur_like, String userid);
	public int getCount(PagingDto pagingDto);
	
	public List<RoutineVo> adminRoutineList(String userid);
}

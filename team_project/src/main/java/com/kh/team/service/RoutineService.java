package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RoutineVo;

public interface RoutineService {
	public boolean addRoutine(RoutineVo routineVo);
	public List<RoutineVo> routineList();
	public boolean modifyRoutine(RoutineVo routineVo);
	public boolean removeRoutine(int uno);
	public RoutineVo contentByUno(int uno);
	public void updateViewcnt(int uno, int ur_viewcnt);
	public List<RoutineVo> selectByViewCnt();
}

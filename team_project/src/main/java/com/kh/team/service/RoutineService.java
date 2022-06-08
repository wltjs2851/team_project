package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineVo;

public interface RoutineService {
	public boolean addRoutine(RoutineVo routineVo);
	public List<RoutineVo> routineList();
	public boolean moidfyRoutine(RoutineVo routineVo);
	public boolean removeRoutine(int uno);
	public RoutineVo contentByUno(int uno);
	public void updateViewcnt(int uno, int u_viewcnt);
}

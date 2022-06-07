package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineVo;

public interface RoutineDao {
	public boolean insertRoutine(RoutineVo routineVo);
	public List<RoutineVo> selectRoutine();
	public boolean updateRoutine(RoutineVo routineVo);
	public boolean deleteRoutine(int uno);
	public RoutineVo contentByUno(int uno);
	public void updateViewcnt(int uno, int u_viewcnt);
}

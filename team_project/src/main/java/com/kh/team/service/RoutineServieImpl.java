package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RoutineDao;
import com.kh.team.vo.RoutineVo;

@Service
public class RoutineServieImpl implements RoutineService{
	
	@Autowired 
	private RoutineDao routineDao;

	@Override
	public boolean addRoutine(RoutineVo routineVo) {
		return routineDao.insertRoutine(routineVo);
	}

	@Override
	public List<RoutineVo> routineList() {
		return routineDao.selectRoutine();
	}

	@Override
	public boolean moidfyRoutine(RoutineVo routineVo) {
		return routineDao.updateRoutine(routineVo);
	}

	@Override
	public boolean removeRoutine(int uno) {
		return routineDao.deleteRoutine(uno);
	}

	@Override
	public RoutineVo contentByUno(int uno) {
		return routineDao.contentByUno(uno);
	}

	@Override
	public void updateViewcnt(int uno, int u_viewcnt) {
		routineDao.updateViewcnt(uno, u_viewcnt);
	}

}

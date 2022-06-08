package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineVo;

@Repository
public class RoutineDaoImpl implements RoutineDao{
	
	private final String NAMESPACE ="com.kh.team.mappers.userroutine.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertRoutine(RoutineVo routineVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRoutine", routineVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RoutineVo> selectRoutine() {
		List<RoutineVo> list = sqlSession.selectList(NAMESPACE + "selectRoutine");
		return list;
	}

	@Override
	public boolean updateRoutine(RoutineVo routineVo) {
		int count = sqlSession.update(NAMESPACE + "updateRoutine", routineVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRoutine(int uno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRoutine", uno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public RoutineVo contentByUno(int uno) {
		RoutineVo routineVo = sqlSession.selectOne(NAMESPACE + "contentByUno", uno);
		return routineVo;
	}

	@Override
	public void updateViewcnt(int uno, int u_viewcnt) {
		Map<String, Integer> parameter = new HashMap<String, Integer>();
		parameter.put("uno", uno);
		parameter.put("u_viewcnt", u_viewcnt);
		sqlSession.update(NAMESPACE + "updateRecipe", parameter);
	}
}

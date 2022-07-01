package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.PagingDto;
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
	public List<RoutineVo> selectRoutine(PagingDto pagingDto) {
		List<RoutineVo> list = sqlSession.selectList(NAMESPACE + "selectRoutine", pagingDto);
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
	public void updateViewcnt(int uno, int ur_viewcnt) {
		Map<String, Integer> parameter = new HashMap<String, Integer>();
		parameter.put("uno", uno);
		parameter.put("ur_viewcnt", ur_viewcnt);
		sqlSession.update(NAMESPACE + "updateViewcnt", parameter);
	}

	@Override
	public List<RoutineVo> selectByViewCnt() {
		List<RoutineVo> list = sqlSession.selectList(NAMESPACE + "selectByViewCnt");
		return list;
	}

	@Override
	public boolean insertLike(int uno, String nickname) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("uno", uno);
		parameter.put("nickname", nickname);
		int count = sqlSession.insert(NAMESPACE + "insertLike", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLike(int uno, String nickname) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("uno", uno);
		parameter.put("nickname", nickname);
		int count = sqlSession.delete(NAMESPACE + "deleteLike", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int countLike(int uno, String nickname) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("uno", uno);
		parameter.put("nickname", nickname);
		int count = sqlSession.selectOne(NAMESPACE + "countLike", parameter);
		return count;
	}

	@Override
	public boolean updateLikecnt(int uno, int ur_like) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("uno", uno);
		parameter.put("ur_like", ur_like);
		int count = sqlSession.update(NAMESPACE + "updateLikecnt", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public boolean deleteLikeAll(int uno) {
		int count = sqlSession.delete(NAMESPACE + "deleteLikeAll", uno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RoutineVo> adminRoutineList(String nickname) {
		List<RoutineVo> adminRoutineList = sqlSession.selectList(NAMESPACE + "adminRoutineList", nickname);
		return adminRoutineList;
	}
}

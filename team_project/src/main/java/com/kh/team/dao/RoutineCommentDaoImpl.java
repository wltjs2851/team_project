package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RoutineCommentVo;

@Repository
public class RoutineCommentDaoImpl implements RoutineCommentDao{

	private final String NAMESPACE ="com.kh.team.mappers.routinecomment.";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean insertRoutineComment(RoutineCommentVo routineCommentVo) {
		System.out.println(routineCommentVo);
		int count = sqlSession.insert(NAMESPACE + "insertRoutineComment", routineCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RoutineCommentVo> commentRoutineList(int uno) {
		List<RoutineCommentVo> list = sqlSession.selectList(NAMESPACE + "commentRoutineList", uno);
		return list;
	}

	@Override
	public boolean updateRoutineComment(RoutineCommentVo routineCommentVo) {
		int count = sqlSession.update(NAMESPACE + "udpateRoutineComment", routineCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRoutineComment(int urcno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRoutineComment", urcno);
		if(count > 0) {
			return true;
		}
		return false;
	}

}

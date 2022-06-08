package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RoutineCommentVo;

public interface RoutineCommentDao {
	public boolean insertRoutineComment(RoutineCommentVo routineCommentVo);
	public List<RoutineCommentVo> commentRoutineList(int uno);
	public boolean updateRoutineComment(RoutineCommentVo routineCommentVo);
	public boolean deleteRoutineComment(int urcno);
}

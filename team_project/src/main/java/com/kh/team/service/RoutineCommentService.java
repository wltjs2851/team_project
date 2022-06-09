package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RoutineCommentVo;

public interface RoutineCommentService {
	public boolean addRoutineComment(RoutineCommentVo routineCommentVo);
	public List<RoutineCommentVo> selectRoutineCommentList(int uno);
	public boolean modifyRoutineComment(RoutineCommentVo routineCommentVo);
	public boolean removeRoutineComment(int urcno);

}

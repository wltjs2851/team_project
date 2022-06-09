package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RoutineCommentDao;
import com.kh.team.vo.RoutineCommentVo;

@Service
public class RoutineCommentServiceImpl implements RoutineCommentService{
	
	@Autowired
	private RoutineCommentDao routineCommentDao;

	@Override
	public boolean addRoutineComment(RoutineCommentVo routineCommentVo) {
		System.out.println(routineCommentVo);
		return routineCommentDao.insertRoutineComment(routineCommentVo);
	}

	@Override
	public List<RoutineCommentVo> selectRoutineCommentList(int uno) {
		return routineCommentDao.commentRoutineList(uno);
	}

	@Override
	public boolean modifyRoutineComment(RoutineCommentVo routineCommentVo) {
		return routineCommentDao.updateRoutineComment(routineCommentVo);
	}

	@Override
	public boolean removeRoutineComment(int urcno) {
		return routineCommentDao.deleteRoutineComment(urcno);
	}

}

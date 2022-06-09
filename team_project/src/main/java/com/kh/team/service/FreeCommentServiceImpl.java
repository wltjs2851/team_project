package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.FreeCommentDao;
import com.kh.team.vo.FreeCommentVo;

@Service
public class FreeCommentServiceImpl implements FreeCommentService{

	@Autowired
	FreeCommentDao freeCommentDao;
	
	@Override
	public boolean addFreeComment(FreeCommentVo freeCommentVo) {
		return freeCommentDao.insertFreeComment(freeCommentVo);
	}

	@Override
	public List<FreeCommentVo> commentFreeList(int fno) {
		return freeCommentDao.commentFreeList(fno);
	}

	@Override
	public boolean modifyFreeComment(FreeCommentVo freeCommentVo) {
		return freeCommentDao.updateFreeComment(freeCommentVo);
	}

	@Override
	public boolean removeFreeComment(int fcno) {
		return freeCommentDao.deleteFreeComment(fcno);
	}

}

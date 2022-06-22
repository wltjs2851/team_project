package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.FreeCommentVo;

@Repository
public class FreeCommentDaoImpl implements FreeCommentDao{
	private final String NAMESPACE = "com.kh.team.mappers.freecomment.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertFreeComment(FreeCommentVo freeCommentVo) {
		int count = sqlSession.insert(NAMESPACE + "insertFreeComment", freeCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<FreeCommentVo> commentFreeList(int fno) {
		List<FreeCommentVo> list = sqlSession.selectList(NAMESPACE + "commentFreeList", fno);
		return list;
	}

	@Override
	public boolean updateFreeComment(FreeCommentVo freeCommentVo) {
		int count = sqlSession.update(NAMESPACE + "udpateFreeComment", freeCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteFreeComment(int fcno) {
		int count = sqlSession.update(NAMESPACE + "deleteFreeComment", fcno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteFreeCommentAll(int fno) {
		int count = sqlSession.update(NAMESPACE + "deleteFreeCommentAll", fno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<FreeCommentVo> adminFreeComment(String userid) {
		List<FreeCommentVo> adminFreeComment = sqlSession.selectList(NAMESPACE + "adminFreeComment", userid);
		return adminFreeComment;
	}

}

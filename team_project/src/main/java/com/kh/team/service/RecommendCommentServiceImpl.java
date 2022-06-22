package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RecommendCommentDao;
import com.kh.team.vo.RecommendCommentVo;

@Service
public class RecommendCommentServiceImpl implements RecommendCommentService{
	
	@Autowired
	private RecommendCommentDao recommendCommentDao;
	
	@Override
	public boolean insertRecommendComment(RecommendCommentVo recommendCommentVo) {
		return recommendCommentDao.insertRecommendComment(recommendCommentVo);
	}

	@Override
	public boolean udpateRecommendComment(RecommendCommentVo recommendCommentVo) {
		return recommendCommentDao.udpateRecommendComment(recommendCommentVo);
	}

	@Override
	public boolean deleteRecommendCommnet(int recno) {
		return recommendCommentDao.deleteRecommendCommnet(recno);
	}

	@Override
	public List<RecommendCommentVo> recommendCommentList(int reno) {
		return recommendCommentDao.recommendCommentList(reno);
	}

	@Override
	public List<RecommendCommentVo> adminRecommendComment(String userid) {
		return recommendCommentDao.adminRecommendComment(userid);
	}

}

package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RecommendLikeDao;
import com.kh.team.vo.RecommendLikeVo;
import com.kh.team.vo.RecommendVo;

@Service
public class RecommendLikeServiceImpl implements RecommendLikeService{
	
	@Autowired
	private RecommendLikeDao reLikeDao;
	
	@Override
	public void insertRecommendLike(RecommendLikeVo reLikeVo) throws Exception {
		reLikeDao.insertRecommendLike(reLikeVo);
		reLikeDao.updateRecommendLike(reLikeVo.getReno());
	}

	@Override
	public void deleteRecommendLike(RecommendLikeVo reLikeVo) throws Exception {
		reLikeDao.deleteRecommendLike(reLikeVo);
		reLikeDao.updateRecommendLike(reLikeVo.getReno());
	}

	@Override
	public int getRecommendLike(RecommendLikeVo reLikeVo) throws Exception {
		
		return reLikeDao.getRecommendLike(reLikeVo);
	}

	@Override
	public void updateRecommendLike(int reno) throws Exception {
		
	}

}

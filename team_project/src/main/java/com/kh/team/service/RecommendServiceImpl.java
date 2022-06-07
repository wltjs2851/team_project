package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RecommendDao;
import com.kh.team.vo.RecommendVo;

@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendDao recommendDao;
	@Override
	public boolean insertRecommend(RecommendVo recommendVo) {
		boolean result = recommendDao.insertRecommend(recommendVo);
		return result;
	}

	@Override
	public boolean updateRecommend(RecommendVo recommendVo) {
		boolean result = recommendDao.updateRecommend(recommendVo);
		return result;
	}

	@Override
	public boolean deleteRecommend(int reno) {
		boolean result = recommendDao.deleteRecommend(reno);
		return result;
	}

	@Override
	public RecommendVo selectByReno(int reno) {
		RecommendVo recommendVo = recommendDao.selectByReno(reno);
		return recommendVo;
	}

	@Override
	public List<RecommendVo> listRecommend() {
		List<RecommendVo> listRecommend = recommendDao.listRecommend();
		return listRecommend;
	}

	@Override
	public List<RecommendVo> selectByViewCnt() {
		List<RecommendVo> listRecommend = recommendDao.selectByViewCnt();
		return listRecommend;
	}

}

package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.RecommendDao;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecommendVo;

@Service
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private RecommendDao recommendDao;
	
	// 글 작성
	@Override
	public boolean insertRecommend(RecommendVo recommendVo) {
		boolean result = recommendDao.insertRecommend(recommendVo);
		return result;
	}

	// 글 수정
	@Override
	public boolean updateRecommend(RecommendVo recommendVo) {
		boolean result = recommendDao.updateRecommend(recommendVo);
		return result;
	}

	// 글 삭제
	@Override
	public boolean deleteRecommend(int reno) {
		boolean result = recommendDao.deleteRecommend(reno);
		return result;
	}

	// 글 조회
	@Override
	@Transactional
	public RecommendVo selectByReno(int reno) {
		// 조회수
		recommendDao.updateViewCnt(reno);
		RecommendVo recommendVo = recommendDao.selectByReno(reno);
		return recommendVo;
	}
	
	// 글 목록
	@Override
	public List<RecommendVo> listRecommend(PagingDto pagingDto) {
		List<RecommendVo> listRecommend = recommendDao.listRecommend(pagingDto);
		return listRecommend;
	}

	@Override
	public List<RecommendVo> selectByViewCnt() {
		List<RecommendVo> listRecommend = recommendDao.selectByViewCnt();
		return listRecommend;
	}

	@Override
	public int getCountRecommend(PagingDto pagingDto) {
		return recommendDao.getCountRecommend(pagingDto);
	}

}

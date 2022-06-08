package com.kh.team.service;

import com.kh.team.vo.RecommendLikeVo;
import com.kh.team.vo.RecommendVo;

public interface RecommendLikeService {
	// 추천 운동게시판 좋아요 기능
	
		// 좋아요
		public void insertRecommendLike(RecommendLikeVo reLikeVo) throws Exception;
		
		// 좋아요 취소
		public void deleteRecommendLike(RecommendLikeVo reLikeVo) throws Exception;
		
		// 좋아요 얼마나?
		public int getRecommendLike(RecommendLikeVo reLikeVo) throws Exception;
		
		// 좋아요 업데이트
		public void updateRecommendLike(int reno) throws Exception;
}

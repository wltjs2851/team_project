package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecommendVo;

public interface RecommendService {
	// 추천 운동 게시판
	
		// 글 작성 
		public boolean insertRecommend(RecommendVo recommendVo);
		
		// 글 수정
		public boolean updateRecommend(RecommendVo recommendVo);
		
		// 글 삭제 
		public boolean deleteRecommend(int reno);
		
		// 상세 내용 조회
		public RecommendVo selectByReno(int reno);
		
		// 글 목록
		public List<RecommendVo> listRecommend();
		
		public List<RecommendVo> selectByViewCnt();
}

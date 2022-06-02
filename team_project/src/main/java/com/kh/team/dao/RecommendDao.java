package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecommendVo;


public interface RecommendDao {
	// 추천 운동 게시판
	
	// 글 작성 
	public boolean insertRecommend(RecommendVo recommendVo);
	
	// 글 수정
	public boolean updateRecommend(RecommendVo recommendVo);
	
	// 글 삭제 
	public boolean deleteRecommend(int reno);
	
	// 상세 내용 조회
	public RecommendVo selectByKno(int reno);
	
	// 글 목록
	public List<RecommendVo> listRecommend();
}

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
	public RecommendVo selectByReno(int reno);
	
	// 글 목록
	public List<RecommendVo> listRecommend();
	
	// 글 하나에 대한 조회수
	public void updateViewCnt(int reno);
	
	// 조회수 3개조회
	public List<RecommendVo> selectByViewCnt();
	
}

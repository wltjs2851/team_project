package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecommendCommentVo;

public interface RecommendCommentService {
	// 추천 운동 게시판 댓글 기능
		public boolean insertRecommendComment(RecommendCommentVo recommendCommentVo);
		public boolean udpateRecommendComment(RecommendCommentVo recommendCommentVo);
		public boolean deleteRecommendCommnet(int recno);
		public List<RecommendCommentVo> recommendCommentList(int reno);
		
		public List<RecommendCommentVo> adminRecommendComment(String nickname);
}

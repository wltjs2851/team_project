package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.service.RecommendCommentService;
import com.kh.team.vo.RecommendCommentVo;

@RestController
@RequestMapping("/reccomment")
public class RecommendCommentController {
	
	@Autowired
	private RecommendCommentService recommendCommentService;
	
	// 댓글 달기 
	
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	@ResponseBody
	public String insertRecommendComment(RecommendCommentVo recommendCommentVo) {
		System.out.println("insertComment, recommendCommentVo" + recommendCommentVo);
		boolean result = recommendCommentService.insertRecommendComment(recommendCommentVo);
		System.out.println("insertComment, result" + result);
		return String.valueOf(result);
	}
	
	// 댓글 목록
	@RequestMapping(value = "/listComment/{reno}", method = RequestMethod.GET)
	public List<RecommendCommentVo> recommendCommentList (@PathVariable("reno") int reno) {
		List<RecommendCommentVo> recommendCommentList = 
				recommendCommentService.recommendCommentList(reno);
		return recommendCommentList;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/deleteComment/{recno}", method = RequestMethod.GET)
	public String deleteComment(@PathVariable("recno") int recno){
		boolean result = recommendCommentService.deleteRecommendCommnet(recno);
		return String.valueOf(result);
	}
	
	// 댓글 수정
		@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
		public String updateComment(RecommendCommentVo recommendCommentVo){
			boolean result = recommendCommentService.udpateRecommendComment(recommendCommentVo);
			return String.valueOf(result);
//			return "redirect:/reccomment/listComment";
		}
}

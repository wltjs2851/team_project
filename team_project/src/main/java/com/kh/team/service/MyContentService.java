package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.FreeCommentVo;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardCommentVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendCommentVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;

public interface MyContentService {
	
//	좋아요 한 글
	public List<FreeVo> getFreeByLike(String userid);
	public List<GroupBoardVo> getGroupBoardByLike(String userid);
	public List<RecipeVo> getRecipeByLike(String userid);
	public List<RoutineVo> getRoutineByLike(String userid);
	public List<RecommendVo> getRecommendByLike(String userid);
	
//	내가 쓴 글
	public List<FreeVo> getWriteFree(String userid);
	public List<GroupBoardVo> getWriteGroupBoard(String userid);
	public List<RecipeVo> getWriteRecipe(String userid);
	public List<RoutineVo> getWriteRoutine(String userid);
	public List<RecommendVo> getWriteRecommend(String userid);

// 내가 쓴 댓글
	public List<FreeCommentVo> getFreeComment(String userid);
	public List<GroupBoardCommentVo> getGroupBoardComment(String userid);
	public List<RecipeCommentVo> getRecipeComment(String userid);
	public List<RoutineCommentVo> getRoutineComment(String userid);
	public List<RecommendCommentVo> getRecommendComment(String userid);
	public int gnoByGroupComment(int gbno);
		
}

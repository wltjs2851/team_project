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
	public List<FreeVo> getFreeByLike(String nickname);
	public List<GroupBoardVo> getGroupBoardByLike(String nickname);
	public List<RecipeVo> getRecipeByLike(String nickname);
	public List<RoutineVo> getRoutineByLike(String nickname);
	public List<RecommendVo> getRecommendByLike(String nickname);
	
//	내가 쓴 글
	public List<FreeVo> getWriteFree(String nickname);
	public List<GroupBoardVo> getWriteGroupBoard(String nickname);
	public List<RecipeVo> getWriteRecipe(String nickname);
	public List<RoutineVo> getWriteRoutine(String nickname);
	public List<RecommendVo> getWriteRecommend(String nickname);

// 내가 쓴 댓글
	public List<FreeCommentVo> getFreeComment(String nickname);
	public List<GroupBoardCommentVo> getGroupBoardComment(String nickname);
	public List<RecipeCommentVo> getRecipeComment(String nickname);
	public List<RoutineCommentVo> getRoutineComment(String nickname);
	public List<RecommendCommentVo> getRecommendComment(String nickname);
	public int gnoByGroupComment(int gbno);
		
}

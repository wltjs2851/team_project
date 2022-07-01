package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;

public interface RecipeCommentService {
	public boolean addRecipeComment(RecipeCommentVo commentVo);
	public List<RecipeCommentVo> selectRecipeCommentList(int rno);
	public boolean modifyRecipeComment(RecipeCommentVo commentVo);
	public boolean removeRecipeComment(int rcno);
	
	public List<RecipeCommentVo> adminRecipeComment(String nickname);
}

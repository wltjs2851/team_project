package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecommendCommentVo;


public interface RecipeCommentDao {
	public boolean insertRecipeComment(RecipeCommentVo commentVo);
	public List<RecipeCommentVo> commentRecipeList(int rno);
	public boolean udpateRecipeComment(RecipeCommentVo commentVo);
	public boolean deleteRecipeComment(int rcno);
	public boolean deleteRecipeCommentAll(int rno);
	
	public List<RecipeCommentVo> adminRecipeComment(String nickname);
}

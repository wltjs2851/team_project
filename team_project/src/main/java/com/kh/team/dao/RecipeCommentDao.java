package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeCommentVo;


public interface RecipeCommentDao {
	public boolean insertRecipeComment(RecipeCommentVo commentVo);
	public List<RecipeCommentVo> commentRecipeList(int rno);
	public boolean udpateRecipeComment(RecipeCommentVo commentVo);
	public boolean deleteRecipeComment(int rcno);
}

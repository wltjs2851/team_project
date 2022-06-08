package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.RecipeVo;

public interface RecipeService {
	public boolean addRecipe(RecipeVo recipeVo);
	public List<RecipeVo> recipeList();
	public boolean moidfyRecipe(RecipeVo recipeVo);
	public boolean removeRecipe(int rno);
	public RecipeVo contentByRno(int rno);
	public List<RecipeVo> selectByViewCnt();
}

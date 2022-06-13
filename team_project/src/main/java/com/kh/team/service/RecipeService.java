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
	public void updateViewcnt(int rno, int r_viewcnt);
	public int isLike(int rno, String userid);
	public boolean decreaseLike(int rno, int r_like, String userid);
	public boolean increaseLike(int rno, int r_like, String userid);
}

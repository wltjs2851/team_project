package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.RecipeVo;

public interface RecipeDao {
	public boolean insertRecipe(RecipeVo recipeVo);
	public List<RecipeVo> selectRecipe();
	public boolean updateRecipe(RecipeVo recipeVo);
	public boolean deleteRecipe(int rno);
	public RecipeVo contentByRno(int gno);
	public void updateViewcnt(int rno, int r_viewcnt);
	public List<RecipeVo> selectByViewCnt();
	public int countComment(int rno, String userid);
	public boolean insertLike(int rno, String userid);
	public boolean deleteLike(int rno, String userid);
	public int countLike(int rno, String userid);
	public boolean updateLikecnt(int rno, int r_like);
}

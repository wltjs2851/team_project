package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupVo;
import com.kh.team.vo.RecipeVo;

public interface RecipeDao {
	public boolean insertRecipe(RecipeVo recipeVo);
	public List<RecipeVo> selectRecipe();
	public boolean updateRecipe(RecipeVo recipeVo);
	public boolean deleteRecipe(int rno);
	public RecipeVo contentByRno(int gno);
	public void updateViewcnt(int rno, int r_viewcnt);
}

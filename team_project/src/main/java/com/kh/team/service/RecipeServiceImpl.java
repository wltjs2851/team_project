package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RecipeDao;
import com.kh.team.vo.RecipeVo;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Autowired 
	private RecipeDao recipeDao;

	@Override
	public boolean addRecipe(RecipeVo recipeVo) {
		return recipeDao.insertRecipe(recipeVo);
	}

	@Override
	public List<RecipeVo> recipeList() {
		return recipeDao.selectRecipe();
	}

	@Override
	public boolean moidfyRecipe(RecipeVo recipeVo) {
		return recipeDao.updateRecipe(recipeVo);
	}

	@Override
	public boolean removeRecipe(int rno) {
		return recipeDao.deleteRecipe(rno);
	}

	@Override
	public RecipeVo contentByRno(int rno) {
		return recipeDao.contentByRno(rno);
	}

	@Override
	public List<RecipeVo> selectByViewCnt() {
		return recipeDao.selectByViewCnt();
	}

}

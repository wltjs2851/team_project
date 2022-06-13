package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int isLike(int rno, String userid) {
		return recipeDao.countLike(rno, userid);
	}

	@Override
	@Transactional
	public boolean decreaseLike(int rno, int r_like, String userid) {
		boolean resultDelete = recipeDao.deleteLike(rno, userid);
		boolean resultUpdate = recipeDao.updateLikecnt(rno, r_like - 1);
		if(resultDelete && resultUpdate) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean increaseLike(int rno, int r_like, String userid) {
		boolean resultInsert = recipeDao.insertLike(rno, userid);
		boolean resultUpdate = recipeDao.updateLikecnt(rno, r_like + 1);
		if(resultInsert && resultUpdate) {
			return false;
		}
		return true;
	}

}

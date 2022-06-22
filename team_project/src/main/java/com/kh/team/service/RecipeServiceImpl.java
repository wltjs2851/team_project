package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.RecipeDao;
import com.kh.team.vo.PagingDto;
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
	public List<RecipeVo> recipeList(PagingDto pagingDto) {
		return recipeDao.selectRecipe(pagingDto);
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
	public void updateViewcnt(int rno, int r_viewcnt) {
		recipeDao.updateViewcnt(rno, r_viewcnt);
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

	@Override
	public int getCount(PagingDto pagingDto) {
		return recipeDao.getCount(pagingDto);
	}

	@Override
	public List<RecipeVo> adminRecipeList(String userid) {
		return recipeDao.adminRecipeList(userid);
	}

}

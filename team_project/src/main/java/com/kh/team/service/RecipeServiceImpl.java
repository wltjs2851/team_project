package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.RecipeCommentDao;
import com.kh.team.dao.RecipeDao;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeVo;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Autowired 
	private RecipeDao recipeDao;
	
	@Autowired 
	private RecipeCommentDao recipeCommentDao;

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
		boolean deleteComment = recipeCommentDao.deleteRecipeCommentAll(rno);
		boolean deleteLike = recipeDao.deleteLikeAll(rno);
		boolean deleteRecipe = recipeDao.deleteRecipe(rno);
		if(deleteComment && deleteLike && deleteRecipe) {
			return true;
		}
		return false;
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
	public int isLike(int rno, String nickname) {
		return recipeDao.countLike(rno, nickname);
	}

	@Override
	@Transactional
	public boolean decreaseLike(int rno, int r_like, String nickname) {
		boolean resultDelete = recipeDao.deleteLike(rno, nickname);
		boolean resultUpdate = recipeDao.updateLikecnt(rno, r_like - 1);
		if(resultDelete && resultUpdate) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean increaseLike(int rno, int r_like, String nickname) {
		boolean resultInsert = recipeDao.insertLike(rno, nickname);
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
	public List<RecipeVo> adminRecipeList(String nickname) {
		return recipeDao.adminRecipeList(nickname);
	}

}

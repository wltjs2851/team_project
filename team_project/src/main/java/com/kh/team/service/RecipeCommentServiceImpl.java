package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.RecipeCommentDao;
import com.kh.team.vo.RecipeCommentVo;

@Service
public class RecipeCommentServiceImpl implements RecipeCommentService{
	
	@Autowired
	RecipeCommentDao recipeCommentDao;

	@Override
	public boolean addRecipeComment(RecipeCommentVo commentVo) {
		return recipeCommentDao.insertRecipeComment(commentVo);
	}

	@Override
	public List<RecipeCommentVo> selectRecipeCommentList(int rno) {
		return recipeCommentDao.commentRecipeList(rno);
	}

	@Override
	public boolean modifyRecipeComment(RecipeCommentVo commentVo) {
		return recipeCommentDao.udpateRecipeComment(commentVo);
	}

	@Override
	public boolean removeRecipeComment(int rcno) {
		return recipeCommentDao.deleteRecipeComment(rcno);
	}

	@Override
	public List<RecipeCommentVo> adminRecipeComment(String nickname) {
		return recipeCommentDao.adminRecipeComment(nickname);
	}

}

package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecipeCommentVo;

@Repository
public class RecipeCommentDaoImpl implements RecipeCommentDao{
	
	private final String NAMESPACE = "com.kh.team.mappers.recipecomment.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertRecipeComment(RecipeCommentVo commentVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRecipeComment", commentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RecipeCommentVo> commentRecipeList(int rno) {
		List<RecipeCommentVo> list = sqlSession.selectList(NAMESPACE + "commentRecipeList", rno);
		return list;
	}

	@Override
	public boolean udpateRecipeComment(RecipeCommentVo commentVo) {
		int count = sqlSession.update(NAMESPACE + "udpateRecipeComment", commentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRecipeComment(int rcno) {
		int count = sqlSession.delete(NAMESPACE, rcno);
		if(count > 0) {
			return true;
		}
		return false;
	}

}

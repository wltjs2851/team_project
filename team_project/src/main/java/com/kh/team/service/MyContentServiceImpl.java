package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MyContentDao;
import com.kh.team.vo.FreeCommentVo;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardCommentVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendCommentVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;

@Service
public class MyContentServiceImpl implements MyContentService {
	
	@Autowired
	private MyContentDao dao;

	@Override
	public List<FreeVo> getFreeByLike(String userid) {
		return dao.getFreeByLike(userid);
	}

	@Override
	public List<GroupBoardVo> getGroupBoardByLike(String userid) {
		return dao.getGroupBoardByLike(userid);
	}

	@Override
	public List<RecipeVo> getRecipeByLike(String userid) {
		return dao.getRecipeByLike(userid);
	}

	@Override
	public List<RoutineVo> getRoutineByLike(String userid) {
		return dao.getRoutineByLike(userid);
	}

	@Override
	public List<RecommendVo> getRecommendByLike(String userid) {
		return dao.getRecommendByLike(userid);
	}

	@Override
	public List<FreeVo> getWriteFree(String userid) {
		return dao.getWriteFree(userid);
	}

	@Override
	public List<GroupBoardVo> getWriteGroupBoard(String userid) {
		return dao.getWriteGroupBoard(userid);
	}

	@Override
	public List<RecipeVo> getWriteRecipe(String userid) {
		return dao.getWriteRecipe(userid);
	}

	@Override
	public List<RoutineVo> getWriteRoutine(String userid) {
		return dao.getWriteRoutine(userid);
	}

	@Override
	public List<RecommendVo> getWriteRecommend(String userid) {
		return dao.getWriteRecommend(userid);
	}

	@Override
	public List<FreeCommentVo> getFreeComment(String userid) {
		return dao.getFreeComment(userid);
	}

	@Override
	public List<GroupBoardCommentVo> getGroupBoardComment(String userid) {
		return dao.getGroupBoardComment(userid);
	}

	@Override
	public List<RecipeCommentVo> getRecipeComment(String userid) {
		return dao.getRecipeComment(userid);
	}

	@Override
	public List<RoutineCommentVo> getRoutineComment(String userid) {
		return dao.getRoutineComment(userid);
	}

	@Override
	public List<RecommendCommentVo> getRecommendComment(String userid) {
		return dao.getRecommendComment(userid);
	}

}

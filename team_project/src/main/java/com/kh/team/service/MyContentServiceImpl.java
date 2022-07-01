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
	public List<FreeVo> getFreeByLike(String nickname) {
		return dao.getFreeByLike(nickname);
	}

	@Override
	public List<GroupBoardVo> getGroupBoardByLike(String nickname) {
		return dao.getGroupBoardByLike(nickname);
	}

	@Override
	public List<RecipeVo> getRecipeByLike(String nickname) {
		return dao.getRecipeByLike(nickname);
	}

	@Override
	public List<RoutineVo> getRoutineByLike(String nickname) {
		return dao.getRoutineByLike(nickname);
	}

	@Override
	public List<RecommendVo> getRecommendByLike(String nickname) {
		return dao.getRecommendByLike(nickname);
	}

	@Override
	public List<FreeVo> getWriteFree(String nickname) {
		return dao.getWriteFree(nickname);
	}

	@Override
	public List<GroupBoardVo> getWriteGroupBoard(String nickname) {
		return dao.getWriteGroupBoard(nickname);
	}

	@Override
	public List<RecipeVo> getWriteRecipe(String nickname) {
		return dao.getWriteRecipe(nickname);
	}

	@Override
	public List<RoutineVo> getWriteRoutine(String nickname) {
		return dao.getWriteRoutine(nickname);
	}

	@Override
	public List<RecommendVo> getWriteRecommend(String nickname) {
		return dao.getWriteRecommend(nickname);
	}

	@Override
	public List<FreeCommentVo> getFreeComment(String nickname) {
		return dao.getFreeComment(nickname);
	}

	@Override
	public List<GroupBoardCommentVo> getGroupBoardComment(String nickname) {
		return dao.getGroupBoardComment(nickname);
	}

	@Override
	public List<RecipeCommentVo> getRecipeComment(String nickname) {
		return dao.getRecipeComment(nickname);
	}

	@Override
	public List<RoutineCommentVo> getRoutineComment(String nickname) {
		return dao.getRoutineComment(nickname);
	}

	@Override
	public List<RecommendCommentVo> getRecommendComment(String nickname) {
		return dao.getRecommendComment(nickname);
	}

	@Override
	public int gnoByGroupComment(int gbno) {
		return dao.gnoByGroupComment(gbno);
	}

}

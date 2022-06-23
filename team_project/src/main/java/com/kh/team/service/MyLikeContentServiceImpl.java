package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MyLikeContentDao;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineVo;

@Service
public class MyLikeContentServiceImpl implements MyLikeContentService {
	
	@Autowired
	private MyLikeContentDao dao;

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
	
}

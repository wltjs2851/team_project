package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineVo;

public interface MyLikeContentDao {

	public List<FreeVo> getFreeByLike(String userid);
	public List<GroupBoardVo> getGroupBoardByLike(String userid);
	public List<RecipeVo> getRecipeByLike(String userid);
	public List<RoutineVo> getRoutineByLike(String userid);
	public List<RecommendVo> getRecommendByLike(String userid);
	
}

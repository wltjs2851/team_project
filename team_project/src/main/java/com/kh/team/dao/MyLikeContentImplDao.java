package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineVo;

@Repository
public class MyLikeContentImplDao implements MyLikeContentDao {
	
	private final String NAMESPACE = "com.kh.team.mappers.myLikeContent.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FreeVo> getFreeByLike(String userid) {
		return sqlSession.selectList(NAMESPACE + "getFreeByLike", userid);
	}

	@Override
	public List<GroupBoardVo> getGroupBoardByLike(String userid) {
		return sqlSession.selectList(NAMESPACE + "getGroupBoardByLike", userid);
	}

	@Override
	public List<RecipeVo> getRecipeByLike(String userid) {
		return sqlSession.selectList(NAMESPACE + "getRecipeByLike", userid);
	}

	@Override
	public List<RoutineVo> getRoutineByLike(String userid) {
		return sqlSession.selectList(NAMESPACE + "getRoutineByLike", userid);
	}

	@Override
	public List<RecommendVo> getRecommendByLike(String userid) {
		return sqlSession.selectList(NAMESPACE + "getRecommendByLike", userid);
	}

}

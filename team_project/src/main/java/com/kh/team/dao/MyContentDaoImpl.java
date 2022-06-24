package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class MyContentDaoImpl implements MyContentDao {
	
	private final String NAMESPACE = "com.kh.team.mappers.myContent.";
	
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

	@Override
	public List<FreeVo> getWriteFree(String userid) {
		return sqlSession.selectList(NAMESPACE + "getWriteFree", userid);
	}

	@Override
	public List<GroupBoardVo> getWriteGroupBoard(String userid) {
		return sqlSession.selectList(NAMESPACE + "getWriteGroupBoard", userid);
	}

	@Override
	public List<RecipeVo> getWriteRecipe(String userid) {
		return sqlSession.selectList(NAMESPACE + "getWriteRecipe", userid);
	}

	@Override
	public List<RoutineVo> getWriteRoutine(String userid) {
		return sqlSession.selectList(NAMESPACE + "getWriteRoutine", userid);
	}

	@Override
	public List<RecommendVo> getWriteRecommend(String userid) {
		return sqlSession.selectList(NAMESPACE + "getWriteRecommend", userid);
	}

	@Override
	public List<FreeCommentVo> getFreeComment(String userid) {
		return sqlSession.selectList(NAMESPACE + "getFreeComment", userid);
	}

	@Override
	public List<GroupBoardCommentVo> getGroupBoardComment(String userid) {
		return sqlSession.selectList(NAMESPACE + "getGroupBoardComment", userid);
	}

	@Override
	public List<RecipeCommentVo> getRecipeComment(String userid) {
		return sqlSession.selectList(NAMESPACE + "getRecipeComment", userid);
	}

	@Override
	public List<RoutineCommentVo> getRoutineComment(String userid) {
		return sqlSession.selectList(NAMESPACE + "getRoutineComment", userid);
	}

	@Override
	public List<RecommendCommentVo> getRecommendComment(String userid) {
		return sqlSession.selectList(NAMESPACE + "getRecommendComment", userid);
	}

}

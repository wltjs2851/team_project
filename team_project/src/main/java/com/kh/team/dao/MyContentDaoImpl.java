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
	public List<FreeVo> getFreeByLike(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getFreeByLike", nickname);
	}

	@Override
	public List<GroupBoardVo> getGroupBoardByLike(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getGroupBoardByLike", nickname);
	}

	@Override
	public List<RecipeVo> getRecipeByLike(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getRecipeByLike", nickname);
	}

	@Override
	public List<RoutineVo> getRoutineByLike(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getRoutineByLike", nickname);
	}

	@Override
	public List<RecommendVo> getRecommendByLike(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getRecommendByLike", nickname);
	}

	@Override
	public List<FreeVo> getWriteFree(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getWriteFree", nickname);
	}

	@Override
	public List<GroupBoardVo> getWriteGroupBoard(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getWriteGroupBoard", nickname);
	}

	@Override
	public List<RecipeVo> getWriteRecipe(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getWriteRecipe", nickname);
	}

	@Override
	public List<RoutineVo> getWriteRoutine(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getWriteRoutine", nickname);
	}

	@Override
	public List<RecommendVo> getWriteRecommend(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getWriteRecommend", nickname);
	}

	@Override
	public List<FreeCommentVo> getFreeComment(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getFreeComment", nickname);
	}

	@Override
	public List<GroupBoardCommentVo> getGroupBoardComment(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getGroupBoardComment", nickname);
	}

	@Override
	public List<RecipeCommentVo> getRecipeComment(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getRecipeComment", nickname);
	}

	@Override
	public List<RoutineCommentVo> getRoutineComment(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getRoutineComment", nickname);
	}

	@Override
	public List<RecommendCommentVo> getRecommendComment(String nickname) {
		return sqlSession.selectList(NAMESPACE + "getRecommendComment", nickname);
	}

	@Override
	public int gnoByGroupComment(int gbno) {
		return sqlSession.selectOne(NAMESPACE + "gnoByGroupComment", gbno);
	}

}

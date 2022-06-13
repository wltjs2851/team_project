package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecipeVo;

@Repository
public class RecipeDaoImpl implements RecipeDao{
	
	private final String NAMESPACE ="com.kh.team.mappers.recipe.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertRecipe(RecipeVo recipeVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRecipe", recipeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RecipeVo> selectRecipe() {
		List<RecipeVo> list = sqlSession.selectList(NAMESPACE + "selectRecipe");
		return list;
	}

	@Override
	public boolean updateRecipe(RecipeVo recipeVo) {
		int count = sqlSession.update(NAMESPACE + "updateRecipe", recipeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRecipe(int rno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRecipe", rno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public RecipeVo contentByRno(int rno) {
		RecipeVo recipeVo = sqlSession.selectOne(NAMESPACE + "contentByRno", rno);
		return recipeVo;
	}

	@Override
	public void updateViewcnt(int rno, int r_viewcnt) {
		Map<String, Integer> parameter = new HashMap<String, Integer>();
		parameter.put("rno", rno);
		parameter.put("r_viewcnt", r_viewcnt);
		sqlSession.update(NAMESPACE + "updateViewcnt", parameter);
	}

	@Override
	public List<RecipeVo> selectByViewCnt() {
		List<RecipeVo> list = sqlSession.selectList(NAMESPACE + "selectByViewCnt");
		return list;
	}

	@Override
	public int countComment(int rno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("rno", rno);
		parameter.put("userid", userid);
		int count = sqlSession.selectOne(NAMESPACE + "countComment", parameter);
		return count;
	}

	@Override
	public boolean insertLike(int rno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("rno", rno);
		parameter.put("userid", userid);
		int count = sqlSession.insert(NAMESPACE + "insertLike", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLike(int rno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("rno", rno);
		parameter.put("userid", userid);
		int count = sqlSession.delete(NAMESPACE + "deleteLike", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	// 키보드가 정말 별로인데요!

	@Override
	public int countLike(int rno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("rno", rno);
		parameter.put("userid", userid);
		int count = sqlSession.selectOne(NAMESPACE + "countLike", parameter);
		return count;
	}

	@Override
	public boolean updateLikecnt(int rno, int r_like) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("rno", rno);
		parameter.put("r_like", r_like);
		int count = sqlSession.update(NAMESPACE + "updateLikecnt", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

}

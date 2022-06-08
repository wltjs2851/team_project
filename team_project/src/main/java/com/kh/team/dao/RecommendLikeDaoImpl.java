package com.kh.team.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecommendLikeVo;

@Repository
public class RecommendLikeDaoImpl implements RecommendLikeDao{

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE ="com.kh.team.mappers.recommendlike.";
	

	@Override
	public void insertRecommendLike(RecommendLikeVo reLikeVo) throws Exception{
		sqlSession.insert(NAMESPACE + "insertRecommendLike", reLikeVo);
	}

	@Override
	public void deleteRecommendLike(RecommendLikeVo reLikeVo) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteRecommendLike", reLikeVo);
	}

	@Override
	public int getRecommendLike(RecommendLikeVo reLikeVo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getRecommendLike", reLikeVo);
	}

	@Override
	public void updateRecommendLike(int reno) throws Exception {
		sqlSession.update(NAMESPACE + "updateRecommendLike", reno);
	}

}

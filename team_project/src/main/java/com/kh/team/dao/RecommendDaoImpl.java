package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecommendVo;

@Repository
public class RecommendDaoImpl implements RecommendDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE ="com.kh.team.mappers.recommend.";
	
	@Override
	public boolean insertRecommend(RecommendVo recommendVo) {
		
		return false;
	}

	@Override
	public boolean updateRecommend(RecommendVo recommendVo) {
		
		return false;
	}

	@Override
	public boolean deleteRecommend(int reno) {
		
		return false;
	}

	@Override
	public RecommendVo selectByKno(int reno) {
		
		return null;
	}

	@Override
	public List<RecommendVo> listRecommend() {
		
		return null;
	}
	
}

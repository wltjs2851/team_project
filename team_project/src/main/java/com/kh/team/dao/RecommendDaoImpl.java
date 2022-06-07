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
		int count = sqlSession.insert(NAMESPACE + "insertRecommend", recommendVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRecommend(RecommendVo recommendVo) {
		int count = sqlSession.update(NAMESPACE + "updateRecommend", recommendVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRecommend(int reno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRecommend", reno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public RecommendVo selectByReno(int reno) {
		RecommendVo recommendVo = sqlSession.selectOne(NAMESPACE + "selectByReno", reno);
		return recommendVo;
	}

	@Override
	public List<RecommendVo> listRecommend() {
		List<RecommendVo> listRecommend = sqlSession.selectList(NAMESPACE + "listRecommend");
		return listRecommend;
	}

	@Override
	public List<RecommendVo> selectByViewCnt() {
		List<RecommendVo> listRecommend = sqlSession.selectList(NAMESPACE + "selectByViewCnt");
		return listRecommend;
	}
	
}

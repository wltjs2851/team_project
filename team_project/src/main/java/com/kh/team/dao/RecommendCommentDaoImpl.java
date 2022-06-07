package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.RecommendCommentVo;
import com.kh.team.vo.RecommendVo;

@Repository
public class RecommendCommentDaoImpl implements RecommendCommentDao{
	
	private final String NAMESPACE = "com.kh.team.mappers.recommendcomment.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertRecommendComment(RecommendCommentVo recommendCommentVo) {
		int count = sqlSession.insert(NAMESPACE + "insertRecommendComment", recommendCommentVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean udpateRecommendComment(RecommendCommentVo recommendCommentVo) {
		int count = sqlSession.update(NAMESPACE + "udpateRecommendComment", recommendCommentVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRecommendCommnet(int recno) {
		int count = sqlSession.delete(NAMESPACE + "deleteRecommendCommnet", recno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<RecommendCommentVo> recommendCommentList(int reno) {
		List<RecommendCommentVo> recommendCommentList = 
					sqlSession.selectList(NAMESPACE + "recommendCommentList", reno);
		return recommendCommentList;
	}

}

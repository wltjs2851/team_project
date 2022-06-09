package com.kh.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupBoardLikeVo;

@Repository
public class GroupBoardLikeDaoImpl implements GroupBoardLikeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.groupboardlike.";

	@Override
	public void addLike(GroupBoardLikeVo groupBoardLikeVo) {
		sqlSession.insert(NAMESPACE + "addLike", groupBoardLikeVo);
	}

	@Override
	public void deleteLike(GroupBoardLikeVo groupBoardLikeVo) {
		sqlSession.delete(NAMESPACE + "deleteLike", groupBoardLikeVo);
	}

	@Override
	public void updateLike(int gbno) {
		sqlSession.update(NAMESPACE + "updateLike", gbno);
	}

	@Override
	public int countLike(GroupBoardLikeVo groupBoardLikeVo) {
		return sqlSession.selectOne(NAMESPACE + "countLike", groupBoardLikeVo);
	}

}

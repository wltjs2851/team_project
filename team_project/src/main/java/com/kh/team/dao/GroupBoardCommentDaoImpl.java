package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupBoardCommentVo;

@Repository
public class GroupBoardCommentDaoImpl implements GroupBoardCommentDao {
	
	private final String NAMESPACE = "com.kh.team.mappers.groupcomment.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertGroupComment(GroupBoardCommentVo groupBoardCommentVo) {
		int count = sqlSession.insert(NAMESPACE + "insertGroupComment", groupBoardCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GroupBoardCommentVo> groupCommentList(int gbno) {
		List<GroupBoardCommentVo> groupCommentList = sqlSession.selectList(NAMESPACE + "groupCommentList", gbno);
		return groupCommentList;
	}

	@Override
	public boolean updateGroupComment(GroupBoardCommentVo groupBoardCommentVo) {
		int count = sqlSession.update(NAMESPACE + "updateGroupComment", groupBoardCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroupComment(int gbcno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroupComment", gbcno);
		if(count > 0) {
			return true;
		}
		return false;
	}

}

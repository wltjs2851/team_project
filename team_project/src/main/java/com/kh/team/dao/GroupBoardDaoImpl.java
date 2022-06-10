package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupBoardVo;

@Repository
public class GroupBoardDaoImpl implements GroupBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.groupboard.";

	@Override
	public boolean create(GroupBoardVo groupBoardVo) {
		System.out.println("groupBoardVo: " + groupBoardVo);
		int count = sqlSession.insert(NAMESPACE + "create", groupBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public GroupBoardVo read(int gbno) {
		GroupBoardVo groupBoardVo = sqlSession.selectOne(NAMESPACE + "read", gbno);
		return groupBoardVo;
	}

	@Override
	public boolean update(GroupBoardVo groupBoardVo) {
		int count = sqlSession.update(NAMESPACE + "update", groupBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(int gbno) {
		int count = sqlSession.delete(NAMESPACE + "delete", gbno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GroupBoardVo> list(int gno) {
		List<GroupBoardVo> groupList = sqlSession.selectList(NAMESPACE + "list", gno);
		return groupList;
	}

	@Override
	public List<GroupBoardVo> notice(String gb_notice) {
		List<GroupBoardVo> noticeList = sqlSession.selectList(NAMESPACE + "notice", gb_notice);
		return noticeList;
	}

//	@Override
//	public boolean updateComment(int gbno) {
//		System.out.println("gorupBoardDaoImpl, gbno: " + gbno);
//		int count = sqlSession.update(NAMESPACE + "countComment", gbno);
//		if(count > 0) {
//			return true;
//		}
//		return false;
//	}

	@Override
	public int countComment(int gbno) {
		
		return sqlSession.selectOne(NAMESPACE + "countComment", gbno);
	}

	@Override
	public String getGb_picdById(int gbno) {
		String gb_pic = sqlSession.selectOne(NAMESPACE + "getGb_picById", gbno);
		return gb_pic;
	}

}

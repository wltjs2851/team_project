package com.kh.team.group;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupBoardVo;

@Repository
public class GroupBoardDaoImpl implements GroupBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.group.";

	@Override
	public boolean create(GroupBoardVo groupBoardVo) {
		int count = sqlSession.insert(NAMESPACE + "create", groupBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public GroupBoardVo read(int gbno) {
		GroupBoardVo groupVo = sqlSession.selectOne(NAMESPACE + "read", gbno);
		return groupVo;
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
	public List<GroupBoardVo> list() {
		List<GroupBoardVo> groupList = sqlSession.selectList(NAMESPACE + "list");
		return groupList;
	}

}

package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupVo;

@Repository
public class GroupDaoImpl implements GroupDao{
	
	private final String NAMESPACE = "com.kh.team.mappers.group.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertGroup(GroupVo groupVo) {
		int count = sqlSession.insert(NAMESPACE + "insertGroup", groupVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GroupVo> selectGroup() {
		List<GroupVo> list = sqlSession.selectList(NAMESPACE + "selectGroup");
		return list;
	}

	@Override
	public boolean updateGroup(GroupVo groupVo) {
		int count = sqlSession.update(NAMESPACE + "updateGroup", groupVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroup(int gno) {
		// TODO Auto-generated method stub
		return false;
	}

}

package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		int count = sqlSession.delete(NAMESPACE + "deleteGroup", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public GroupVo groupByGno(int gno) {
		GroupVo groupVo = sqlSession.selectOne(NAMESPACE + "groupByGno", gno);
		return groupVo;
	}

	@Override
	public boolean updateGroupMember(GroupVo groupVo) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("gno", groupVo.getGno());
		parameter.put("g_present", groupVo.getG_present());
		int count = sqlSession.update(NAMESPACE + "updateGroupMember", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int getNextGno() {
		int gno = sqlSession.selectOne(NAMESPACE + "getNextGno");
		return gno;
	}

	@Override
	public boolean insertJoinGroup(int gno, String userid) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("gno", gno);
		parameter.put("userid", userid);
		System.out.println(parameter);
		int count = sqlSession.insert(NAMESPACE + "insertJoinGroup", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

}

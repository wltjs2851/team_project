package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupJoinVo;
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
	public boolean updateGroupMember(int gno, int cnt) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("gno", gno);
		parameter.put("cnt", cnt);
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
	
	public boolean deleteJoinGroup(int gno, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("userid", userid);
		int count = sqlSession.insert(NAMESPACE + "deleteJoinGroup", map);
		if (count > 0) { 
			return true;
		} 
		return false;
		
	}
	
	@Override
	public List<GroupJoinVo> list(int gno) {
		List<GroupJoinVo> groupJoinMember = sqlSession.selectList(NAMESPACE + "getGroupMember", gno);
		return groupJoinMember;
	}

}

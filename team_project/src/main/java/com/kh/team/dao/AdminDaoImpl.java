package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.testVo;

@Repository
public class AdminDaoImpl implements AdminDao{
	
private final String NAMESPACE = "com.kh.team.mappers.admin.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AdminVo> adminList(String nickname) {
		List<AdminVo> adminList = sqlSession.selectList(NAMESPACE + "adminList", nickname);
		return adminList;
	}

	@Override
	public List<testVo> getGroupInfo() {
		List<testVo> getGroupInfo = sqlSession.selectList(NAMESPACE + "getGroupInfo");
		return getGroupInfo;
	}

	@Override
	public List<Integer> getGno(String nickname) {
		List<Integer> gnoList = sqlSession.selectList(NAMESPACE + "getGno", nickname);
		return gnoList;
	}

	@Override
	public List<String> getGmember(int gno) {
		List<String> memberList = sqlSession.selectList(NAMESPACE + "getGmember", gno);
		return memberList;
	}

	@Override
	public boolean updateGLeader(int gno, String userid) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("gno", gno);
		parameter.put("g_leader", userid);
		System.out.println(parameter);
		int count = sqlSession.update(NAMESPACE + "updateGLeader", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<String> getGuser(int gno) {
		List<String> memberList = sqlSession.selectList(NAMESPACE + "getGuser", gno);
		return memberList;
	}

}

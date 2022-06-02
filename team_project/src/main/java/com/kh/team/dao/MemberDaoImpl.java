package com.kh.team.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	private final String NS = "com.kh.team.mappers.member.";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void joinMember(MemberVo memberVo) {
		sqlSession.insert(NS + "joinMember", memberVo);
		System.out.println("daoimp" + memberVo);
	}

	@Override
	public MemberVo login(String userid, String userpw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		MemberVo memberVo = sqlSession.selectOne(NS + "login", map);
		return memberVo;
	}

	@Override
	public boolean updateMember(MemberVo memberVo) {
		return false;
	}

	@Override
	public boolean deleteMember(String userid) {
		return false;
	}

	
}

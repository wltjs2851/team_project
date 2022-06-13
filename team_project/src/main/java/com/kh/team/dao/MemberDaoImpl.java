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
	public boolean joinMember(MemberVo memberVo) {
		int count = sqlSession.insert(NS + "joinMember", memberVo);
		if (count > 0) {
			return true;
		}
		return false;
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
		int count = sqlSession.update(NS + "updateMember", memberVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteMember(String userid) {
		int count = sqlSession.update(NS + "deleteMember", userid);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public String getU_picById(String userid) {
		String u_pic = sqlSession.selectOne(NS + "getU_picById", userid);
		return u_pic;
	}

	@Override
	public MemberVo memberByUserid(String userid) {
		MemberVo memberVo = sqlSession.selectOne(NS + "memberByUserid", userid);
		return memberVo;
	}

	@Override
	public boolean isExist(String userid) {
		MemberVo memberVo = sqlSession.selectOne(NS + "isExist", userid);
		if (memberVo != null && !memberVo.equals("")) {
			return true;
		}
		return false;
	}

	@Override
	public MemberVo findId(String username, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("username", username);
		map.put("email", email);
		MemberVo memberVo = sqlSession.selectOne(NS + "findId", map);
		return memberVo;
	}

	
}

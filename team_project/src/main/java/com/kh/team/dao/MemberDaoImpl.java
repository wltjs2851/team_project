package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

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

	@Override
	public MemberVo findPw(String userid, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("email", email);
		MemberVo memberVo = sqlSession.selectOne(NS + "findPw", map);
		return memberVo;
	}

	@Override
	public boolean updatePw(String userid, String userpw) {
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		int count = sqlSession.update(NS + "updatePw", map);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<MemberVo> getLatestMember() {
		List<MemberVo> getLastestMember = sqlSession.selectList(NS + "getLatestMember");
		return getLastestMember;
	}

	@Override
	public List<MemberVo> getMemberList(PagingDto pagingDto) {
		List<MemberVo> getMemberList = sqlSession.selectList(NS + "getMemberList", pagingDto);
		System.out.println("getMemberList, search:" + getMemberList);
		return getMemberList;
	}

	@Override
	public int getCountMember(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NS + "getCountMember", pagingDto);
		return count;
	}

	@Override
	public MemberVo isExistNickname(String nickname) {
		return sqlSession.selectOne(NS + "isExistNickname", nickname);
	}

}

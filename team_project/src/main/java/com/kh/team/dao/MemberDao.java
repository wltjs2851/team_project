package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.EmailVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberDao  {

	public boolean joinMember(MemberVo memberVo);
	
	public MemberVo login(String userid, String userpw);
	
	public boolean updateMember(MemberVo memberVo);
	
	public boolean deleteMember(String userid);
	
	public boolean deleteMemberNickname(String nickname);
	
	public String getU_picById(String userid);
	
	public MemberVo memberByUserid(String userid);
	
	public boolean isExist(String userid);
	
	public MemberVo findId(String username, String email);
	
	public MemberVo findPw(String userid, String email);
	
	public boolean updatePw(String userid, String userpw);
	
	// 최근 가입 회원 4명
	public List<MemberVo> getLatestMember();
	
	// 전체 회원수 구하기
	public int getCountMember(PagingDto pagingDto);
	
	// 전체 회원 조회
	public List<MemberVo> getMemberList(PagingDto pagingDto);
	
	public MemberVo isExistNickname(String nickname);
	
	public MemberVo memberByNickname(String nickname);
	
}

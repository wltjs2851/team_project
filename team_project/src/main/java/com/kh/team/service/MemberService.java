package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberService {
	
	public boolean joinMember(MemberVo memberVo);
	
	public MemberVo login(String userid, String userpw);
	
	public boolean updateMember(MemberVo memberVo);
	
	public boolean deleteMember(String userid);
	
	public String getU_picById(String userid);
	
	public MemberVo memberByUserid(String userid);
	
	public boolean isExist(String userid);
	
	public MemberVo findId(String username, String email);
	
	public MemberVo findPw(String userid, String email);
	
	public boolean updatePw(String userid, String userpw);
	
	public List<MemberVo> getLatestMember();
	
	public int getCountMember(PagingDto pagingDto);
	
	public List<MemberVo> getMemberList(PagingDto pagingDto);
	
	public MemberVo isExistNickname(String nickname);
	
	public MemberVo memberByNickname(String nickname);
}

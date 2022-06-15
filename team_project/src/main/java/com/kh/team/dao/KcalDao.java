package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.KcalVo;
import com.kh.team.vo.PagingDto;

public interface KcalDao {
	// 운동 칼로리 사전 페이지 (관리자만 권한)
	
	// 칼로리 글 작성 
	public boolean insertKcal(KcalVo kcalVo);
	
	// 칼로리 글 수정
	public boolean updateKcal(KcalVo kcalVo);
	
	// 칼로리 글 삭제 
	public boolean deleteKcal(int kno);
	
	// 칼로리 상세 내용 조회
	public KcalVo selectByKno(int kno);
	
	// 칼로리 글 목록
	public List<KcalVo> listKcal(PagingDto pagingDto);
	
	// 전체 글 갯수 구하기 
	public int getCountKcal (PagingDto pagingDto);
}

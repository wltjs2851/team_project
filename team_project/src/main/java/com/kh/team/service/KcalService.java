package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.KcalVo;
import com.kh.team.vo.PagingDto;

public interface KcalService {
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
		
		// 칼로리 글 전체 갯수
		public int getCountKcal(PagingDto pagingDto);
}

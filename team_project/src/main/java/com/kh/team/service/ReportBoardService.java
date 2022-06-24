package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.ReportBoardVo;

public interface ReportBoardService {
	//신고 등록
		public boolean addReportBoard(ReportBoardVo reportBoardVo);
		//신고리스트 출력
		public List<ReportBoardVo> getReportBoardList();
		//신고 수정(rep_state 컬럼 수정/신고 확인 유무 및 철회)
		public boolean modifyReportBoard(int rep_state);
}

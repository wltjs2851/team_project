package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ReportBoardVo;

public interface ReportBoardDao {
	//신고 등록
	public boolean insertReportBoard(ReportBoardVo reportBoardVo);
	//신고리스트 출력
	public List<ReportBoardVo> getReportBoardList();
	//신고 수정(rep_state 컬럼 수정/신고 확인 유무 및 철회)
	public boolean updateReportBoard(int rep_state);
}

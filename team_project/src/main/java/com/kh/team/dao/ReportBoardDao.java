package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ReportBoardVo;

public interface ReportBoardDao {
	//�Ű� ���
	public boolean insertReportBoard(ReportBoardVo reportBoardVo);
	//�Ű���Ʈ ���
	public List<ReportBoardVo> getReportBoardList();
	//�Ű� ����(rep_state �÷� ����/�Ű� Ȯ�� ���� �� öȸ)
	public boolean updateReportBoard(int rep_state);
	
	// 신고 번호에 따른 신고 내역 조회
	public ReportBoardVo getReportByRbno(int rbno);
	
	// 신고 처리 후 상태 변경
	public boolean updateRepState(int rbno);
}

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
	
	public boolean updateRecipeVisible(int rno);
	public boolean updateRoutineVisible(int uno);
	public boolean updateFreeVisible(int fno);
	public boolean updateRCommentVisible(int rcno);
	public boolean updateURCommentVisible(int urcno);
	public boolean updateFCommentVisible(int fcno);
	public boolean updateRECommentVisible(int recno);
	
	// 최근 신고 목록 
	public List<ReportBoardVo> getLatestReport();
}

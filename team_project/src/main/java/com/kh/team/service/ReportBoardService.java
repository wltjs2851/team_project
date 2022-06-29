package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.ReportBoardVo;

public interface ReportBoardService {
	//�Ű� ���
		public boolean addReportBoard(ReportBoardVo reportBoardVo);
		//�Ű���Ʈ ���
		public List<ReportBoardVo> getReportBoardList();
		//�Ű� ����(rep_state �÷� ����/�Ű� Ȯ�� ���� �� öȸ)
		public boolean modifyReportBoard(int rep_state);
		
		public ReportBoardVo getReportByRbno(int rbno);
		
		public boolean updateRepState(int rbno);
		
		public boolean updateRecipeVisible(int rno);
		public boolean updateRoutineVisible(int uno);
		public boolean updateFreeVisible(int fno);
		public boolean updateRCommentVisible(int rcno);
		public boolean updateURCommentVisible(int urcno);
		public boolean updateFCommentVisible(int fcno);
		public boolean updateRECommentVisible(int recno);
		
		public List<ReportBoardVo> getLatestReport();
}

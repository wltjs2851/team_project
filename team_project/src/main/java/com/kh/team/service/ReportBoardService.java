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
}

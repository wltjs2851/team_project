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
}

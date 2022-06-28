package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.ReportBoardDao;
import com.kh.team.vo.ReportBoardVo;

@Service
public class ReportBoardServiceImpl implements ReportBoardService{
	
	@Autowired
	ReportBoardDao reportBoardDao;

	@Override
	public boolean addReportBoard(ReportBoardVo reportBoardVo) {
		return reportBoardDao.insertReportBoard(reportBoardVo);
	}

	@Override
	public List<ReportBoardVo> getReportBoardList() {
		return reportBoardDao.getReportBoardList();
	}

	@Override
	public boolean modifyReportBoard(int rep_state) {
		return false;
	}

	@Override
	public ReportBoardVo getReportByRbno(int rbno) {
		return reportBoardDao.getReportByRbno(rbno);
	}

	@Override
	public boolean updateRepState(int rbno) {
		return reportBoardDao.updateRepState(rbno);
	}

	@Override
	public boolean updateRecipeVisible(int rno) {
		return reportBoardDao.updateRecipeVisible(rno);
	}

	@Override
	public boolean updateRoutineVisible(int uno) {
		return reportBoardDao.updateRoutineVisible(uno);
	}

	@Override
	public boolean updateFreeVisible(int fno) {
		return reportBoardDao.updateFreeVisible(fno);
	}

	@Override
	public boolean updateRCommentVisible(int rcno) {
		return reportBoardDao.updateRCommentVisible(rcno);
	}

	@Override
	public boolean updateURCommentVisible(int urcno) {
		return reportBoardDao.updateURCommentVisible(urcno);
	}

	@Override
	public boolean updateFCommentVisible(int fcno) {
		return reportBoardDao.updateFCommentVisible(fcno);
	}

	@Override
	public boolean updateRECommentVisible(int recno) {
		return reportBoardDao.updateRECommentVisible(recno);
	}

}

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modifyReportBoard(int rep_state) {
		// TODO Auto-generated method stub
		return false;
	}

}

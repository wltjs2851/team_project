package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.ReportDao;
import com.kh.team.vo.ReportVo;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao reportDao;

	@Override
	public boolean insertReport(int gno, String userid, String rep_cause) {
		boolean reuslt = reportDao.insertReport(gno, userid, rep_cause);
		return reuslt;
	}

	@Override
	public int cntReport(int gno, String userid) {
		int cntReport = reportDao.cntReport(gno, userid);
		return cntReport;
	}

	@Override
	public List<String> reportList(int gno, String userid) {
		List<String> reportList = reportDao.reportList(gno, userid);
		return reportList;
	}
}

package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.ReportDao;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao reportDao;

	@Override
	public boolean insertReport(int gno, String userid) {
		boolean reuslt = reportDao.insertReport(gno, userid);
		return reuslt;
	}

}

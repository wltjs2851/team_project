package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.ReportVo;

public interface ReportService {
	
	public boolean insertReport(int gno, String userid, String rep_cause);
	public int cntReport(int gno, String userid);
	public List<String> reportList(int gno, String userid);

}

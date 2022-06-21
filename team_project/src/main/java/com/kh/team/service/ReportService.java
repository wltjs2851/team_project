package com.kh.team.service;

public interface ReportService {
	
	public boolean insertReport(int gno, String userid, String rep_cause);
	public int cntReport(int gno, String userid);

}

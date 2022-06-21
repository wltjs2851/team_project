package com.kh.team.dao;

public interface ReportDao {
	
	public boolean insertReport(int gno, String userid, String rep_casue);
	public int cntReport(int gno, String userid);

}

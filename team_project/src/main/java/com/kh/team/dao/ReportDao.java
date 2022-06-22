package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ReportVo;

public interface ReportDao {
	
	public boolean insertReport(int gno, String userid, String rep_casue);
	public int cntReport(int gno, String userid);
	public List<String> reportList(int gno, String userid);

}

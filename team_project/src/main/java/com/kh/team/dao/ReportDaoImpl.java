package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ReportVo;

@Repository
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.report.";

	@Override
	public boolean insertReport(int gno, String userid, String rep_cause) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("gno", gno);
		map.put("rep_cause", rep_cause);
		
		int count = sqlSession.insert(NAMESPACE + "insertReport", map);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int cntReport(int gno, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("userid", userid);
		
		int cntReport = sqlSession.selectOne(NAMESPACE + "cntReport", map);
		return cntReport;
	}

	@Override
	public List<ReportVo> reportList(int gno, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("gno", gno);
		System.out.println(gno);
		System.out.println(userid);
		List<ReportVo> reportList = sqlSession.selectList(NAMESPACE + "logReport", map);
		return reportList;
	}
	
//	@Override
//	public List<String> reportList(int gno, String userid) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("userid", userid);
//		map.put("gno", gno);
//		System.out.println(gno);
//		System.out.println(userid);
//		List<String> reportList = sqlSession.selectList(NAMESPACE + "logReport", map);
//		return reportList;
//	}

}

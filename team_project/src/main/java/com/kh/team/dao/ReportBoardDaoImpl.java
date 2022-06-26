package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ReportBoardVo;

@Repository
public class ReportBoardDaoImpl implements ReportBoardDao{
	private final String NAMESPACE ="com.kh.team.mappers.reportboard.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertReportBoard(ReportBoardVo reportBoardVo) {
		System.out.println(reportBoardVo);
		int count = sqlSession.insert(NAMESPACE + "insertReportBoard", reportBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<ReportBoardVo> getReportBoardList() {
		List<ReportBoardVo> reportBoardList = sqlSession.selectList(NAMESPACE + "getReportBoardList");
		return reportBoardList;
	}

	@Override
	public boolean updateReportBoard(int rep_state) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ReportBoardVo getReportByRbno(int rbno) {
		ReportBoardVo reportBoardVo = sqlSession.selectOne(NAMESPACE + "getReportByRbno", rbno);
		return reportBoardVo;
	}

}

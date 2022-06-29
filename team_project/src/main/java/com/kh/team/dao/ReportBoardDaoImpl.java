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

	@Override
	public boolean updateRepState(int rbno) {
		int count = sqlSession.update(NAMESPACE + "updateRepState", rbno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRecipeVisible(int rno) {
		int count = sqlSession.update(NAMESPACE + "updaetRecipeVisible", rno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRoutineVisible(int uno) {
		int count = sqlSession.update(NAMESPACE + "updaetRoutineVisible", uno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateFreeVisible(int fno) {
		int count = sqlSession.update(NAMESPACE + "updaetFreeVisible", fno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRCommentVisible(int rcno) {
		int count = sqlSession.update(NAMESPACE + "updaetRCommentVisible", rcno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateURCommentVisible(int urcno) {
		int count = sqlSession.update(NAMESPACE + "updaetURCommentVisible", urcno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateFCommentVisible(int fcno) {
		int count = sqlSession.update(NAMESPACE + "updaetFCommentVisible", fcno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateRECommentVisible(int recno) {
		int count = sqlSession.update(NAMESPACE + "updaetRECommentVisible", recno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<ReportBoardVo> getLatestReport() {
		List<ReportBoardVo> getLatestReport = sqlSession.selectList(NAMESPACE + "getLatestReport");
		return getLatestReport;
	}

}

package com.kh.team;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.ReportBoardDao;
import com.kh.team.vo.ReportBoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ReportBoardTest {
	@Autowired
	ReportBoardDao reportBoardDao;
	
	@Test
	public void insertReportTest() {
		ReportBoardVo reportBoardVo = new ReportBoardVo(7, 0, 0, 0, 0, 0, 0, "�ҹ���", "hong1234", "gogo11", null);
		boolean result = reportBoardDao.insertReportBoard(reportBoardVo);
		System.out.println(result);
	}
}

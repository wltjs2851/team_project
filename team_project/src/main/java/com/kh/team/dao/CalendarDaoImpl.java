package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao {
	
	private final String NAMESPACE = "com.kh.team.mappers.calendar.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CalendarVo> getCal(String userid) {
		return sqlSession.selectList(NAMESPACE + "selectById", userid);
	}

	@Override
	public boolean insertCal(CalendarVo calendarVo) {
		System.out.println(calendarVo);
		int count = sqlSession.insert(NAMESPACE + "insertCal", calendarVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	
}

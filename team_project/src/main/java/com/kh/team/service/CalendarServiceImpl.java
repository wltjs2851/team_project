package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.dao.CalendarDao;
import com.kh.team.vo.CalendarVo;

@Repository
public class CalendarServiceImpl implements CalendarServcie {
	
	@Autowired
	private CalendarDao calendarDao;

	@Override
	public boolean insertCal(CalendarVo calendarVo) {
		return calendarDao.insertCal(calendarVo);
	}

	@Override
	public List<CalendarVo> getCal(String userid) {
		return calendarDao.getCal(userid);
	}

	
}

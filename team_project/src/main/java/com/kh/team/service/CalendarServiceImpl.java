package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.team.dao.CalendarDao;
import com.kh.team.vo.CalendarVo;

@Service
public class CalendarServiceImpl implements CalendarServcie {
	
	@Autowired
	private CalendarDao calendarDao;

	@Override
	public boolean insertCal(CalendarVo calendarVo) {
		return calendarDao.insertCal(calendarVo);
	}

	@Override
	public List<CalendarVo> getCal(String month, String userid) {
		return calendarDao.getCal(month, userid);
	}

	@Override
	public List<CalendarVo> getCalList(String userid) {
		return calendarDao.getCalList(userid);
	}

	@Override
	public boolean updateCheck(CalendarVo calendarVo) {
		return calendarDao.updateCheck(calendarVo);
	}

	@Override
	public int getCount(String userid, String start1) {
		return calendarDao.getCount(userid, start1);
	}

	@Override
	public boolean deleteCal(CalendarVo calendarVo) {
		return calendarDao.deleteCal(calendarVo);
	}

	
}

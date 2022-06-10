package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.CalendarVo;

public interface CalendarDao {

	public List<CalendarVo> getCal(String userid);
	
	public boolean insertCal(CalendarVo calendarVo);
}

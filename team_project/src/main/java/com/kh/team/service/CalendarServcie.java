package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.CalendarVo;

public interface CalendarServcie {

	public List<CalendarVo> getCal(String month, String userid);
	
	public boolean insertCal(CalendarVo calendarVo);
	
	public List<CalendarVo> getCalList(String userid);
	
	public boolean updateCheck(CalendarVo calendarVo);
}

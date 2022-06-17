package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.CalendarVo;

public interface CalendarDao {

	public List<CalendarVo> getCal(String month, String userid);
	
	public boolean insertCal(CalendarVo calendarVo);
	
	public List<CalendarVo> getCalList(String userid);
	
	public boolean updateCheck(CalendarVo calendarVo);
	
	public int getCount(String userid, String start1);
}

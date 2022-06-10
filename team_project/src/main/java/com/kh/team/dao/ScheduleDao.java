package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.ScheduleVo;

public interface ScheduleDao {
	// 달력 일정 기능
	
	// 달력 일정 추가 
	public boolean insertSchedule(ScheduleVo scheduleVo);
	
	// 일정 목록 
	public List<ScheduleVo> scheduleList();
}

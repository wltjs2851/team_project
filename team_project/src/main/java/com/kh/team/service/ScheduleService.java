package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.ScheduleVo;

public interface ScheduleService {
	public boolean insertSchedule(ScheduleVo scheduleVo);
	public List<ScheduleVo> scheduleList();
}

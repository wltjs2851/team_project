package com.kh.team.dao;

import java.util.ArrayList;

import com.kh.team.vo.DateData;
import com.kh.team.vo.ScheduleDto;

public interface ScheduleDao {
	public int schedule_add(ScheduleDto scheduleDto);
	public int before_schedule_add_search(ScheduleDto scheduleDto);
	public ArrayList<ScheduleDto> schedule_list(DateData dateData);
}

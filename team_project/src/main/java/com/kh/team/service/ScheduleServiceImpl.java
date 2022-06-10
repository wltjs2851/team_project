package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.ScheduleDao;
import com.kh.team.vo.ScheduleVo;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Override
	public boolean insertSchedule(ScheduleVo scheduleVo) {
		return scheduleDao.insertSchedule(scheduleVo);
	}

	@Override
	public List<ScheduleVo> scheduleList() {
		return scheduleDao.scheduleList();
	}

}

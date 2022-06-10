package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ScheduleVo;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.schedule.";
	
	@Override
	public boolean insertSchedule(ScheduleVo scheduleVo) {
		int count = sqlSession.insert(NAMESPACE + "insertSchedule", scheduleVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<ScheduleVo> scheduleList() {
		List<ScheduleVo> scheduleList = sqlSession.selectList(NAMESPACE + "scheduleList");
		return scheduleList;
	}

}

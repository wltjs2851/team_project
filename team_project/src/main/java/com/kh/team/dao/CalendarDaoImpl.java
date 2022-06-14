package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao {
	
	private final String NAMESPACE = "com.kh.team.mappers.calendar.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CalendarVo> getCal(String month, String userid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("month", month);
		map.put("userid", userid);
		return sqlSession.selectList(NAMESPACE + "selectById", map);
	}

	@Override
	public boolean insertCal(CalendarVo calendarVo) {
		System.out.println(calendarVo);
		int count = sqlSession.insert(NAMESPACE + "insertCal", calendarVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<CalendarVo> getCalList(String userid) {
		List<CalendarVo> calList = sqlSession.selectList(NAMESPACE + "getCalList", userid);
		return calList;
	}

	
}
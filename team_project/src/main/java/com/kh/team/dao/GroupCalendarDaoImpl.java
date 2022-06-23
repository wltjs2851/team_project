package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupCalendarVo;

@Repository
public class GroupCalendarDaoImpl implements GroupCalendarDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.groupcalendar.";

	@Override
	public boolean insertGroupCal(GroupCalendarVo groupCalendarVo) {
		System.out.println("groupCalendarVo: " + groupCalendarVo);
		int count = sqlSession.insert(NAMESPACE + "insertGroupCal", groupCalendarVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GroupCalendarVo> getGroupCal(String month, int gno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("month", month);
		map.put("gno", gno);
		
		return sqlSession.selectList(NAMESPACE + "getGroupCal", map);
	}

	@Override
	public int getScheduleCnt(int gno, String gc_date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gno", gno);
		map.put("gc_date", gc_date);
		
		return sqlSession.selectOne(NAMESPACE + "getScheduleCnt", map);
	}

}

package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupCalendarVo;

public interface GroupCalendarDao {
	
	public boolean insertGroupCal(GroupCalendarVo groupCalendarVo);
	public List<GroupCalendarVo> getGroupCal(String month, int gno);
	public int getScheduleCnt(int gno, String gc_date);

}
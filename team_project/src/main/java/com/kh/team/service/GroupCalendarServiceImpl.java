package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.GroupCalendarDao;
import com.kh.team.vo.GroupCalendarVo;

@Service
public class GroupCalendarServiceImpl implements GroupCalendarService {
	
	@Autowired
	private GroupCalendarDao groupCalendarDao;

	@Override
	public boolean insertGroupCal(GroupCalendarVo groupCalendarVo) {
		boolean result = groupCalendarDao.insertGroupCal(groupCalendarVo);
		return result;
	}

	@Override
	public List<GroupCalendarVo> getGroupCal(String month, int gno) {
		List<GroupCalendarVo> groupCalList = groupCalendarDao.getGroupCal(month, gno);
		return groupCalList;
	}

	@Override
	public int getScheduleCnt(int gno, String gc_date) {
		int scheduleCnt = groupCalendarDao.getScheduleCnt(gno, gc_date);
		return scheduleCnt;
	}

	@Override
	public boolean updateGroupCal(GroupCalendarVo groupCalendarVo) {
		boolean result = groupCalendarDao.updateGroupCal(groupCalendarVo);
		return result;
	}

}

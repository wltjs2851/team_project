package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.WarningMessageDao;
import com.kh.team.vo.WarningMessageVo;

@Service
public class WarningMessageServiceImpl implements WarningMessageService{
	
	@Autowired
	private WarningMessageDao warningMessageDao;

	@Override
	public boolean insertWarningMessage(WarningMessageVo warningMessageVo) {
		return warningMessageDao.insertWarningMessage(warningMessageVo);
	}

	@Override
	public List<WarningMessageVo> listWarningMessage(String userid, String mType) {
		return warningMessageDao.listWarningMessage(userid, mType);
	}
	
	
}

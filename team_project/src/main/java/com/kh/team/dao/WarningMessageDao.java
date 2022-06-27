package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.WarningMessageVo;

public interface WarningMessageDao {
	// 경고 메시지 보내기
	public boolean insertWarningMessage(WarningMessageVo warningMessageVo);
	
	// 경고 목록 
	public List<WarningMessageVo> listWarningMessage(String userid, String mType);
}

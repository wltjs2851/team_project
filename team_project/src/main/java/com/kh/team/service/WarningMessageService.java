package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.WarningMessageVo;

public interface WarningMessageService {
	// 경고 메시지 보내기
	public boolean insertWarningMessage(WarningMessageVo warningMessageVo);
		
	// 경고 목록 
	public List<WarningMessageVo> listWarningMessage(String nickname);
	
	//경고 개수
	public int warningCount(String nickname);

}

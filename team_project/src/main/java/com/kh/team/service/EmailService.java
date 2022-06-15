package com.kh.team.service;

import com.kh.team.vo.EmailVo;

public interface EmailService {

	public void sendMailById(EmailVo emailVo);
	
	public void sendMailByPw(EmailVo emailVo);
}

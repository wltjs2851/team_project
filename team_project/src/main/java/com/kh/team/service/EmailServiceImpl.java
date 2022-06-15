package com.kh.team.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.team.vo.EmailVo;

@Service
public class EmailServiceImpl implements EmailService {

	@Inject
	JavaMailSender mailSender;
	
	@Override
	public void sendMailById(EmailVo emailVo) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			msg.addRecipient(RecipientType.TO, new InternetAddress(emailVo.getReceiveMail()));
			msg.addFrom(new InternetAddress[] { new InternetAddress(emailVo.getSenderMail(), emailVo.getSenderName()) });
			msg.setSubject(emailVo.getSubject());
			msg.setText(emailVo.getMessage());
			mailSender.send(msg);
		} catch (Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void sendMailByPw(EmailVo emailVo) {
		
	}

	
}

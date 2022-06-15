package com.kh.team.vo;

public class EmailVo {
	private String senderName = "관리자";
	private String senderMail = "undongproject@gmail.com";
	private String receiveMail;
	private String subject;
	private String message;
	
	public EmailVo() {
		super();
	}
	
	public EmailVo(String receiveMail, String subject, String message) {
		super();
		this.receiveMail = receiveMail;
		this.subject = subject;
		this.message = message;
	}

	public String getSenderName() {
		return senderName;
	}

	public String getSenderMail() {
		return senderMail;
	}

	public String getReceiveMail() {
		return receiveMail;
	}

	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "EmailVo [senderName=" + senderName + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
				+ ", subject=" + subject + ", message=" + message + "]";
	}
	
}

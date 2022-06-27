package com.kh.team.vo;

import java.sql.Date;

public class WarningMessageVo {
	private int wno;
	private String sender;
	private String receiver;
	private String message;
	private Date regdate;

	public WarningMessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WarningMessageVo(int wno, String sender, String receiver, String message, Date regdate) {
		super();
		this.wno = wno;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "WarningMessageVo [wno=" + wno + ", sender=" + sender + ", receiver=" + receiver + ", message=" + message
				+ ", regdate=" + regdate + "]";
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}

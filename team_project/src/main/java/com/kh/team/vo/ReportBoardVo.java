package com.kh.team.vo;

import java.sql.Date;

public class ReportBoardVo {
	private int rbno;
	private int rno;
	private int uno;
	private int fno;
	private int rcno;
	private int urcno;
	private int fcno;
	private int recno;
	private String rep_cause;
	private String sender;
	private String receiver;
	private Date rep_regdate;
	private int rep_state;
	
	public ReportBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReportBoardVo(int rno, int uno, int fno, int rcno, int urcno, int fcno, int recno, String rep_cause,
			String sender, String receiver, int rep_state) {
		super();
		this.rno = rno;
		this.uno = uno;
		this.fno = fno;
		this.rcno = rcno;
		this.urcno = urcno;
		this.fcno = fcno;
		this.recno = recno;
		this.rep_cause = rep_cause;
		this.sender = sender;
		this.receiver = receiver;
		this.rep_state = rep_state;
	}

	public ReportBoardVo(int rno, int uno, int fno, int rcno, int urcno, int fcno, int recno, String rep_cause,
			String sender, String receiver) {
		super();
		this.rno = rno;
		this.uno = uno;
		this.fno = fno;
		this.rcno = rcno;
		this.urcno = urcno;
		this.fcno = fcno;
		this.recno = recno;
		this.rep_cause = rep_cause;
		this.sender = sender;
		this.receiver = receiver;
	}

	public ReportBoardVo(int rbno, int rno, int uno, int fno, int rcno, int urcno, int fcno, int recno, String rep_cause,
			String sender, String receiver, Date rep_regdate, int rep_state) {
		super();
		this.rbno = rbno;
		this.rno = rno;
		this.uno = uno;
		this.fno = fno;
		this.rcno = rcno;
		this.urcno = urcno;
		this.fcno = fcno;
		this.recno = recno;
		this.rep_cause = rep_cause;
		this.sender = sender;
		this.receiver = receiver;
		this.rep_regdate = rep_regdate;
		this.rep_state = rep_state;
	}

	public int getRbno() {
		return rbno;
	}

	public void setRbno(int rbno) {
		this.rbno = rbno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public int getRcno() {
		return rcno;
	}

	public void setRcno(int rcno) {
		this.rcno = rcno;
	}

	public int getUrcno() {
		return urcno;
	}

	public void setUrcno(int urcno) {
		this.urcno = urcno;
	}

	public int getFcno() {
		return fcno;
	}

	public void setFcno(int fcno) {
		this.fcno = fcno;
	}

	public int getRecno() {
		return recno;
	}

	public void setRecno(int recno) {
		this.recno = recno;
	}

	public String getRep_cause() {
		return rep_cause;
	}

	public void setRep_cause(String rep_cause) {
		this.rep_cause = rep_cause;
	}

	public Date getRep_regdate() {
		return rep_regdate;
	}

	public void setRep_regdate(Date rep_regdate) {
		this.rep_regdate = rep_regdate;
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

	public int getRep_state() {
		return rep_state;
	}

	public void setRep_state(int rep_state) {
		this.rep_state = rep_state;
	}

	@Override
	public String toString() {
		return "ReportBoardVo [rbno=" + rbno + ", rno=" + rno + ", uno=" + uno + ", fno=" + fno + ", rcno=" + rcno
				+ ", urcno=" + urcno + ", fcno=" + fcno + ", recno=" + recno + ", rep_cause=" + rep_cause + ", sender="
				+ sender + ", receiver=" + receiver + ", rep_regdate=" + rep_regdate + ", rep_state=" + rep_state + "]";
	}
}

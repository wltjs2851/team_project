package com.kh.team.vo;

import java.sql.Date;

public class AdminVo {
	private int number;
	private String title;
	private Date regdate;

	public AdminVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminVo(int number, String title, Date regdate) {
		super();
		this.number = number;
		this.title = title;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "AdminVo [number=" + number + ", title=" + title + ", regdate=" + regdate + "]";
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}

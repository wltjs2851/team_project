package com.kh.team.vo;

public class CalendarVo {

	private int indx;
	private String userid;
	private String content;
	private String start1;
	private String end1;
	
	public CalendarVo() {
		super();
	}

	public CalendarVo(int indx, String userid, String content, String start1, String end1) {
		super();
		this.indx = indx;
		this.userid = userid;
		this.content = content;
		this.start1 = start1;
		this.end1 = end1;
	}

	public CalendarVo(int indx, String userid, String content, String start1) {
		super();
		this.indx = indx;
		this.userid = userid;
		this.content = content;
		this.start1 = start1;
	}
	
	public CalendarVo(String userid, String content, String start1) {
		super();
		this.userid = userid;
		this.content = content;
		this.start1 = start1;
	}

	public int getIndx() {
		return indx;
	}

	public void setIndx(int indx) {
		this.indx = indx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStart1() {
		return start1;
	}

	public void setStart1(String start1) {
		this.start1 = start1;
	}

	public String getEnd1() {
		return end1;
	}

	public void setEnd1(String end1) {
		this.end1 = end1;
	}

	@Override
	public String toString() {
		return "CalendarVo [indx=" + indx + ", userid=" + userid + ", content=" + content + ", start1=" + start1
				+ ", end1=" + end1 + "]";
	}
	
}

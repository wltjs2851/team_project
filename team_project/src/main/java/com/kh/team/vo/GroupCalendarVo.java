package com.kh.team.vo;

import java.sql.Date;

public class GroupCalendarVo {
	
	private int gcno;
	private int gno;
	private String userid;
	private String gc_content;
	private String gc_date;
	
	public GroupCalendarVo() {
		super();
	}

	public GroupCalendarVo(int gcno, int gno, String userid, String gc_content, String gc_date) {
		super();
		this.gcno = gcno;
		this.gno = gno;
		this.userid = userid;
		this.gc_content = gc_content;
		this.gc_date = gc_date;
	}

	public int getGcno() {
		return gcno;
	}

	public void setGcno(int gcno) {
		this.gcno = gcno;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGc_content() {
		return gc_content;
	}

	public void setGc_content(String gc_content) {
		this.gc_content = gc_content;
	}

	public String getGc_date() {
		return gc_date;
	}

	public void setGc_date(String gc_date) {
		this.gc_date = gc_date;
	}

	@Override
	public String toString() {
		return "GroupCalendarVo [gcno=" + gcno + ", gno=" + gno + ", userid=" + userid + ", gc_content=" + gc_content
				+ ", gc_date=" + gc_date  + "]";
	}

}

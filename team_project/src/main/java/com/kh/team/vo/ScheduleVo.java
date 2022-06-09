package com.kh.team.vo;

import java.sql.Date;

public class ScheduleVo {
	private Date sch_date;
	private int schno;
	private String sch_content;
	private String userid;

	public ScheduleVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ScheduleVo(Date sch_date, int schno, String sch_content, String userid) {
		super();
		this.sch_date = sch_date;
		this.schno = schno;
		this.sch_content = sch_content;
		this.userid = userid;
	}

	public Date getSch_date() {
		return sch_date;
	}

	public void setSch_date(Date sch_date) {
		this.sch_date = sch_date;
	}

	public int getSchno() {
		return schno;
	}

	public void setSchno(int schno) {
		this.schno = schno;
	}

	public String getSch_content() {
		return sch_content;
	}

	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Schedule [sch_date=" + sch_date + ", schno=" + schno + ", sch_content=" + sch_content + ", userid="
				+ userid + "]";
	}

}

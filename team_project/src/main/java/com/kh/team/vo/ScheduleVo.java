package com.kh.team.vo;

public class ScheduleVo {
	private int idx;
	private String userid;
	private String title;
	private String startdate;
	private String enddate;

	public ScheduleVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ScheduleVo(int idx, String userid, String title, String startdate, String enddate) {
		super();
		this.idx = idx;
		this.userid = userid;
		this.title = title;
		this.startdate = startdate;
		this.enddate = enddate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	@Override
	public String toString() {
		return "ScheduleVo [idx=" + idx + ", userid=" + userid + ", title=" + title + ", startdate=" + startdate
				+ ", enddate=" + enddate + "]";
	}

}

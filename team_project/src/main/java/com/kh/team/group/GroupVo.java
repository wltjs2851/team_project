package com.kh.team.group;

import java.sql.Date;
import java.util.Arrays;

public class GroupVo {
	
	private int gno;
	private String g_name;
	private String userid;
	private String excercise_type;
	private int g_attend;
	private String g_intro;
	private String g_location;
	private Date g_regdate;
	private String[] g_pic;
	
	public GroupVo() {
		super();
	}

	public GroupVo(int gno, String g_name, String userid, String excercise_type, int g_attend, String g_intro,
			String g_location, Date g_regdate, String[] g_pic) {
		super();
		this.gno = gno;
		this.g_name = g_name;
		this.userid = userid;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_location = g_location;
		this.g_regdate = g_regdate;
		this.g_pic = g_pic;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getExcercise_type() {
		return excercise_type;
	}

	public void setExcercise_type(String excercise_type) {
		this.excercise_type = excercise_type;
	}

	public int getG_attend() {
		return g_attend;
	}

	public void setG_attend(int g_attend) {
		this.g_attend = g_attend;
	}

	public String getG_intro() {
		return g_intro;
	}

	public void setG_intro(String g_intro) {
		this.g_intro = g_intro;
	}

	public String getG_location() {
		return g_location;
	}

	public void setG_location(String g_location) {
		this.g_location = g_location;
	}

	public Date getG_regdate() {
		return g_regdate;
	}

	public void setG_regdate(Date g_regdate) {
		this.g_regdate = g_regdate;
	}

	public String[] getG_pic() {
		return g_pic;
	}

	public void setG_pic(String[] g_pic) {
		this.g_pic = g_pic;
	}

	@Override
	public String toString() {
		return "GroupVo [gno=" + gno + ", g_name=" + g_name + ", userid=" + userid + ", excercise_type="
				+ excercise_type + ", g_attend=" + g_attend + ", g_intro=" + g_intro + ", g_location=" + g_location
				+ ", g_regdate=" + g_regdate + ", g_pic=" + Arrays.toString(g_pic) + "]";
	}

}

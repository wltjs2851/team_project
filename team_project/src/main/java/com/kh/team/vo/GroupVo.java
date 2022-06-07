package com.kh.team.vo;

import java.sql.Date;

public class GroupVo {
	private int gno;
	private String g_name;
	private String excercise_type;
	private int g_attend;
	private String g_intro;
	private String g_location;
	private Date g_regdate;
	private String g_pic;
	private int g_present;
	private String users;
	
	public GroupVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public GroupVo(int gno, int g_present, String users) {
		super();
		this.gno = gno;
		this.g_present = g_present;
		this.users = users;
	}

	public GroupVo(String g_name, String excercise_type, int g_attend, String g_intro, String g_location, String users) {
		super();
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_location = g_location;
		this.users = users;
	}
	
	public GroupVo(String g_name, String excercise_type, int g_attend, String g_intro, String g_location,
			String g_pic, String users) {
		super();
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_location = g_location;
		this.g_pic = g_pic;
		this.users = users;
	}

	public GroupVo(int gno, String g_name, String excercise_type, int g_attend, String g_intro, String g_location,
			String g_pic, String users) {
		super();
		this.gno = gno;
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_location = g_location;
		this.g_pic = g_pic;
		this.users = users;
	}

	public GroupVo(int gno, String g_name, String excercise_type, int g_attend, String g_intro, String g_location,
			Date g_regdate, String g_pic, int g_present, String users) {
		super();
		this.gno = gno;
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_location = g_location;
		this.g_regdate = g_regdate;
		this.g_pic = g_pic;
		this.g_present = g_present;
		this.users = users;
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

	public String getG_pic() {
		return g_pic;
	}

	public void setG_pic(String g_pic) {
		this.g_pic = g_pic;
	}

	public int getG_present() {
		return g_present;
	}

	public void setG_present(int g_present) {
		this.g_present = g_present;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "GroupVo [gno=" + gno + ", g_name=" + g_name + ", excercise_type=" + excercise_type + ", g_attend="
				+ g_attend + ", g_intro=" + g_intro + ", g_location=" + g_location + ", g_regdate=" + g_regdate
				+ ", g_pic=" + g_pic + ", g_present=" + g_present + ", users=" + users + "]";
	}
}

package com.kh.team.vo;

import java.sql.Date;

public class GroupVo {
	private int gno;
	private String g_name;
	private String excercise_type;
	private int g_attend;
	private String g_intro;
	private Date g_regdate;
	private String g_pic;
	private int g_present;
	private String g_leader;
	private int dno;
	private int sno;
	private int sgno;
	
	public GroupVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public GroupVo(int gno, int g_present) {
		super();
		this.gno = gno;
		this.g_present = g_present;
	}
	
	public GroupVo(int gno, int g_present, String g_leader) {
		super();
		this.gno = gno;
		this.g_present = g_present;
		this.g_leader = g_leader;
	}

	public GroupVo(String g_name, String excercise_type, int g_attend, String g_intro) {
		super();
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
	}
	
	public GroupVo(String g_name, String excercise_type, int g_attend, String g_intro, String g_pic, int dno, int sno,
			int sgno) {
		super();
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_pic = g_pic;
		this.dno = dno;
		this.sno = sno;
		this.sgno = sgno;
	}

	public GroupVo(String g_name, String excercise_type, int g_attend, String g_intro,
			String g_pic, String g_leader) {
		super();
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_pic = g_pic;
		this.g_leader = g_leader;
	}

	
	public GroupVo(int gno, String g_name, String excercise_type, int g_attend, String g_intro,
			String g_pic) {
		super();
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_pic = g_pic;
	}

	public GroupVo(int gno, String g_name, String excercise_type, int g_attend, String g_intro,
			Date g_regdate, String g_pic, int g_present) {
		super();
		this.gno = gno;
		this.g_name = g_name;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_regdate = g_regdate;
		this.g_pic = g_pic;
		this.g_present = g_present;
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

	public String getG_leader() {
		return g_leader;
	}

	public void setG_leader(String g_leader) {
		this.g_leader = g_leader;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getSgno() {
		return sgno;
	}

	public void setSgno(int sgno) {
		this.sgno = sgno;
	}
	
}

package com.kh.team.vo;

public class testVo {
	private int gno;
	private String g_name;
	private int g_attend;
	private int g_present;
	private String g_learder;
	private String userid;
	private String u_pic;

	public testVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public testVo(int gno, String g_name, int g_attend, int g_present, String g_learder, String userid, String u_pic) {
		super();
		this.gno = gno;
		this.g_name = g_name;
		this.g_attend = g_attend;
		this.g_present = g_present;
		this.g_learder = g_learder;
		this.userid = userid;
		this.u_pic = u_pic;
	}

	@Override
	public String toString() {
		return "testVo [gno=" + gno + ", g_name=" + g_name + ", g_attend=" + g_attend + ", g_present=" + g_present
				+ ", g_learder=" + g_learder + ", userid=" + userid + ", u_pic=" + u_pic + "]";
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

	public int getG_attend() {
		return g_attend;
	}

	public void setG_attend(int g_attend) {
		this.g_attend = g_attend;
	}

	public int getG_present() {
		return g_present;
	}

	public void setG_present(int g_present) {
		this.g_present = g_present;
	}

	public String getG_learder() {
		return g_learder;
	}

	public void setG_learder(String g_learder) {
		this.g_learder = g_learder;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getU_pic() {
		return u_pic;
	}

	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}

}

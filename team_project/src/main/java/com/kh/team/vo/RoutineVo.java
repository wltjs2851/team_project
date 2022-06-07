package com.kh.team.vo;

import java.sql.Date;

public class RoutineVo {
	private int uno;
	private String u_title;
	private String u_content;
	private String userid;
	private Date u_regdate;
	private String u_pic;
	private int u_viewcnt;
	private int u_like;
	
	public RoutineVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoutineVo(String u_title, String u_content, String userid, String u_pic) {
		super();
		this.u_title = u_title;
		this.u_content = u_content;
		this.userid = userid;
		this.u_pic = u_pic;
	}

	public RoutineVo(int uno, String u_title, String u_content, String userid, String u_pic) {
		super();
		this.uno = uno;
		this.u_title = u_title;
		this.u_content = u_content;
		this.userid = userid;
		this.u_pic = u_pic;
	}

	public RoutineVo(int uno, String u_title, String u_content, String userid, String u_pic, int u_viewcnt,
			int u_like) {
		super();
		this.uno = uno;
		this.u_title = u_title;
		this.u_content = u_content;
		this.userid = userid;
		this.u_pic = u_pic;
		this.u_viewcnt = u_viewcnt;
		this.u_like = u_like;
	}

	public RoutineVo(int uno, String u_title, String u_content, String userid, Date u_regdate, String u_pic,
			int u_viewcnt, int u_like) {
		super();
		this.uno = uno;
		this.u_title = u_title;
		this.u_content = u_content;
		this.userid = userid;
		this.u_regdate = u_regdate;
		this.u_pic = u_pic;
		this.u_viewcnt = u_viewcnt;
		this.u_like = u_like;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getU_title() {
		return u_title;
	}

	public void setU_title(String u_title) {
		this.u_title = u_title;
	}

	public String getU_content() {
		return u_content;
	}

	public void setU_content(String u_content) {
		this.u_content = u_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	public String getU_pic() {
		return u_pic;
	}

	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}

	public int getU_viewcnt() {
		return u_viewcnt;
	}

	public void setU_viewcnt(int u_viewcnt) {
		this.u_viewcnt = u_viewcnt;
	}

	public int getU_like() {
		return u_like;
	}

	public void setU_like(int u_like) {
		this.u_like = u_like;
	}

	@Override
	public String toString() {
		return "UserRoutineVo [uno=" + uno + ", u_title=" + u_title + ", u_content=" + u_content + ", userid=" + userid
				+ ", u_regdate=" + u_regdate + ", u_pic=" + u_pic + ", u_viewcnt=" + u_viewcnt + ", u_like=" + u_like
				+ "]";
	}
	
}

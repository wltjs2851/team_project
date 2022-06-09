package com.kh.team.vo;

import java.sql.Date;

public class RoutineCommentVo {
	private int urcno;
	private int uno;
	private String urc_comment;
	private String userid;
	private Date u_regdate;
	private String u_pic;
	
	public RoutineCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoutineCommentVo(int uno, String urc_comment) {
		super();
		this.uno = uno;
		this.urc_comment = urc_comment;
	}

	public RoutineCommentVo(int uno, String urc_comment, String userid, String u_pic) {
		super();
		this.uno = uno;
		this.urc_comment = urc_comment;
		this.userid = userid;
		this.u_pic = u_pic;
	}

	public RoutineCommentVo(int urcno, int uno, String urc_comment, String userid, Date u_regdate, String u_pic) {
		super();
		this.urcno = urcno;
		this.uno = uno;
		this.urc_comment = urc_comment;
		this.userid = userid;
		this.u_regdate = u_regdate;
		this.u_pic = u_pic;
	}

	public int getUrcno() {
		return urcno;
	}

	public void setUrcno(int urcno) {
		this.urcno = urcno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUrc_comment() {
		return urc_comment;
	}

	public void setUrc_comment(String urc_comment) {
		this.urc_comment = urc_comment;
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

	@Override
	public String toString() {
		return "RoutineCommentVo [urcno=" + urcno + ", uno=" + uno + ", urc_comment=" + urc_comment + ", userid="
				+ userid + ", u_regdate=" + u_regdate + ", u_pic=" + u_pic + "]";
	}
}

package com.kh.team.vo;

import java.sql.Date;

public class FreeVo {
	private int fno;
	private String f_title;
	private String f_content;
	private String userid;
	private Date f_regdate;
	private String f_pic;
	private int f_viewcnt;
	private int f_like;
	private int fcode;
	private String fname;
	
	public FreeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FreeVo(String f_title, String f_content, String userid, String f_pic, int fcode) {
		super();
		this.f_title = f_title;
		this.f_content = f_content;
		this.userid = userid;
		this.f_pic = f_pic;
		this.fcode = fcode;
	}

	public FreeVo(int fno, String f_title, String f_content, String userid, String f_pic, int fcode) {
		super();
		this.fno = fno;
		this.f_title = f_title;
		this.f_content = f_content;
		this.userid = userid;
		this.f_pic = f_pic;
		this.fcode = fcode;
	}

	public FreeVo(int fno, String f_title, String f_content, String userid, Date f_regdate, String f_pic, int f_viewcnt,
			int f_like, int fcode, String fname) {
		super();
		this.fno = fno;
		this.f_title = f_title;
		this.f_content = f_content;
		this.userid = userid;
		this.f_regdate = f_regdate;
		this.f_pic = f_pic;
		this.f_viewcnt = f_viewcnt;
		this.f_like = f_like;
		this.fcode = fcode;
		this.fname = fname;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getF_regdate() {
		return f_regdate;
	}

	public void setF_regdate(Date f_regdate) {
		this.f_regdate = f_regdate;
	}

	public String getF_pic() {
		return f_pic;
	}

	public void setF_pic(String f_pic) {
		this.f_pic = f_pic;
	}

	public int getF_viewcnt() {
		return f_viewcnt;
	}

	public void setF_viewcnt(int f_viewcnt) {
		this.f_viewcnt = f_viewcnt;
	}

	public int getF_like() {
		return f_like;
	}

	public void setF_like(int f_like) {
		this.f_like = f_like;
	}

	public int getFcode() {
		return fcode;
	}

	public void setFcode(int fcode) {
		this.fcode = fcode;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Override
	public String toString() {
		return "FreeVo [fno=" + fno + ", f_title=" + f_title + ", f_content=" + f_content + ", userid=" + userid
				+ ", f_regdate=" + f_regdate + ", f_pic=" + f_pic + ", f_viewcnt=" + f_viewcnt + ", f_like=" + f_like
				+ ", fcode=" + fcode + ", fname=" + fname + "]";
	}
}

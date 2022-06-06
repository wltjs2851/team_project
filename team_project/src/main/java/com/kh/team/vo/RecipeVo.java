package com.kh.team.vo;

import java.sql.Date;

public class RecipeVo {
	private int rno;
	private String r_title;
	private String r_content;
	private String userid;
	private Date r_regdate;
	private String r_pic;
	private int r_viewcnt;
	private int r_like;
	
	public RecipeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RecipeVo(String r_title, String r_content, String userid, String r_pic) {
		super();
		this.r_title = r_title;
		this.r_content = r_content;
		this.userid = userid;
		this.r_pic = r_pic;
	}
	
	public RecipeVo(int rno, String r_title, String r_content, String userid, String r_pic) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.userid = userid;
		this.r_pic = r_pic;
	}

	public RecipeVo(int rno, String r_title, String r_content, String userid, String r_pic, int r_viewcnt, int r_like) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.userid = userid;
		this.r_pic = r_pic;
		this.r_viewcnt = r_viewcnt;
		this.r_like = r_like;
	}

	public RecipeVo(int rno, String r_title, String r_content, String userid, Date r_regdate, String r_pic,
			int r_viewcnt, int r_like) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.userid = userid;
		this.r_regdate = r_regdate;
		this.r_pic = r_pic;
		this.r_viewcnt = r_viewcnt;
		this.r_like = r_like;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getR_pic() {
		return r_pic;
	}

	public void setR_pic(String r_pic) {
		this.r_pic = r_pic;
	}

	public int getR_viewcnt() {
		return r_viewcnt;
	}

	public void setR_viewcnt(int r_viewcnt) {
		this.r_viewcnt = r_viewcnt;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	@Override
	public String toString() {
		return "RecipeVo [rno=" + rno + ", r_title=" + r_title + ", r_content=" + r_content + ", userid=" + userid
				+ ", r_regdate=" + r_regdate + ", r_pic=" + r_pic + ", r_viewcnt=" + r_viewcnt + ", r_like=" + r_like
				+ "]";
	}
}

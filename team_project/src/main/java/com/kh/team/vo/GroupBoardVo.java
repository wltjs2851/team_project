package com.kh.team.vo;

import java.sql.Date;

public class GroupBoardVo {
	
	private int gbno;
	private String gb_title;
	private String gb_content;
	private String userid;
	private String gb_notice;
	private Date gb_regdate;
	private int gb_like;
	private String gb_pic;
	private int gb_comment;
	private int gno;
	
	public GroupBoardVo() {
		super();
	}

	public GroupBoardVo(String gb_title, String gb_content, String userid, String gb_notice, String gb_pic) {
		super();
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gb_notice = gb_notice;
		this.gb_pic = gb_pic;
	}

	public GroupBoardVo(int gbno, String gb_title, String gb_content, String userid, String gb_notice, Date gb_regdate,
			int gb_like, String gb_pic) {
		super();
		this.gbno = gbno;
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gb_notice = gb_notice;
		this.gb_regdate = gb_regdate;
		this.gb_like = gb_like;
		this.gb_pic = gb_pic;
	}

	public GroupBoardVo(int gbno, String gb_title, String gb_content, String userid, String gb_notice, Date gb_regdate,
			int gb_like, String gb_pic, int gb_comment) {
		super();
		this.gbno = gbno;
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gb_notice = gb_notice;
		this.gb_regdate = gb_regdate;
		this.gb_like = gb_like;
		this.gb_pic = gb_pic;
		this.gb_comment = gb_comment;
	}

	public GroupBoardVo(int gbno, String gb_title, String gb_content, String userid, String gb_notice, Date gb_regdate,
			int gb_like, String gb_pic, int gb_comment, int gno) {
		super();
		this.gbno = gbno;
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gb_notice = gb_notice;
		this.gb_regdate = gb_regdate;
		this.gb_like = gb_like;
		this.gb_pic = gb_pic;
		this.gb_comment = gb_comment;
		this.gno = gno;
	}

	public int getGbno() {
		return gbno;
	}

	public void setGbno(int gbno) {
		this.gbno = gbno;
	}

	public String getGb_title() {
		return gb_title;
	}

	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}

	public String getGb_content() {
		return gb_content;
	}

	public void setGb_content(String gb_content) {
		this.gb_content = gb_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGb_notice() {
		return gb_notice;
	}

	public void setGb_notice(String gb_notice) {
		this.gb_notice = gb_notice;
	}

	public Date getGb_regdate() {
		return gb_regdate;
	}

	public void setGb_regdate(Date gb_regdate) {
		this.gb_regdate = gb_regdate;
	}

	public int getGb_like() {
		return gb_like;
	}

	public void setGb_like(int gb_like) {
		this.gb_like = gb_like;
	}

	public String getGb_pic() {
		return gb_pic;
	}

	public void setGb_pic(String gb_pic) {
		this.gb_pic = gb_pic;
	}

	public int getGb_comment() {
		return gb_comment;
	}

	public void setGb_comment(int gb_comment) {
		this.gb_comment = gb_comment;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	@Override
	public String toString() {
		return "GroupBoardVo [gbno=" + gbno + ", gb_title=" + gb_title + ", gb_content=" + gb_content + ", userid="
				+ userid + ", gb_notice=" + gb_notice + ", gb_regdate=" + gb_regdate + ", gb_like=" + gb_like
				+ ", gb_pic=" + gb_pic + ", gb_comment=" + gb_comment + ", gno=" + gno + "]";
	}

}

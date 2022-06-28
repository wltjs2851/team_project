package com.kh.team.vo;

import java.sql.Date;

public class RecipeCommentVo {
	private int rcno;
	private int rno;
	private String rc_comment;
	private String userid;
	private Date rc_regdate;
	private String u_pic;
	private int visible;
	
	public RecipeCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RecipeCommentVo(int rcno, String rc_comment) {
		super();
		this.rcno = rcno;
		this.rc_comment = rc_comment;
	}

	public RecipeCommentVo(int rno, String rc_comment, String userid, String u_pic) {
		super();
		this.rno = rno;
		this.rc_comment = rc_comment;
		this.userid = userid;
		this.u_pic = u_pic;
	}

	public RecipeCommentVo(int rcno, int rno, String rc_comment, String userid, Date rc_regdate, String u_pic) {
		super();
		this.rcno = rcno;
		this.rno = rno;
		this.rc_comment = rc_comment;
		this.userid = userid;
		this.rc_regdate = rc_regdate;
		this.u_pic = u_pic;
	}

	public RecipeCommentVo(int rcno, int rno, String rc_comment, String userid, Date rc_regdate, String u_pic,
			int visible) {
		super();
		this.rcno = rcno;
		this.rno = rno;
		this.rc_comment = rc_comment;
		this.userid = userid;
		this.rc_regdate = rc_regdate;
		this.u_pic = u_pic;
		this.visible = visible;
	}

	public int getRcno() {
		return rcno;
	}

	public void setRcno(int rcno) {
		this.rcno = rcno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRc_comment() {
		return rc_comment;
	}

	public void setRc_comment(String rc_comment) {
		this.rc_comment = rc_comment;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getRc_regdate() {
		return rc_regdate;
	}

	public void setRc_regdate(Date rc_regdate) {
		this.rc_regdate = rc_regdate;
	}

	public String getU_pic() {
		return u_pic;
	}

	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "RecipeCommentVo [rcno=" + rcno + ", rno=" + rno + ", rc_comment=" + rc_comment + ", userid=" + userid
				+ ", rc_regdate=" + rc_regdate + ", u_pic=" + u_pic + ", visible=" + visible + "]";
	}
}

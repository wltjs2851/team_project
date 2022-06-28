package com.kh.team.vo;

import java.sql.Date;

public class FreeCommentVo {
	private int fcno;
	private int fno;
	private String fc_comment;
	private String userid;
	private Date f_regdate;
	private String u_pic;
	private int visible;
	
	public FreeCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FreeCommentVo(int fno, String fc_comment) {
		super();
		this.fno = fno;
		this.fc_comment = fc_comment;
	}

	public FreeCommentVo(int fno, String fc_comment, String userid, String u_pic) {
		super();
		this.fno = fno;
		this.fc_comment = fc_comment;
		this.userid = userid;
		this.u_pic = u_pic;
	}

	public FreeCommentVo(int fcno, int fno, String fc_comment, String userid, Date f_regdate, String u_pic) {
		super();
		this.fcno = fcno;
		this.fno = fno;
		this.fc_comment = fc_comment;
		this.userid = userid;
		this.f_regdate = f_regdate;
		this.u_pic = u_pic;
	}

	public FreeCommentVo(int fcno, int fno, String fc_comment, String userid, Date f_regdate, String u_pic,
			int visible) {
		super();
		this.fcno = fcno;
		this.fno = fno;
		this.fc_comment = fc_comment;
		this.userid = userid;
		this.f_regdate = f_regdate;
		this.u_pic = u_pic;
		this.visible = visible;
	}

	public int getFcno() {
		return fcno;
	}

	public void setFcno(int fcno) {
		this.fcno = fcno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFc_comment() {
		return fc_comment;
	}

	public void setFc_comment(String fc_comment) {
		this.fc_comment = fc_comment;
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
		return "FreeCommentVo [fcno=" + fcno + ", fno=" + fno + ", fc_comment=" + fc_comment + ", userid=" + userid
				+ ", f_regdate=" + f_regdate + ", u_pic=" + u_pic + ", visible=" + visible + "]";
	}
}

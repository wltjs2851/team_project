package com.kh.team.vo;

import java.sql.Date;

// 추천 운동게시판 댓글
public class RecommendCommentVo {
	private int recno;
	private int reno;
	private String re_comment;
	private String userid;
	private Date re_regdate;

	public RecommendCommentVo() {
		super();
	}

	public RecommendCommentVo(int recno, int reno, String re_comment, String userid, Date re_regdate) {
		super();
		this.recno = recno;
		this.reno = reno;
		this.re_comment = re_comment;
		this.userid = userid;
		this.re_regdate = re_regdate;
	}

	@Override
	public String toString() {
		return "RecommendCommentVo [recno=" + recno + ", reno=" + reno + ", re_comment=" + re_comment + ", userid="
				+ userid + ", re_regdate=" + re_regdate + "]";
	}

	public int getRecno() {
		return recno;
	}

	public void setRecno(int recno) {
		this.recno = recno;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(Date re_regdate) {
		this.re_regdate = re_regdate;
	}

}

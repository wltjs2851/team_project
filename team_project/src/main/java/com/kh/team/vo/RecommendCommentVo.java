package com.kh.team.vo;

import java.sql.Date;

// 추천 운동게시판 댓글
public class RecommendCommentVo {
	private int recno;
	private int reno;
	private String re_comment;
	private String nickname;
	private Date re_regdate;
	private int visible;

	public RecommendCommentVo() {
		super();
	}

	public RecommendCommentVo(int recno, int reno, String re_comment, String nickname, Date re_regdate) {
		super();
		this.recno = recno;
		this.reno = reno;
		this.re_comment = re_comment;
		this.nickname = nickname;
		this.re_regdate = re_regdate;
	}

	public RecommendCommentVo(int recno, int reno, String re_comment, String nickname, Date re_regdate, int visible) {
		super();
		this.recno = recno;
		this.reno = reno;
		this.re_comment = re_comment;
		this.nickname = nickname;
		this.re_regdate = re_regdate;
		this.visible = visible;
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

	public String getnickname() {
		return nickname;
	}

	public void setnickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(Date re_regdate) {
		this.re_regdate = re_regdate;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "RecommendCommentVo [recno=" + recno + ", reno=" + reno + ", re_comment=" + re_comment + ", nickname="
				+ nickname + ", re_regdate=" + re_regdate + ", visible=" + visible + "]";
	}

}

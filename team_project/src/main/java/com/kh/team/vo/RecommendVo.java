package com.kh.team.vo;

import java.sql.Date;

public class RecommendVo {
	// 추천 운동법 게시판
	private int reno; // 글번호
	private String re_content;
	private String re_title;
	private Date re_regdate;

	private int re_like;
	private int re_viewcnt;

	public RecommendVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecommendVo(int reno, String re_content, String re_title, Date re_regdate, int re_like, int re_viewcnt) {
		super();
		this.reno = reno;
		this.re_content = re_content;
		this.re_title = re_title;
		this.re_regdate = re_regdate;
		this.re_like = re_like;
		this.re_viewcnt = re_viewcnt;
	}

	public RecommendVo(int reno, String re_content, String re_title, Date re_regdate) {
		super();
		this.reno = reno;
		this.re_content = re_content;
		this.re_title = re_title;
		this.re_regdate = re_regdate;
	}

	public RecommendVo(String re_content, String re_title, Date re_regdate) {
		super();
		this.re_content = re_content;
		this.re_title = re_title;
		this.re_regdate = re_regdate;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public Date getRe_regdate() {
		return re_regdate;
	}

	public void setRe_regdate(Date re_regdate) {
		this.re_regdate = re_regdate;
	}

	public int getRe_like() {
		return re_like;
	}

	public void setRe_like(int re_like) {
		this.re_like = re_like;
	}

	public int getRe_viewcnt() {
		return re_viewcnt;
	}

	public void setRe_viewcnt(int re_viewcnt) {
		this.re_viewcnt = re_viewcnt;
	}

	@Override
	public String toString() {
		return "RecommendVo [reno=" + reno + ", re_content=" + re_content + ", re_title=" + re_title + ", re_regdate="
				+ re_regdate + ", re_like=" + re_like + ", re_viewcnt=" + re_viewcnt + "]";
	}

}

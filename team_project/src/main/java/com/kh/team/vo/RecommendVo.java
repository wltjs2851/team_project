package com.kh.team.vo;

import java.sql.Date;

public class RecommendVo {
	// 추천 운동법 게시판
	private int reno; // 글번호
	private String re_content;
	private String re_title;
	private Date re_regdate;
	private String nickname;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public RecommendVo(int reno, String re_content, String re_title, Date re_regdate, String nickname, int re_like,
			int re_viewcnt, String re_pic) {
		super();
		this.reno = reno;
		this.re_content = re_content;
		this.re_title = re_title;
		this.re_regdate = re_regdate;
		this.nickname = nickname;
		this.re_like = re_like;
		this.re_viewcnt = re_viewcnt;
		this.re_pic = re_pic;
	}

	private int re_like;
	private int re_viewcnt;
	
	private String re_pic;

	public String getRe_pic() {
		return re_pic;
	}

	public void setRe_pic(String re_pic) {
		this.re_pic = re_pic;
	}

	public RecommendVo(int reno, String re_content, String re_title, Date re_regdate, int re_like, int re_viewcnt,
			String re_pic) {
		super();
		this.reno = reno;
		this.re_content = re_content;
		this.re_title = re_title;
		this.re_regdate = re_regdate;
		this.re_like = re_like;
		this.re_viewcnt = re_viewcnt;
		this.re_pic = re_pic;
	}

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

	public RecommendVo(int reno, String re_content, String re_title) {
		super();
		this.reno = reno;
		this.re_content = re_content;
		this.re_title = re_title;
	}

	public RecommendVo(String re_content, String re_title, Date re_regdate) {
		super();
		this.re_content = re_content;
		this.re_title = re_title;
		this.re_regdate = re_regdate;
	}

	public RecommendVo(String re_content, String re_title) {
		super();
		this.re_content = re_content;
		this.re_title = re_title;
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
				+ re_regdate + ", nickname=" + nickname + ", re_like=" + re_like + ", re_viewcnt=" + re_viewcnt
				+ ", re_pic=" + re_pic + "]";
	}

}

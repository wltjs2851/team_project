package com.kh.team.vo;

public class RecommendLikeVo {
	private int re_lno;
	private String nickname;
	private int reno;

	public RecommendLikeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecommendLikeVo(int re_lno, String nickname, int reno) {
		super();
		this.re_lno = re_lno;
		this.nickname = nickname;
		this.reno = reno;
	}

	public int getRe_lno() {
		return re_lno;
	}

	public void setRe_lno(int re_lno) {
		this.re_lno = re_lno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	@Override
	public String toString() {
		return "RecommendLikeVo [re_lno=" + re_lno + ", nickname=" + nickname + ", reno=" + reno + "]";
	}

}

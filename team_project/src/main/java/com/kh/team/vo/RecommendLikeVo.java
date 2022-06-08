package com.kh.team.vo;

public class RecommendLikeVo {
	private int re_lno;
	private String userid;
	private int reno;

	public RecommendLikeVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecommendLikeVo(int re_lno, String userid, int reno) {
		super();
		this.re_lno = re_lno;
		this.userid = userid;
		this.reno = reno;
	}

	public int getRe_lno() {
		return re_lno;
	}

	public void setRe_lno(int re_lno) {
		this.re_lno = re_lno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	@Override
	public String toString() {
		return "RecommendLikeVo [re_lno=" + re_lno + ", userid=" + userid + ", reno=" + reno + "]";
	}

}

package com.kh.team.vo;

public class GroupBoardLikeVo {
	
	private int gb_lno;
	private int gbno;
	private String userid;
	
	public GroupBoardLikeVo() {
		super();
	}

	public GroupBoardLikeVo(int gb_lno, int gbno, String userid) {
		super();
		this.gb_lno = gb_lno;
		this.gbno = gbno;
		this.userid = userid;
	}

	public int getGb_lno() {
		return gb_lno;
	}

	public void setGb_lno(int gb_lno) {
		this.gb_lno = gb_lno;
	}

	public int getGbno() {
		return gbno;
	}

	public void setGbno(int gbno) {
		this.gbno = gbno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "GroupBoardLikeVo [gb_lno=" + gb_lno + ", gbno=" + gbno + ", userid=" + userid + "]";
	}

}

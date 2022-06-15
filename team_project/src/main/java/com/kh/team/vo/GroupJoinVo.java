package com.kh.team.vo;

public class GroupJoinVo {
	private int jno;
	private int gno;
	private String userid;
	
	public GroupJoinVo() {
		super();
	}

	public GroupJoinVo(int jno, int gno, String userid) {
		super();
		this.jno = jno;
		this.gno = gno;
		this.userid = userid;
	}

	public int getJno() {
		return jno;
	}

	public void setJno(int jno) {
		this.jno = jno;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "GroupJoinVo [jno=" + jno + ", gno=" + gno + ", userid=" + userid + "]";
	}
	
}

package com.kh.team.vo;

public class GroupJoinVo {
	private int jno;
	private int gno;
	private String userid;
	private String nickname;
	
	public GroupJoinVo() {
		super();
	}

	public GroupJoinVo(int jno, int gno, String userid) {
		super();
		this.jno = jno;
		this.gno = gno;
		this.userid = userid;
	}

	public GroupJoinVo(int jno, int gno, String userid, String nickname) {
		super();
		this.jno = jno;
		this.gno = gno;
		this.userid = userid;
		this.nickname = nickname;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "GroupJoinVo [jno=" + jno + ", gno=" + gno + ", userid=" + userid + ", nickname=" + nickname + "]";
	}

}

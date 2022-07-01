package com.kh.team.vo;

public class GroupBoardLikeVo {
	
	private int gb_lno;
	private int gbno;
	private String nickname;
	private int gno;
	
	public GroupBoardLikeVo() {
		super();
	}

	public GroupBoardLikeVo(int gb_lno, int gbno, String nickname, int gno) {
		super();
		this.gb_lno = gb_lno;
		this.gbno = gbno;
		this.nickname = nickname;
		this.gno = gno;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	@Override
	public String toString() {
		return "GroupBoardLikeVo [gb_lno=" + gb_lno + ", gbno=" + gbno + ", nickname=" + nickname + ", gno=" + gno + "]";
	}

}

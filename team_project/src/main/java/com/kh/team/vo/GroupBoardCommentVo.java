package com.kh.team.vo;

import java.sql.Date;

public class GroupBoardCommentVo {
	
	private int gbcno;
	private String gbc_content;
	private int gbno;
	private String userid;
	private Date gbc_regdate;
	
	public GroupBoardCommentVo() {
		super();
	}

	public GroupBoardCommentVo(int gbcno, String gbc_content, int gbno, String userid, Date gbc_regdate) {
		super();
		this.gbcno = gbcno;
		this.gbc_content = gbc_content;
		this.gbno = gbno;
		this.userid = userid;
		this.gbc_regdate = gbc_regdate;
	}

	public int getGbcno() {
		return gbcno;
	}

	public void setGbcno(int gbcno) {
		this.gbcno = gbcno;
	}

	public String getGbc_content() {
		return gbc_content;
	}

	public void setGbc_content(String gbc_content) {
		this.gbc_content = gbc_content;
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

	public Date getGbc_regdate() {
		return gbc_regdate;
	}

	public void setGbc_regdate(Date gbc_regdate) {
		this.gbc_regdate = gbc_regdate;
	}

	@Override
	public String toString() {
		return "GroupBoardCommentVo [gbcno=" + gbcno + ", gbc_content=" + gbc_content + ", gbno=" + gbno + ", userid="
				+ userid + ", gbc_regdate=" + gbc_regdate + "]";
	}

}

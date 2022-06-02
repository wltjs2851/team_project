package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class GroupBoardVo {
	
	private int gbno;
	private String gb_title;
	private String gb_content;
	private String userid;
	private String gb_notice;
	private Date gb_regdate;
	private int gb_like;
	private String[] gb_pic;
	
	public GroupBoardVo() {
		super();
	}

	public GroupBoardVo(String gb_title, String gb_content, String userid, String gb_notice, String[] gb_pic) {
		super();
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gb_notice = gb_notice;
		this.gb_pic = gb_pic;
	}

	public GroupBoardVo(int gbno, String gb_title, String gb_content, String userid, String gb_notice, Date gb_regdate,
			int gb_like, String[] gb_pic) {
		super();
		this.gbno = gbno;
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gb_notice = gb_notice;
		this.gb_regdate = gb_regdate;
		this.gb_like = gb_like;
		this.gb_pic = gb_pic;
	}

	@Override
	public String toString() {
		return "GroupBoardVo [gbno=" + gbno + ", gb_title=" + gb_title + ", gb_content=" + gb_content + ", userid="
				+ userid + ", gb_notice=" + gb_notice + ", gb_regdate=" + gb_regdate + ", gb_like=" + gb_like
				+ ", gb_pic=" + Arrays.toString(gb_pic) + "]";
	}
	
}

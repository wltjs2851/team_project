package com.kh.team.vo;

import java.sql.Date;
import java.util.Arrays;

public class GroupBoardVo {
	
	private int gbno;
	private String gb_title;
	private String gb_content;
	private String userid;
	private String gn_notice;
	private Date gb_regdate;
	private int gb_like;
	private String[] g_pic;
	
	public GroupBoardVo() {
		super();
	}

	public GroupBoardVo(int gbno, String gb_title, String gb_content, String userid, String gn_notice, Date gb_regdate,
			int gb_like, String[] g_pic) {
		super();
		this.gbno = gbno;
		this.gb_title = gb_title;
		this.gb_content = gb_content;
		this.userid = userid;
		this.gn_notice = gn_notice;
		this.gb_regdate = gb_regdate;
		this.gb_like = gb_like;
		this.g_pic = g_pic;
	}

	public int getGbno() {
		return gbno;
	}

	public void setGbno(int gbno) {
		this.gbno = gbno;
	}

	public String getGb_title() {
		return gb_title;
	}

	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}

	public String getGb_content() {
		return gb_content;
	}

	public void setGb_content(String gb_content) {
		this.gb_content = gb_content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getGn_notice() {
		return gn_notice;
	}

	public void setGn_notice(String gn_notice) {
		this.gn_notice = gn_notice;
	}

	public Date getGb_regdate() {
		return gb_regdate;
	}

	public void setGb_regdate(Date gb_regdate) {
		this.gb_regdate = gb_regdate;
	}

	public int getGb_like() {
		return gb_like;
	}

	public void setGb_like(int gb_like) {
		this.gb_like = gb_like;
	}

	public String[] getG_pic() {
		return g_pic;
	}

	public void setG_pic(String[] g_pic) {
		this.g_pic = g_pic;
	}

	@Override
	public String toString() {
		return "GroupVo [gbno=" + gbno + ", gb_title=" + gb_title + ", gb_content=" + gb_content + ", userid=" + userid
				+ ", gn_notice=" + gn_notice + ", gb_regdate=" + gb_regdate + ", gb_like=" + gb_like + ", g_pic="
				+ Arrays.toString(g_pic) + "]";
	}

}

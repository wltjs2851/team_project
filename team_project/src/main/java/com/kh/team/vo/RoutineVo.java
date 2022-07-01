package com.kh.team.vo;

import java.sql.Date;

public class RoutineVo {
	private int uno;
	private String ur_title;
	private String ur_content;
	private String nickname;
	private Date ur_regdate;
	private String ur_pic;
	private int ur_viewcnt;
	private int ur_like;
	private int visible;
	
	public RoutineVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoutineVo(int uno, String nickname) {
		super();
		this.uno = uno;
		this.nickname = nickname;
	}

	public RoutineVo(int uno, String nickname, int ur_like) {
		super();
		this.uno = uno;
		this.nickname = nickname;
		this.ur_like = ur_like;
	}

	public RoutineVo(String ur_title, String ur_content, String nickname, String ur_pic) {
		super();
		this.ur_title = ur_title;
		this.ur_content = ur_content;
		this.nickname = nickname;
		this.ur_pic = ur_pic;
	}

	public RoutineVo(int uno, String ur_title, String ur_content, String nickname, String ur_pic) {
		super();
		this.uno = uno;
		this.ur_title = ur_title;
		this.ur_content = ur_content;
		this.nickname = nickname;
		this.ur_pic = ur_pic;
	}

	public RoutineVo(int uno, String ur_title, String ur_content, String nickname, String ur_pic, int ur_viewcnt,
			int ur_like) {
		super();
		this.uno = uno;
		this.ur_title = ur_title;
		this.ur_content = ur_content;
		this.nickname = nickname;
		this.ur_pic = ur_pic;
		this.ur_viewcnt = ur_viewcnt;
		this.ur_like = ur_like;
	}

	public RoutineVo(int uno, String ur_title, String ur_content, String nickname, Date ur_regdate, String ur_pic,
			int ur_viewcnt, int ur_like) {
		super();
		this.uno = uno;
		this.ur_title = ur_title;
		this.ur_content = ur_content;
		this.nickname = nickname;
		this.ur_regdate = ur_regdate;
		this.ur_pic = ur_pic;
		this.ur_viewcnt = ur_viewcnt;
		this.ur_like = ur_like;
	}

	public RoutineVo(int uno, String ur_title, String ur_content, String nickname, Date ur_regdate, String ur_pic,
			int ur_viewcnt, int ur_like, int visible) {
		super();
		this.uno = uno;
		this.ur_title = ur_title;
		this.ur_content = ur_content;
		this.nickname = nickname;
		this.ur_regdate = ur_regdate;
		this.ur_pic = ur_pic;
		this.ur_viewcnt = ur_viewcnt;
		this.ur_like = ur_like;
		this.visible = visible;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUr_title() {
		return ur_title;
	}

	public void setUr_title(String ur_title) {
		this.ur_title = ur_title;
	}

	public String getUr_content() {
		return ur_content;
	}

	public void setUr_content(String ur_content) {
		this.ur_content = ur_content;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getUr_regdate() {
		return ur_regdate;
	}

	public void setUr_regdate(Date ur_regdate) {
		this.ur_regdate = ur_regdate;
	}

	public String getUr_pic() {
		return ur_pic;
	}

	public void setUr_pic(String ur_pic) {
		this.ur_pic = ur_pic;
	}

	public int getUr_viewcnt() {
		return ur_viewcnt;
	}

	public void setUr_viewcnt(int ur_viewcnt) {
		this.ur_viewcnt = ur_viewcnt;
	}

	public int getUr_like() {
		return ur_like;
	}

	public void setUr_like(int ur_like) {
		this.ur_like = ur_like;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "RoutineVo [uno=" + uno + ", ur_title=" + ur_title + ", ur_content=" + ur_content + ", nickname=" + nickname
				+ ", ur_regdate=" + ur_regdate + ", ur_pic=" + ur_pic + ", ur_viewcnt=" + ur_viewcnt + ", ur_like="
				+ ur_like + ", visible=" + visible + "]";
	}
}

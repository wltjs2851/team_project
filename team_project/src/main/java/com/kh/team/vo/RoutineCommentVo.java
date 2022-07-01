package com.kh.team.vo;

import java.sql.Date;

public class RoutineCommentVo {
	private int urcno;
	private int uno;
	private String urc_comment;
	private String nickname;
	private Date u_regdate;
	private String u_pic;
	private int visible;
	
	public RoutineCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoutineCommentVo(int uno, String urc_comment) {
		super();
		this.uno = uno;
		this.urc_comment = urc_comment;
	}

	public RoutineCommentVo(int uno, String urc_comment, String nickname, String u_pic) {
		super();
		this.uno = uno;
		this.urc_comment = urc_comment;
		this.nickname = nickname;
		this.u_pic = u_pic;
	}

	public RoutineCommentVo(int urcno, int uno, String urc_comment, String nickname, Date u_regdate, String u_pic) {
		super();
		this.urcno = urcno;
		this.uno = uno;
		this.urc_comment = urc_comment;
		this.nickname = nickname;
		this.u_regdate = u_regdate;
		this.u_pic = u_pic;
	}

	public RoutineCommentVo(int urcno, int uno, String urc_comment, String nickname, Date u_regdate, String u_pic,
			int visible) {
		super();
		this.urcno = urcno;
		this.uno = uno;
		this.urc_comment = urc_comment;
		this.nickname = nickname;
		this.u_regdate = u_regdate;
		this.u_pic = u_pic;
		this.visible = visible;
	}

	public int getUrcno() {
		return urcno;
	}

	public void setUrcno(int urcno) {
		this.urcno = urcno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getUrc_comment() {
		return urc_comment;
	}

	public void setUrc_comment(String urc_comment) {
		this.urc_comment = urc_comment;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	public String getU_pic() {
		return u_pic;
	}

	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "RoutineCommentVo [urcno=" + urcno + ", uno=" + uno + ", urc_comment=" + urc_comment + ", nickname="
				+ nickname + ", u_regdate=" + u_regdate + ", u_pic=" + u_pic + ", visible=" + visible + "]";
	}
}

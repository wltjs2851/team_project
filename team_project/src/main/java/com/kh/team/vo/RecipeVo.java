package com.kh.team.vo;

import java.sql.Date;

public class RecipeVo {
	private int rno;
	private String r_title;
	private String r_content;
	private String nickname;
	private Date r_regdate;
	private String r_pic;
	private int r_viewcnt;
	private int r_like;
	private String r_product;
	private int visible;
	
	public RecipeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RecipeVo(int rno, String nickname) {
		super();
		this.rno = rno;
		this.nickname = nickname;
	}
	
	public RecipeVo(int rno, int r_like, String nickname) {
		super();
		this.rno = rno;
		this.nickname = nickname;
		this.r_like = r_like;
	}

	public RecipeVo(String r_title, String r_content, String nickname, String r_pic, String r_product) {
		super();
		this.r_title = r_title;
		this.r_content = r_content;
		this.nickname = nickname;
		this.r_pic = r_pic;
		this.r_product = r_product;
	}
	
	public RecipeVo(int rno, String r_title, String r_content, String nickname, String r_pic, String r_product) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.nickname = nickname;
		this.r_pic = r_pic;
		this.r_product = r_product;
	}

	public RecipeVo(int rno, String r_title, String r_content, String nickname, String r_pic, 
				int r_viewcnt, int r_like, String r_product) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.nickname = nickname;
		this.r_pic = r_pic;
		this.r_viewcnt = r_viewcnt;
		this.r_like = r_like;
		this.r_product = r_product;
	}

	public RecipeVo(int rno, String r_title, String r_content, String nickname, Date r_regdate, String r_pic,
			int r_viewcnt, int r_like, String r_product) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.nickname = nickname;
		this.r_regdate = r_regdate;
		this.r_pic = r_pic;
		this.r_viewcnt = r_viewcnt;
		this.r_like = r_like;
		this.r_product = r_product;
	}

	public RecipeVo(int rno, String r_title, String r_content, String nickname, Date r_regdate, String r_pic,
			int r_viewcnt, int r_like, String r_product, int visible) {
		super();
		this.rno = rno;
		this.r_title = r_title;
		this.r_content = r_content;
		this.nickname = nickname;
		this.r_regdate = r_regdate;
		this.r_pic = r_pic;
		this.r_viewcnt = r_viewcnt;
		this.r_like = r_like;
		this.r_product = r_product;
		this.visible = visible;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getR_pic() {
		return r_pic;
	}

	public void setR_pic(String r_pic) {
		this.r_pic = r_pic;
	}

	public int getR_viewcnt() {
		return r_viewcnt;
	}

	public void setR_viewcnt(int r_viewcnt) {
		this.r_viewcnt = r_viewcnt;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public String getR_product() {
		return r_product;
	}

	public void setR_product(String r_product) {
		this.r_product = r_product;
	}

	public int getVisible() {
		return visible;
	}

	public void setVisible(int visible) {
		this.visible = visible;
	}

	@Override
	public String toString() {
		return "RecipeVo [rno=" + rno + ", r_title=" + r_title + ", r_content=" + r_content + ", nickname=" + nickname
				+ ", r_regdate=" + r_regdate + ", r_pic=" + r_pic + ", r_viewcnt=" + r_viewcnt + ", r_like=" + r_like
				+ ", r_product=" + r_product + ", visible=" + visible + "]";
	}
}

package com.kh.team.group;

import java.sql.Date;

public class GroupVo {
	
	private int gno;
	private String g_name;
	private String userid;
	private String excercise_type;
	private int g_attend;
	private String g_intro;
	private String g_location;
	private Date g_regdate;
	private String[] g_pic;
	
	public GroupVo() {
		super();
	}

	public GroupVo(int gno, String g_name, String userid, String excercise_type, int g_attend, String g_intro,
			String g_location, Date g_regdate, String[] g_pic) {
		super();
		this.gno = gno;
		this.g_name = g_name;
		this.userid = userid;
		this.excercise_type = excercise_type;
		this.g_attend = g_attend;
		this.g_intro = g_intro;
		this.g_location = g_location;
		this.g_regdate = g_regdate;
		this.g_pic = g_pic;
	}

}

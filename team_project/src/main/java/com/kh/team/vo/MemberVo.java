package com.kh.team.vo;

import java.sql.Date;

public class MemberVo {
	
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String address;
	private String gender;
	private String nickname;
    private int age;
    private int u_point;
    private String u_pic;
    private Date regDate;
	
    public MemberVo() {
		super();
	}

	public MemberVo(String userid, String userpw, String username, String email, String address, String gender,
			String nickname, int age, int u_point, String u_pic, Date regDate) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.email = email;
		this.address = address;
		this.gender = gender;
		this.nickname = nickname;
		this.age = age;
		this.u_point = u_point;
		this.u_pic = u_pic;
		this.regDate = regDate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public String getU_pic() {
		return u_pic;
	}

	public void setU_pic(String u_pic) {
		this.u_pic = u_pic;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", address=" + address + ", gender=" + gender + ", nickname=" + nickname + ", age=" + age
				+ ", u_point=" + u_point + ", u_pic=" + u_pic + ", regDate=" + regDate + "]";
	}

}

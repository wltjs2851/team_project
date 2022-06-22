package com.kh.team.vo;

public class LocationVo {
	private int lno;
	private int dno;
	private int uno;
	private int sno;
	private String lname;
	
	public LocationVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LocationVo(int dno, int uno, int sno, String lname) {
		super();
		this.dno = dno;
		this.uno = uno;
		this.sno = sno;
		this.lname = lname;
	}

	public LocationVo(int lno, int dno, int uno, int sno, String lname) {
		super();
		this.lno = lno;
		this.dno = dno;
		this.uno = uno;
		this.sno = sno;
		this.lname = lname;
	}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Override
	public String toString() {
		return "LocationVo [lno=" + lno + ", dno=" + dno + ", uno=" + uno + ", sno=" + sno + ", lname=" + lname + "]";
	}
}

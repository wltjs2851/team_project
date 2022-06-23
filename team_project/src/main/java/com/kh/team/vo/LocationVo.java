package com.kh.team.vo;

public class LocationVo {
	private int lno;
	private int dno;
	private int sno;
	private int sgno;
	private String lname;
	private int startRow;
	private int endRow;
	
	public LocationVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LocationVo(int dno, int sno, int sgno, int startRow, int endRow) {
		super();
		this.dno = dno;
		this.sno = sno;
		this.sgno = sgno;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public LocationVo(int dno, int sno, int sgno, String lname) {
		super();
		this.dno = dno;
		this.sno = sno;
		this.sgno = sgno;
		this.lname = lname;
	}
	
	public LocationVo(int dno, int sno, int sgno) {
		super();
		this.dno = dno;
		this.sno = sno;
		this.sgno = sgno;
	}

	public LocationVo(int lno, int dno, int sno, int sgno, String lname) {
		super();
		this.lno = lno;
		this.dno = dno;
		this.sno = sno;
		this.sgno = sgno;
		this.lname = lname;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
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

	public int getsno() {
		return sno;
	}

	public void setsno(int sno) {
		this.sno = sno;
	}

	public int getSgno() {
		return sgno;
	}

	public void setSgno(int sgno) {
		this.sgno = sgno;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Override
	public String toString() {
		return "LocationVo [lno=" + lno + ", dno=" + dno + ", sno=" + sno + ", sgno=" + sgno + ", lname=" + lname + "]";
	}
}

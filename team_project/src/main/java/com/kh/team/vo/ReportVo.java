package com.kh.team.vo;

public class ReportVo {
	
	private int repno;
	private String userid;
	private int gno;
	private String rep_casue;
	
	public ReportVo() {
		super();
	}

	public ReportVo(String rep_casue) {
		super();
		this.rep_casue = rep_casue;
	}

	public ReportVo(String userid, int gno) {
		super();
		this.userid = userid;
		this.gno = gno;
	}

	public ReportVo(int repno, String userid, int gno, String rep_casue) {
		super();
		this.repno = repno;
		this.userid = userid;
		this.gno = gno;
		this.rep_casue = rep_casue;
	}

	public int getRepno() {
		return repno;
	}

	public void setRepno(int repno) {
		this.repno = repno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getRep_casue() {
		return rep_casue;
	}

	public void setRep_casue(String rep_casue) {
		this.rep_casue = rep_casue;
	}

	@Override
	public String toString() {
		return "ReportVo [repno=" + repno + ", userid=" + userid + ", gno=" + gno + ", rep_casue=" + rep_casue + "]";
	}

}

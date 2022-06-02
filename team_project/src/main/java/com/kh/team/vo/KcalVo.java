package com.kh.team.vo;

// 칼로리사전
public class KcalVo {
	private int kno; // 글번호
	private String k_name; // 운동명
	private String k_time; // 운동 소요시간
	private String kcal; // 운동 소요 칼로리
	private String k_dgree; // 운동 정도

	@Override
	public String toString() {
		return "KalcVo [kno=" + kno + ", k_name=" + k_name + ", k_time=" + k_time + ", kcal=" + kcal + ", k_dgree="
				+ k_dgree + "]";
	}

	public KcalVo(String k_name, String k_time, String kcal, String k_dgree) {
		super();
		this.k_name = k_name;
		this.k_time = k_time;
		this.kcal = kcal;
		this.k_dgree = k_dgree;
	}

	public int getKno() {
		return kno;
	}

	public void setKno(int kno) {
		this.kno = kno;
	}

	public String getK_name() {
		return k_name;
	}

	public void setK_name(String k_name) {
		this.k_name = k_name;
	}

	public String getK_time() {
		return k_time;
	}

	public void setK_time(String k_time) {
		this.k_time = k_time;
	}

	public String getKcal() {
		return kcal;
	}

	public void setKcal(String kcal) {
		this.kcal = kcal;
	}

	public String getK_dgree() {
		return k_dgree;
	}

	public void setK_dgree(String k_dgree) {
		this.k_dgree = k_dgree;
	}

	public KcalVo(int kno, String k_name, String k_time, String kcal, String k_dgree) {
		super();
		this.kno = kno;
		this.k_name = k_name;
		this.k_time = k_time;
		this.kcal = kcal;
		this.k_dgree = k_dgree;
	}

	public KcalVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}

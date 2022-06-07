package com.kh.team.vo;

import java.sql.Date;

public class ScheduleDto {

	int schedule_idx;
	int schedule_num;
	String schedule_subject;
	String schedule_desc;
	Date schedule_date;
	
	
	public int getSchedule_idx() {
		return schedule_idx;
	}
	public void setSchedule_idx(int schedule_idx) {
		this.schedule_idx = schedule_idx;
	}
	
	
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	
	
	public String getSchedule_subject() {
		return schedule_subject;
	}
	public void setSchedule_subject(String schedule_subject) {
		this.schedule_subject = schedule_subject;
	}
	
	
	public String getSchedule_desc() {
		return schedule_desc;
	}
	public void setSchedule_desc(String schedule_desc) {
		this.schedule_desc = schedule_desc;
	}
	
	
	public Date getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}
	
	
	@Override
	public String toString() {
		return "ScheduleDto [schedule_idx=" + schedule_idx + ", schedule_num=" + schedule_num + ", schedule_subject="
				+ schedule_subject + ", schedule_desc=" + schedule_desc + ", schedule_date=" + schedule_date + "]";
	}
	
	
}

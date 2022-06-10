package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.ScheduleService;
import com.kh.team.vo.ScheduleVo;


@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private ScheduleService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String schedule() {
		return "admin/schedule";
	}
	
	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public String calendar() {
		return "admin/calendar";
	}
	
	// 달력 일정 추가 
	@RequestMapping(value = "/add", method = RequestMethod.PATCH)
	public String insertSchedule(ScheduleVo scheduleVo) {
		boolean result = service.insertSchedule(scheduleVo);
		System.out.println("ScheduleAdd, result:" + result);
		return "redirect:/calendar/list";
	}
	
	// 달력 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String scheduleList(Model model) {
		List<ScheduleVo> scheduleList = service.scheduleList();
		model.addAttribute("scheduleList", scheduleList);
		return "admin/schedule";
	}
	
	
}

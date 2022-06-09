package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String schedule() {
		return "admin/schedule";
	}
	
	@RequestMapping(value = "/schedulePopup", method = RequestMethod.GET)
	public String schedulePopup() {
		return "admin/schedulePopup";
	}
}

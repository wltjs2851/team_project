package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String schedule() {
		return "admin/schedule";
	}
	
//	@RequestMapping(value = "/data", method = RequestMethod.GET)
//	public String data(Model model) {
//		model.addAttribute("list", service.schList());
//		return "pageJsonReport";
//	}
//	
//	@RequestMapping(value = "/schedulePopup", method = RequestMethod.GET)
//	public String schedulePopup() {
//		return "admin/schedulePopup";
//	}
	
	
}

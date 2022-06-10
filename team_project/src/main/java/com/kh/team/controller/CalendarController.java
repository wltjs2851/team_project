package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.CalendarServcie;
import com.kh.team.vo.CalendarVo;
import com.kh.team.vo.MemberVo;


@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarServcie calendarService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String schedule() {
		return "admin/schedule";
	}
	
	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public String calendar(Model model, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		List<CalendarVo> calList = calendarService.getCal(userid);
		model.addAttribute("calList", calList);
		return "admin/calendar";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(String userid, String content, String start1) {
		CalendarVo vo = new CalendarVo(userid, content, start1); 
		calendarService.insertCal(vo);
		return "/calendar/cal";
	}
	
}

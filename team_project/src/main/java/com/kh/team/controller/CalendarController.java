package com.kh.team.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.ScheduleService;
import com.kh.team.vo.ScheduleVo;

import net.sf.json.JSONArray;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.team.service.CalendarServcie;
import com.kh.team.vo.CalendarVo;
import com.kh.team.vo.MemberVo;


@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private ScheduleService service;
	
	@Autowired
	private CalendarServcie calendarService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String schedule() {
		return "admin/schedule";
	}
	
	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public String calendar(Model model, HttpSession session, HttpServletRequest httpRequest) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		String thisYear = String.valueOf(LocalDate.now().getYear());
		String thisMonth = String.valueOf(LocalDate.now().getMonthValue());
		String month = thisYear + "_" + thisMonth;
		List<CalendarVo> calList = calendarService.getCal(month, userid);
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonCal", jsonArray.fromObject(calList));
		model.addAttribute("calList", calList);
		return "admin/calendar";
	}
	
	@RequestMapping(value = "/cal3", method = RequestMethod.GET)
	@ResponseBody
	public List<CalendarVo> calendar3(String month, String userid) {
		return calendarService.getCal(month, userid);
	}
	
	// 시영
	@RequestMapping(value = "/cal2", method = RequestMethod.GET)
	public String calendar2(Model model, HttpSession session, HttpServletRequest httpRequest) {
//		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
//		String userid = loginVo.getUserid();
		
//		String userid = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getUserid();
//		List<CalendarVo> calList = calendarService.getCal(userid);
//		model.addAttribute("calList", calList);
		return "admin/calendar2";
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
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public String save(String userid, String content, String start1) {
		CalendarVo vo = new CalendarVo(userid, content, start1); 
		boolean result = calendarService.insertCal(vo);
		return String.valueOf(result);
	}
	
}

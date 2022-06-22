package com.kh.team.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

import com.kh.team.service.CalendarServcie;
import com.kh.team.vo.CalendarVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
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
	
	@RequestMapping(value = "/newCalendar", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray newCalendar(Model model, HttpSession session, HttpServletRequest httpRequest) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		String thisYear = String.valueOf(LocalDate.now().getYear());
		String thisMonth = String.valueOf(LocalDate.now().getMonthValue());
		String month = thisYear + "_" + thisMonth;
		List<CalendarVo> calList = calendarService.getCal(month, userid);
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonCal", jsonArray.fromObject(calList));
		model.addAttribute("calList", calList);
		return jsonArray.fromObject(calList);
	}
	
	@RequestMapping(value = "/cal3", method = RequestMethod.GET)
	@ResponseBody
	public List<CalendarVo> calendar3(String month, String userid) {
		return calendarService.getCal(month, userid);
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String save(String userid, String content, String start1) {
		int cno = calendarService.getCount(userid, start1);
		System.out.println("cno: " + cno);
		if (cno >= 5) {
			return "false";
		}
		CalendarVo vo = new CalendarVo(userid, content, start1, cno);
		boolean result = calendarService.insertCal(vo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(String userid, String content, String start1, String checklist, int cno) {
		CalendarVo vo = new CalendarVo(userid, content, start1, checklist, cno);
		System.out.println(vo);
		calendarService.updateCheck(vo);
		return checklist;
	}
	
}

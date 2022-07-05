package com.kh.team.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.CalendarServcie;
import com.kh.team.vo.CalendarVo;
import com.kh.team.vo.MemberVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarServcie calendarService;
	
//	캘린더 리스트 불러오기
	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public String calendar(Model model, HttpSession session, HttpServletRequest httpRequest) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		String thisYear = String.valueOf(LocalDate.now().getYear());
		String thisMonth = String.valueOf(LocalDate.now().getMonthValue());
		String month = thisYear + "_" + thisMonth;
		Map<String, List<CalendarVo>> calMap = new HashMap<>();
		List<CalendarVo> calList = calendarService.getCal(month, userid);
		
		
		for (CalendarVo vo : calList) {
			
			List<CalendarVo> tempList = calMap.get(vo.getStart1());
			if (tempList == null) {
				tempList = new ArrayList<>();
			}
			tempList.add(vo);
			calMap.put(vo.getStart1(), tempList);
			
		}
		JSONArray mapArray = new JSONArray();
		
		Set<String> keys = calMap.keySet();
		for (String key:keys) {
			JSONObject mapObject = new JSONObject();
//			JSONArray jsonArray = new JSONArray();
			List<CalendarVo> tempList = calMap.get(key);
			mapObject.put(key, tempList);
			mapArray.add(mapObject);
		}
//		JSONArray jsonArray = new JSONArray();
//		System.out.println("calMap:" + calMap);
//		
//		
//		model.addAttribute("jsonCal", jsonArray.fromObject(calList));
//		model.addAttribute("calList", calList);
		model.addAttribute("jsonCal", mapArray.toString());
		return "admin/calendar";
	}
	
//	비동기로 캘린더 리스트 불러오기
	@RequestMapping(value = "/newCalendar", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, List<CalendarVo>> newCalendar(Model model, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		String thisYear = String.valueOf(LocalDate.now().getYear());
		String thisMonth = String.valueOf(LocalDate.now().getMonthValue());
		String month = thisYear + "_" + thisMonth;
		Map<String, List<CalendarVo>> calMap = new HashMap<>();
		List<CalendarVo> calList = calendarService.getCal(month, userid);
//		model.addAttribute("jsonCal", JSONArray.fromObject(calList));
//		model.addAttribute("calList", calList);
		for (CalendarVo vo : calList) {
			List<CalendarVo> tempList = calMap.get(vo.getStart1());
			if (tempList == null) {
				tempList = new ArrayList<>();
			}
			tempList.add(vo);
			calMap.put(vo.getStart1(), tempList);
		}
//		JSONArray mapArray = new JSONArray();
//		Set<String> keys = calMap.keySet();
//		System.out.println("keys" + keys);
//		for (String key:keys) {
//			JSONObject mapObject = new JSONObject();
//			JSONArray jsonArray = new JSONArray();
//			List<CalendarVo> tempList = calMap.get(key);
//			mapObject.put(key, tempList);
//			mapArray.add(mapObject);
//		}
//		model.addAttribute("jsonCal", mapArray.toString());
		System.out.println("calMap:" + calMap);
		return calMap;
	}
	
//	월 이동시 해당 월 데이터 가져오기
	@RequestMapping(value = "/cal3", method = RequestMethod.GET)
	@ResponseBody
	public List<CalendarVo> calendar3(String month, String userid) {
		return calendarService.getCal(month, userid);
	}
	
//	일정 입력시 저장
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String save(String userid, String content, String start1) {
		int cno = calendarService.getCount(userid, start1);
		System.out.println("cno: " + cno);
		if (cno >= 4) {
			return "false";
		}
		CalendarVo vo = new CalendarVo(userid, content, start1, cno);
		boolean result = calendarService.insertCal(vo);
		return String.valueOf(result);
	}
	
//	일정 체크 유무 반영
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public String update(String userid, String content, String start1, String checklist) {
		CalendarVo vo = new CalendarVo(userid, content, start1, checklist);
		System.out.println(vo);
		calendarService.updateCheck(vo);
		return checklist;
	}
	
//	일정 삭제
	@RequestMapping(value = "/deleteCal", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCal(String userid, String content, String start1) {
		CalendarVo vo = new CalendarVo(userid, content, start1);
		boolean result = calendarService.deleteCal(vo);
		return String.valueOf(result);
	}
	
}

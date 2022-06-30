package com.kh.team.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.GroupCalendarService;
import com.kh.team.vo.GroupCalendarVo;
import com.kh.team.vo.MemberVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/groupcal")
public class GroupCalendarController {
	
	@Autowired
	private GroupCalendarService gcService;
	
	@RequestMapping(value = "/insertGroupCal", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public String insertGroupCal(HttpSession session, GroupCalendarVo gcVo) {

		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		gcVo.setUserid(userid);
//		int gc_todo_cnt = gcService.getScheduleCnt(gcVo.getGno(), gcVo.getGc_date());
//		System.out.println("gc_todo_cnt: " + gc_todo_cnt);
//		if(gc_todo_cnt > 5) {
//			return "false";
//		}
		
		boolean result = gcService.insertGroupCal(gcVo);
		
		return String.valueOf(result);
	}

	@RequestMapping(value = "/groupCalendar", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray groupCalendar(HttpSession session, Model model, GroupCalendarVo gcVo) {
		
		List<GroupCalendarVo> gc_list = gcService.getGroupCal(gcVo.getGc_date(), gcVo.getGno());
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonCal", jsonArray.fromObject(gc_list));
		System.out.println("groupCalendar: " + gc_list);
		model.addAttribute("calList", gc_list);
		
		return jsonArray.fromObject(gc_list);
	}
	
	@RequestMapping(value = "/updateCal", method = RequestMethod.POST)
	@ResponseBody
	public String updateGroupCal(GroupCalendarVo groupCalendarVo) {
		boolean result = gcService.updateGroupCal(groupCalendarVo);
		String gc_content = groupCalendarVo.getGc_content();
		
		System.out.println("gc_content: " + gc_content);
		
		return String.valueOf(result);
	}
}

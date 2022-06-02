package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.GroupService;
import com.kh.team.vo.GroupVo;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getGroupList(Model model) {
		List<GroupVo> list = groupService.groupList();
		model.addAttribute("groupList", list);
		return "board/list";
	}
}

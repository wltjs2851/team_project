package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.AdminService;
import com.kh.team.service.MemberService;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberSerive;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String adminMain(Model model) {
		
		List<MemberVo> lastestMember = memberSerive.getLatestMember();
		System.out.println("최근 가입 회원 목록:" + lastestMember);
		model.addAttribute("lastestMember", lastestMember);
		return "/admin/admin";
	}
	
	// 전체 회원 목록
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String adminMember(Model model) {
		List<MemberVo> memberList = memberSerive.getMemberList();
		model.addAttribute("memberList", memberList);
		return "/admin/adminMember";
	}
	
	@RequestMapping(value="/selectMember", method = RequestMethod.GET)
	public String adminSelectMember(String userid, Model model) {
		System.out.println("userid:" + userid);
		List<AdminVo> adminList = adminService.adminList(userid);
		model.addAttribute("adminList", adminList);
		return "/admin/adminSelectMember";
	}
	
}

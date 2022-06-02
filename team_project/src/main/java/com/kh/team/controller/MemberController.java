package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/login_form";
	}
	
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun() {
		return "/home";
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/join_form";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage() {
		return "/member/myPage";
	}
	
	@RequestMapping(value = "/myPoint", method = RequestMethod.GET)
	public String myPoint() {
		return "/member/myPoint";
	}
}

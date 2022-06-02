package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	// 운동칼로리 게시판
	@RequestMapping(value = "/kcal", method = RequestMethod.GET)
	public String kcal() {
		System.out.println("kcal.jsp 실행됨");
		return "admin/kcal";
	}
	
	// 추천 운동 게시판
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public String recommend() {
		System.out.println("recommend.jsp 실행됨");
		return "admin/recommend";
	}
	
}

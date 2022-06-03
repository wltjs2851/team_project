package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.KcalService;
import com.kh.team.service.RecommendService;
import com.kh.team.vo.KcalVo;
import com.kh.team.vo.RecommendVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private KcalService kcalService;
	
	@Autowired
	private RecommendService recommendService;
	
	// 운동칼로리 게시판
	@RequestMapping(value = "/kcal", method = RequestMethod.GET)
	public String kcal() {
		System.out.println("kcal.jsp 실행됨");
		return "admin/kcal";
	}
	
	// 운동칼로리 글 입력 양식 
		@RequestMapping(value = "/insertKcalForm", method = RequestMethod.GET)
		public String insertKcalForm() {
			return "admin/kcalForm";
		}
		
	// 운동칼로리 글 쓰기 
	@RequestMapping(value = "/insertKcal", method = RequestMethod.POST)
	public String insertKcal(KcalVo kcalVo, RedirectAttributes rttr) {
		System.out.println("AdminController, insertKcal, KcalVo:" + kcalVo);
		boolean result = kcalService.insertKcal(kcalVo);
		System.out.println("AdminController, insertKcal, result:" + result);
		rttr.addFlashAttribute("insertKcal_result", result);
		return "redirect:/admin/listKcal"; 
	}
	
	// 운동칼로리 글 목록 
	@RequestMapping(value = "/listKcal", method = RequestMethod.GET)
	public String listKcal(Model model) {
		List<KcalVo> listKcal = kcalService.listKcal();
		System.out.println("listKcal:" + listKcal);
		model.addAttribute("listKcal", listKcal);
		return "admin/kcal";// admin/kcal.jsp
	}
	
	
	// 추천 운동 게시판
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public String recommend() {
		System.out.println("recommend.jsp 실행됨");
		return "admin/recommend";
	}
	
	// 추천 운동 글쓰기 
	@RequestMapping(value = "/insertRecommend", method = RequestMethod.POST)
	public String insertRecommend(RecommendVo recommendVo, RedirectAttributes rttr) {
		boolean result = recommendService.insertRecommend(recommendVo);
		rttr.addFlashAttribute("insertRecommend_result", result);
		return "redirect:/admin/listRecommend";
	}
	
	// 추천 운동 글 목록
	@RequestMapping(value = "/listRecommend", method = RequestMethod.GET)
	public String listRecommend(RecommendVo recommendVo, Model model) {
		List<RecommendVo> listRecommend = recommendService.listRecommend();
		model.addAttribute("listRecommend", listRecommend);
		return "admin/recommend";
	}
	
	
}

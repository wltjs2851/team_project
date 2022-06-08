package com.kh.team.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.KcalService;
import com.kh.team.service.RecommendLikeService;
import com.kh.team.service.RecommendService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.KcalVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.RecommendLikeVo;
import com.kh.team.vo.RecommendVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private KcalService kcalService;
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecommendLikeService recommendLikeService;
	
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
		
		boolean result = kcalService.insertKcal(kcalVo);
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
	
	// 운동칼로리 글 조회
	@RequestMapping(value = "/selectByKno", method = RequestMethod.GET)
	public String selectByKno(int kno, Model model) {
		System.out.println("AdminController, selectByKno, kno:" + kno);
		KcalVo kcalVo = kcalService.selectByKno(kno);
		model.addAttribute("kcalVo", kcalVo);
		return "admin/kcalSelect";
	}
	
	// 운동칼로리 글 수정
	@RequestMapping(value = "/updateKcal", method = RequestMethod.POST)
	public String updateKcal(KcalVo kcalVo, RedirectAttributes rttr) {
		boolean result = kcalService.updateKcal(kcalVo);
		rttr.addFlashAttribute("updateKcal_result", result);
		return "redirect:/admin/selectByKno?kno=" + kcalVo.getKno();
	}
	
	// 운동칼로리 글 삭제 
	@RequestMapping(value = "/deleteKcal", method = RequestMethod.GET)
	public String deleteKcal(int kno, RedirectAttributes rttr) {
		boolean result = kcalService.deleteKcal(kno);
		rttr.addFlashAttribute("deleteKcal_result", result);
		return "redirect:/admin/listKcal";
	}
	
	
	// 추천 운동 게시판
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public String recommend() {
		System.out.println("recommend.jsp 실행됨");
		return "admin/recommend";
	}
	
	// 추천 운동 글쓰기 
	@RequestMapping(value = "/insertRecommend", method = RequestMethod.POST)
	public String insertRecommend(RecommendVo recommendVo, MultipartFile recoFile, RedirectAttributes rttr) {
		String originalFilename = recoFile.getOriginalFilename();
		try {
			String re_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, recoFile.getBytes());
			recommendVo.setRe_pic(re_pic);
			System.out.println("recommendVo, re_pic:" + recommendVo);
			
			boolean result = recommendService.insertRecommend(recommendVo);
			rttr.addFlashAttribute("insertRecommend_result", result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/listRecommend";
	}
	
	// 추천 운동 글 목록
	@RequestMapping(value = "/listRecommend", method = RequestMethod.GET)
	public String listRecommend(RecommendVo recommendVo, Model model) {
		List<RecommendVo> listRecommend = recommendService.listRecommend();
		model.addAttribute("listRecommend", listRecommend);
		return "admin/recommend";
	}
	
	// 추천 운동 글 등록 양식
	@RequestMapping(value = "/insertRecommendForm", method = RequestMethod.GET)
	public String insertRecommendForm() {
		return "admin/recommendForm";
	}
	
	// 추천 운동 글 조회
	@RequestMapping(value = "/selectByReno", method = RequestMethod.GET)
	public String selectByReno(int reno, Model model, HttpServletRequest httpRequest) throws Exception {
		RecommendVo recommendVo = recommendService.selectByReno(reno);
		model.addAttribute("recommendVo", recommendVo);
		
		// 좋아요
		String userid = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getUserid();
	
		RecommendLikeVo reLikeVo = new RecommendLikeVo();
		reLikeVo.setReno(reno);
		reLikeVo.setUserid(userid);
		
		int recommendLike = recommendLikeService.getRecommendLike(reLikeVo);
		System.out.println("recommendBoard, recommendLike:" + recommendLike);
		
		model.addAttribute("heart", recommendLike);
		
		return "admin/recommendSelect";
	}
	
	// 추천 운동 좋아요
	@ResponseBody
	@RequestMapping(value = "/heart", method = RequestMethod.POST)
	public int heart(HttpServletRequest httpRequest) throws Exception {
		
		int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		int reno = Integer.parseInt(httpRequest.getParameter("reno"));
		String userid = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getUserid();
		
		RecommendLikeVo reLikeVo = new RecommendLikeVo();
		reLikeVo.setReno(reno);
		reLikeVo.setUserid(userid);
		
		System.out.println("heart:" + heart);
		
		if (heart >= 1) {
			recommendLikeService.deleteRecommendLike(reLikeVo);
			heart = 0 ;
		} else {
			recommendLikeService.insertRecommendLike(reLikeVo);
			heart = 1;
		}
		return heart;
	}
	
	// 추천 운동 글 수정
	@RequestMapping(value = "/updateRecommend", method = RequestMethod.POST)
	public String updateRecommend(RecommendVo recommendVo, RedirectAttributes rttr) {
		boolean result = recommendService.updateRecommend(recommendVo);
		rttr.addFlashAttribute("updateRecommend_result", result);
		return "redirect:/admin/selectByReno?reno=" + recommendVo.getReno();
	}
	
	// 추천 운동 글 삭제
	@RequestMapping(value = "/deleteRecommend", method = RequestMethod.GET)
	public String deleteRecommend(int reno, RedirectAttributes rttr) {
		boolean result = recommendService.deleteRecommend(reno);
		rttr.addFlashAttribute("deleteRecommend_result", result);
		return "redirect:/admin/listRecommend";
	}
}

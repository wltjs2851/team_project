package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.KcalService;
import com.kh.team.service.RecommendLikeService;
import com.kh.team.service.RecommendService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.KcalVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
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
	public String insertKcal(KcalVo kcalVo, RedirectAttributes rttr, MultipartFile file) {
		// 첨부 파일 확인
		System.out.println("AdminController, insertKcal, file:" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("AdminController, insertKcal, originalFilename:" + originalFilename);
		
		if(originalFilename == null || originalFilename == "") {
			// 파일이 비어있을 경우 
			boolean result = kcalService.insertKcal(kcalVo);
			rttr.addFlashAttribute("insertKcal_result", result);
		} else {
			// 파일이 첨부되었을 경우 
			long size = file.getSize();
			try {
				String k_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
				kcalVo.setK_pic(k_pic);
				
				boolean result = kcalService.insertKcal(kcalVo);
				rttr.addFlashAttribute("insertKcal_result", result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/admin/listKcal"; 
	}
	
	// 운동칼로리 글 목록 
	@RequestMapping(value = "/listKcal", method = RequestMethod.GET)
	public String listKcal(Model model, PagingDto pagingDto, HttpSession session, HttpServletResponse response) {
//		System.out.println("AdminController, listKcal, pagingDto:" + pagingDto);
		pagingDto.setCount(kcalService.getCountKcal(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<KcalVo> listKcal = kcalService.listKcal(pagingDto);
//		pagingDto.setCount(kcalService.getCountKcal(pagingDto));
//		System.out.println("listKcal:" + listKcal);
		
		model.addAttribute("listKcal", listKcal);
		model.addAttribute("pagingDto", pagingDto);
		return "admin/kcal";// admin/kcal.jsp
	}
	
	// 운동칼로리 글 조회
	@RequestMapping(value = "/selectByKno", method = RequestMethod.GET)
	public String selectByKno(int kno, Model model, PagingDto pagingDto, HttpSession session) {
		System.out.println("AdminController, selectByKno, kno:" + kno);
		KcalVo kcalVo = kcalService.selectByKno(kno);
		List<KcalVo> listKcal = kcalService.listKcal(pagingDto);
		
		model.addAttribute("listKcal", listKcal);
		model.addAttribute("kcalVo", kcalVo);
		model.addAttribute("pagingDto", pagingDto);
		return "admin/kcalSelect";
	}
	
	// 운동칼로리 글 수정 양식
	@RequestMapping(value = "/kcalUpdateForm", method = RequestMethod.GET)
	public String updateFormKcal(int kno, Model model) {
		KcalVo kcalVo = kcalService.selectByKno(kno);
		model.addAttribute("kcalVo", kcalVo);
		
		return "admin/kcalUpdateForm";
	}
	// 운동칼로리 글 수정
	@RequestMapping(value = "/updateKcal", method = RequestMethod.POST)
	public String updateKcal(KcalVo kcalVo, RedirectAttributes rttr, MultipartFile file, String prevImg) throws Exception{
		String originalFilename = file.getOriginalFilename();
		System.out.println(prevImg);
		
		if (originalFilename != null && !originalFilename.equals("")) {
			String k_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
			kcalVo.setK_pic(k_pic);
		} else {
			if (prevImg != null && !prevImg.equals("")) {
				int kno = kcalVo.getKno();
				String k_pic = kcalService.getK_picByKno(kno);
				kcalVo.setK_pic(k_pic);
			} else if (prevImg == null || prevImg.equals("")) {
				kcalVo.setK_pic(null);
			}
		}
		
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
	
	
}

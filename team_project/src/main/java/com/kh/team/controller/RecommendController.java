package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.RecommendLikeService;
import com.kh.team.service.RecommendService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.RecommendLikeVo;
import com.kh.team.vo.RecommendVo;

@Controller
@RequestMapping("/recommend")
public class RecommendController {
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecommendLikeService recommendLikeService;
	
	// 추천 운동 게시판
		@RequestMapping(value = "/recommend", method = RequestMethod.GET)
		public String recommend() {
			System.out.println("recommend.jsp 실행됨");
			return "admin/recommend";
		}
		
		// 추천 운동 글쓰기 
		@RequestMapping(value = "/insertRecommend", method = RequestMethod.POST)
		public String insertRecommend(RecommendVo recommendVo) {
			System.out.println("AdminController, insertRecommend, recommendVo:" + recommendVo);
			String content = recommendVo.getRe_content();
			System.out.println("insertRecommend, content:" + content);
			
			recommendVo.setRe_content(content.replaceAll("\"", "\'"));
			if(content.indexOf("filename") != -1) {
				String re_pic = content.substring(content.indexOf("filename"));
				re_pic = re_pic.substring(9, re_pic.indexOf("\""));
				recommendVo.setRe_pic(re_pic);
			}
			recommendService.insertRecommend(recommendVo);
			return "redirect:/recommend/listRecommend";
		}
		
		// 추천 운동 글 목록
		@RequestMapping(value = "/listRecommend", method = RequestMethod.GET)
		public String listRecommend(RecommendVo recommendVo, Model model) {
			List<RecommendVo> listRecommend = recommendService.listRecommend();
			model.addAttribute("listRecommend", listRecommend);
			String content = recommendVo.getRe_content();
			System.out.println("listRecommend, content:" + content);
			return "admin/recommend";
		}
		
		// 추천 운동 글 등록 양식
		@RequestMapping(value = "/insertRecommendForm", method = RequestMethod.GET)
		public String insertRecommendForm() {
			return "admin/recommendInsert";
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
		
		// 추천 운동 글 수정 form 
		@RequestMapping(value = "/updateRecommendForm", method = RequestMethod.GET)
		public String updateRecommendForm(Model model, int reno) {
			RecommendVo recommendVo = recommendService.selectByReno(reno);
			model.addAttribute("recommendVo", recommendVo);
			return "admin/recommendUpdateForm";
		}
		
		// 추천 운동 글 수정
		@RequestMapping(value = "/updateRecommend", method = RequestMethod.POST)
		public String updateRecommend(RecommendVo recommendVo, RedirectAttributes rttr) {
			boolean result = recommendService.updateRecommend(recommendVo);
			rttr.addFlashAttribute("updateRecommend_result", result);
			return "redirect:/recommend/selectByReno?reno=" + recommendVo.getReno();
		}
		
		// 추천 운동 글 삭제
		@RequestMapping(value = "/deleteRecommend", method = RequestMethod.GET)
		public String deleteRecommend(int reno, RedirectAttributes rttr) {
			boolean result = recommendService.deleteRecommend(reno);
			rttr.addFlashAttribute("deleteRecommend_result", result);
			return "redirect:/recommend/listRecommend";
		}
		
		@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
		@ResponseBody
		public byte[] displayImage(String filename) throws Exception {
			FileInputStream fis;
			fis = new FileInputStream(filename);
			byte[] data = IOUtils.toByteArray(fis);
			fis.close();
			return data;
		}
		
		@RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST)
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

			String uploadPath = "//192.168.0.90/upic";
			String originalFilename = multipartFile.getOriginalFilename();

			String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
			System.out.println(file);
			return file;
		}
}

package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.RoutineCommentService;
import com.kh.team.service.RoutineService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;

@Controller
@RequestMapping("/routine")
public class RoutineController {
	
	@Autowired
	RoutineService routineService;
	
	@Autowired
	RoutineCommentService routineCommentService;
	
	@RequestMapping(value = "/routineList", method = RequestMethod.GET)
	public String routineList(Model model, PagingDto pagingDto) {
		pagingDto.setCount(routineService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<RoutineVo> routineList = routineService.routineList(pagingDto);
		model.addAttribute("routineList", routineList);
		model.addAttribute("pagingDto", pagingDto);
		return "board/routineList";
	}

	@RequestMapping(value = "/addRoutineForm", method = RequestMethod.GET)
	public String addRoutineForm() {
		return "board/addRoutine";
	}
	
	@RequestMapping(value = "/addRoutineRun", method = RequestMethod.POST)
	public String addRoutineRun(RoutineVo routineVo) {
		System.out.println("RecipeController, addRecipeRun, recipeVo: " + routineVo);
		String content = routineVo.getUr_content();
		routineVo.setUr_content(content.replace("\"", "\'"));
		if(content.indexOf("filename") != -1) {
			String ur_pic = content.substring(content.indexOf("filename"));
			ur_pic = ur_pic.substring(9, ur_pic.indexOf("\""));
			routineVo.setUr_pic(ur_pic);
		}
		routineService.addRoutine(routineVo);
		return "redirect:/routine/routineList";
	}

	@RequestMapping(value = "/routineContent", method = RequestMethod.GET)
	public String routineContent(Model model, int uno, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		RoutineVo routineVo = routineService.contentByUno(uno);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int like_cnt = routineService.isLike(uno, memberVo.getUserid());
		model.addAttribute("routineVo", routineVo);
		model.addAttribute("like_cnt", like_cnt);
		
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }
	    
	    if (oldCookie != null) {
	        if (!oldCookie.getValue().contains("[" + uno +"/" + memberVo.getUserid() + "]")) {
	        	routineService.updateViewcnt(uno, routineVo.getUr_viewcnt());
	            oldCookie.setValue(oldCookie.getValue() + "_[" + uno +"/" + memberVo.getUserid() + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 12);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	routineService.updateViewcnt(uno, routineVo.getUr_viewcnt());
	        Cookie newCookie = new Cookie("postView","[" + uno +"/" + memberVo.getUserid() + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
	    
		return "board/routineContent";
	}

	@RequestMapping(value = "/modifyRoutineForm", method = RequestMethod.GET)
	public String modifyRoutineForm(Model model, int uno) {
		RoutineVo routineVo = routineService.contentByUno(uno);
		model.addAttribute("routineVo", routineVo);
		return "board/modifyRoutineForm";
	}

	@RequestMapping(value = "/modifyRoutineRun", method = RequestMethod.POST)
	public String modifyRoutineRun(RoutineVo routineVo, RedirectAttributes rttr, PagingDto pagingDto) {
		System.out.println("RecipeController, recipeModifyRun, recipeVo: " + routineVo);
		String content = routineVo.getUr_content();
		routineVo.setUr_content(content.replaceAll("\"", "\'"));
		routineService.modifyRoutine(routineVo);
		rttr.addAttribute("uno", routineVo.getUno());
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		rttr.addAttribute("searchType", pagingDto.getSearchType());
		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/routine/routineContent";
	}
	
	@RequestMapping(value = "/removeRoutineRun", method = RequestMethod.GET)
	public String removeRoutine(int uno, RedirectAttributes rttr, PagingDto pagingDto) {
		routineService.removeRoutine(uno);
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		rttr.addAttribute("searchType", pagingDto.getSearchType());
		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/routine/routineList";
	}
	
	@RequestMapping(value = "/addRoutineComment", method = RequestMethod.POST)
	@ResponseBody
	public String addRoutineComment(RoutineCommentVo routineCommentVo) throws Exception {
		boolean result = routineCommentService.addRoutineComment(routineCommentVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/commentRoutineList/{uno}", method = RequestMethod.GET)
	@ResponseBody
	public List<RoutineCommentVo> commentRoutineList(@PathVariable("uno") int uno) {
		List<RoutineCommentVo> list = routineCommentService.selectRoutineCommentList(uno);
		return list;
	}

	@RequestMapping(value = "/modifyRoutineComment", method = RequestMethod.POST)
	@ResponseBody
	public String modifyComment(RoutineCommentVo routineCommentVo) {
		boolean result = routineCommentService.modifyRoutineComment(routineCommentVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/removeRoutineComment/{urcno}", method = RequestMethod.GET)
	@ResponseBody
	public String removeRoutineComment(@PathVariable("urcno") int urcno) {
		boolean result = routineCommentService.removeRoutineComment(urcno);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/updateLike", method = RequestMethod.POST)
	@ResponseBody
	public int updateLike(RoutineVo routineVo, @RequestParam("like_cnt") int like_cnt, Model model) {
		System.out.println(routineVo);
		int uno = routineVo.getUno();
		String userid = routineVo.getUserid();
		int ur_like = routineVo.getUr_like();
		
		if(like_cnt > 0) {
			routineService.decreaseLike(uno, ur_like, userid);
			like_cnt = 0;
		} else {
			routineService.increaseLike(uno, ur_like, userid);
			like_cnt = 1;
		}
		return like_cnt;
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

		String uploadPath = "//192.168.0.90/urpic";
		String originalFilename = multipartFile.getOriginalFilename();

		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
		return file;
	}

}

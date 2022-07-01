package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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

import com.kh.team.service.FreeCommentService;
import com.kh.team.service.FreeService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.FreeCommentVo;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Controller
@RequestMapping("/free")
public class FreeController {
	
	@Autowired
	FreeService freeService;
	
	@Autowired
	FreeCommentService freeCommentService;
	
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String FreeList(Model model, PagingDto pagingDto) {
		System.out.println("list: " + pagingDto);
		pagingDto.setCount(freeService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		List<FreeVo> freeList = freeService.freeList(pagingDto);
		model.addAttribute("freeList", freeList);
		return "board/freeList";
	}

	@RequestMapping(value = "/addFreeForm", method = RequestMethod.GET)
	public String addFreeForm(Model model) {
		List<FreeVo> categoryList = freeService.categoryList();
		model.addAttribute("categoryList", categoryList);
		return "board/addFree";
	}
	
	@RequestMapping(value = "/addFreeRun", method = RequestMethod.POST)
	public String addFreeRun(FreeVo freeVo) {
		System.out.println("FreeController, addFreeRun, freeVo: " + freeVo);
		String content = freeVo.getF_content();
		freeVo.setF_content(content.replace("\"", "\'"));
		if(content.indexOf("filename") != -1) {
			String f_pic = content.substring(content.indexOf("filename"));
			f_pic = f_pic.substring(9, f_pic.indexOf("\""));
			freeVo.setF_pic(f_pic);
		}
		freeService.addFree(freeVo);
		return "redirect:/free/freeList";
	}

	@RequestMapping(value = "/freeContent", method = RequestMethod.GET)
	public String freeContent(Model model, int fno, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		FreeVo freeVo = freeService.contentByFno(fno);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		int like_cnt = freeService.countLike(fno, memberVo.getNickname());
		model.addAttribute("like_cnt", like_cnt);
		model.addAttribute("freeVo", freeVo);
		
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
	        if (!oldCookie.getValue().contains("[" + fno +"/" + memberVo.getUserid() + "]")) {
	        	freeService.updateViewcnt(fno, freeVo.getF_viewcnt());
	            oldCookie.setValue(oldCookie.getValue() + "_[" + fno +"/" + memberVo.getUserid() + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 12);
	            response.addCookie(oldCookie);
	        }
	    } else {
	    	freeService.updateViewcnt(fno, freeVo.getF_viewcnt());
	        Cookie newCookie = new Cookie("postView","[" + fno +"/" + memberVo.getUserid() + "]");
	        newCookie.setPath("/");
	        newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    }
		return "board/freeContent";
	}

	@RequestMapping(value = "/modifyFreeForm", method = RequestMethod.GET)
	public String modifyFreeForm(Model model, int fno) {
		FreeVo freeVo = freeService.contentByFno(fno);
		List<FreeVo> categoryList = freeService.categoryList();
		model.addAttribute("freeVo", freeVo);
		model.addAttribute("categoryList", categoryList);
		return "board/modifyFreeForm";
	}

	@RequestMapping(value = "/modifyFreeRun", method = RequestMethod.POST)
	public String modifyFreeRun(FreeVo freeVo, RedirectAttributes rttr, PagingDto pagingDto) {
		System.out.println("FreeController, modifyFreeRun, FreeVo: " + freeVo);
		String content = freeVo.getF_content();
		freeVo.setF_content(content.replaceAll("\"", "\'"));
		freeService.modifyFree(freeVo);
		rttr.addAttribute("fno", freeVo.getFno());
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		rttr.addAttribute("searchType", pagingDto.getSearchType());
		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/free/freeContent";
	}
	
	@RequestMapping(value = "/updateLike", method = RequestMethod.POST)
	@ResponseBody
	public int updateLike(FreeVo freeVo, @RequestParam("like_cnt") int like_cnt, Model model) {
		System.out.println(freeVo);
		int fno = freeVo.getFno();
		String nickname = freeVo.getNickname();
		int f_like = freeVo.getF_like();
		
		if(like_cnt > 0) {
			freeService.decreaseLike(fno, f_like, nickname);
			like_cnt = 0;
		} else {
			freeService.increaseLike(fno, f_like, nickname);
			like_cnt = 1;
		}
		return like_cnt;
	}
	
	@RequestMapping(value = "/removeFreeRun", method = RequestMethod.GET)
	public String removeRoutine(int fno, RedirectAttributes rttr, PagingDto pagingDto) {
		freeService.removeFree(fno);
		rttr.addAttribute("page", pagingDto.getPage());
		rttr.addAttribute("perPage", pagingDto.getPerPage());
		rttr.addAttribute("searchType", pagingDto.getSearchType());
		rttr.addAttribute("keyword", pagingDto.getKeyword());
		return "redirect:/free/freeList";
	}
	
	@RequestMapping(value = "/addFreeComment", method = RequestMethod.POST)
	@ResponseBody
	public String addFreeComment(FreeCommentVo freeCommentVo) throws Exception {
		System.out.println(freeCommentVo);
		boolean result = freeCommentService.addFreeComment(freeCommentVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/commentFreeList/{fno}", method = RequestMethod.GET)
	@ResponseBody
	public List<FreeCommentVo> commentFreeList(@PathVariable("fno") int fno) {
		List<FreeCommentVo> list = freeCommentService.commentFreeList(fno);
		return list;
	}

	@RequestMapping(value = "/modifyFreeComment", method = RequestMethod.POST)
	@ResponseBody
	public String modifyFreeComment(FreeCommentVo freeCommentVo) {
		boolean result = freeCommentService.modifyFreeComment(freeCommentVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/removeFreeComment/{fcno}", method = RequestMethod.GET)
	@ResponseBody
	public String removeFreeComment(@PathVariable("fcno") int fcno) {
		boolean result = freeCommentService.removeFreeComment(fcno);
		return String.valueOf(result);
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

		String uploadPath = "//192.168.0.90/fpic";
		String originalFilename = multipartFile.getOriginalFilename();

		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
		return file;
	}

}

package com.kh.team.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}
	
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String userid, String userpw, String saveid, HttpSession session, RedirectAttributes rttr, HttpServletResponse response) {
		MemberVo memberVo = memberService.login(userid, userpw);
		System.out.println(saveid);
		if (memberVo != null) {
			session.setAttribute("loginVo", memberVo);
			if (saveid != null && !saveid.equals("")) {
				Cookie cookie = new Cookie("saveid", userid);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("saveid", userid);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			rttr.addFlashAttribute("loginResult", "true");
		} else {
			rttr.addFlashAttribute("loginResult", "false");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/joinForm";
	}
	
	@RequestMapping(value = "/joinRun", method = RequestMethod.POST)
	public String joinRun(MemberVo memberVo, MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		try {
			String u_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
			memberVo.setU_pic(u_pic);
			System.out.println(memberVo);
			memberService.joinMember(memberVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
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

package com.kh.team.controller;

import java.io.FileInputStream;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/member")
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
	public String joinRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr) {
		String originalFilename = file.getOriginalFilename();
		try {
			String u_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
			memberVo.setU_pic(u_pic);
			System.out.println(memberVo);
			boolean result = memberService.joinMember(memberVo);
			rttr.addFlashAttribute("joinResult", result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/member/loginForm";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage() {
		return "/member/myPage";
	}
	
	@RequestMapping(value = "/myPoint", method = RequestMethod.GET)
	public String myPoint() {
		return "/member/myPoint";
	}
	
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		FileInputStream fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm() {
		return "/member/modifyForm";
	}
	
	@RequestMapping(value = "/modifyRun", method = RequestMethod.POST)
	public String modifyRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr) {
		return "redirect:/member/myPage";
	}
	
	@RequestMapping(value = "/deleteForm", method = RequestMethod.GET)
	public String deleteForm() {
		return "/member/deleteForm";
	}
	
	@RequestMapping(value = "/deleteRun", method = RequestMethod.POST)
	public String deleteRun(String userid, HttpSession session, HttpServletResponse response) {
		System.out.println(userid);
		memberService.deleteMember(userid);
		session.invalidate();
		Cookie cookie = new Cookie("saveid", userid);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return "redirect:/";
	}
}

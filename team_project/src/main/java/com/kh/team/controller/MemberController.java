package com.kh.team.controller;

import java.io.FileInputStream;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
		if (memberVo != null) {
			session.setAttribute("loginVo", memberVo);
//			로그인했을때 아이디저장에 체크하였다면 아이디값을 쿠키에 저장
			if (saveid != null && !saveid.equals("")) {
				Cookie cookie = new Cookie("saveid", userid);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			} else {
//			아이디저장에 체크해제하고 로그인하였다면 쿠키 삭제
				Cookie cookie = new Cookie("saveid", userid);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			rttr.addFlashAttribute("loginResult", "true");
		} else {
			rttr.addFlashAttribute("loginResult", "false");
			return "redirect:/member/loginForm";
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
			if (originalFilename != null && !originalFilename.equals("")) {
				String u_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
				memberVo.setU_pic(u_pic);
			} else {
				memberVo.setU_pic(null);
			}
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
	@Transactional
	public String modifyRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr, HttpSession session, String prevImg) {
		String originalFilename = file.getOriginalFilename();
		System.out.println(prevImg);
//		수정폼에서 프로필사진을 등록하였다면 프로필사진 변경
		try {
			if (originalFilename != null && !originalFilename.equals("")) {
				String u_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
				memberVo.setU_pic(u_pic);
//			그렇지 않다면 프로필사진 삭제
			} else {
				if (prevImg != null && !prevImg.equals("")) {
					String userid = memberVo.getUserid();
					String u_pic = memberService.getU_picById(userid);
					memberVo.setU_pic(u_pic);
				} else if (prevImg == null || prevImg.equals("")) {
					memberVo.setU_pic(null);
				}
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		boolean result = memberService.updateMember(memberVo);
		rttr.addFlashAttribute("modifyResult", result);
		session.setAttribute("loginVo", memberVo);
		return "redirect:/member/myPage";
	}
	
	@RequestMapping(value = "/deleteForm", method = RequestMethod.GET)
	public String deleteForm() {
		return "/member/deleteForm";
	}
	
	@RequestMapping(value = "/deleteRun", method = RequestMethod.POST)
	public String deleteRun(String userid, HttpSession session, HttpServletResponse response) {
		memberService.deleteMember(userid);
		session.invalidate();
		Cookie cookie = new Cookie("saveid", userid);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String filename) {
		boolean result = FileUtil.deleteFile(filename);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/isExist", method = RequestMethod.GET)
	@ResponseBody
	public String isExist(String userid) {
		boolean result = memberService.isExist(userid);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/findIdPop", method = RequestMethod.GET)
	public String findIdPop() {
		return "/member/findId";
	}
	
	@RequestMapping(value = "/findIdResult", method = RequestMethod.GET)
	public String findIdResult() {
		return "/member/findIdResult";
	}
	
	@RequestMapping(value = "/findIdRun", method = RequestMethod.POST)
	public String findIdRun(String username, String email, RedirectAttributes rttr) {
		MemberVo memberVo = memberService.findId(username, email);
		if (memberVo != null && !memberVo.equals("")) {
			String userid = memberVo.getUserid();
			rttr.addFlashAttribute("userid", userid);
			return "redirect:/member/findIdResult";
		} else {
			System.out.println("false");
			rttr.addFlashAttribute("userid", "false");
			return "redirect:/member/findIdPop";
		}
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public String findId(String username, String email) {
		MemberVo memberVo = memberService.findId(username, email);
		boolean result = false;
		if (memberVo != null && !memberVo.equals("")) {
			result = true;
		}
		return String.valueOf(result);
	}
	
}

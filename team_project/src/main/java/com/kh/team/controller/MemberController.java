package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.EmailService;
import com.kh.team.service.MemberService;
import com.kh.team.service.MyContentService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.EmailVo;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private MyContentService myContentService;

	// 로그인 폼으로 이동
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}
	
	// 로그인 실행
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String userid, String userpw, String saveid, HttpSession session, RedirectAttributes rttr, HttpServletResponse response) {
		MemberVo memberVo = memberService.login(userid, userpw);
		String target = (String)session.getAttribute("targetLocation");
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
			if (target == "" || target == null) {
				return "redirect:/";
			} else {
				session.removeAttribute("targetLocation");
				return "redirect:/" + target;
			}
	}
	
	// 세션에 저장된 로그인 정보 삭제
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 가입폼으로 이동
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/joinForm";
	}
	
	// 가입 실행
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
	
	// 마이페이지로 이동
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(Model model) {
		return "/member/myPage";
	}
	
	// 내 활동 목록으로 이동
	@RequestMapping(value = "/myActivity", method = RequestMethod.GET)
	@Transactional
	public String myActivityLike(HttpSession session, Model model, String type) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		List<FreeVo> freeLike = new ArrayList<>();
		List<GroupBoardVo> groupBoardLike = new ArrayList<>();
		List<RecipeVo> recipeLike = new ArrayList<>();
		List<RoutineVo> routineLike = new ArrayList<>();
		List<RecommendVo> recommendLike = new ArrayList<>();
		System.out.println(type);
		if (type.equals("like")) {
			freeLike = myContentService.getFreeByLike(userid);
			groupBoardLike = myContentService.getGroupBoardByLike(userid);
			recipeLike = myContentService.getRecipeByLike(userid);
			routineLike = myContentService.getRoutineByLike(userid);
			recommendLike = myContentService.getRecommendByLike(userid);
			System.out.println("freeLike" + freeLike);
			System.out.println("groupBoardLike" + groupBoardLike);
			System.out.println("recipeLike" + recipeLike);
			System.out.println("routineLike" + routineLike);
			System.out.println("recommendLike" + recommendLike);
		} else if (type.equals("write")) {
			freeLike = myContentService.getWriteFree(userid);
			groupBoardLike = myContentService.getWriteGroupBoard(userid);
			recipeLike = myContentService.getWriteRecipe(userid);
			routineLike = myContentService.getWriteRoutine(userid);
			recommendLike = myContentService.getWriteRecommend(userid);
			System.out.println("freeLike" + freeLike);
			System.out.println("groupBoardLike" + groupBoardLike);
			System.out.println("recipeLike" + recipeLike);
			System.out.println("routineLike" + routineLike);
			System.out.println("recommendLike" + recommendLike);
		} else if (type.equals("comment")) {
			
		}
		model.addAttribute("freeLike", freeLike);
		model.addAttribute("groupBoardLike", groupBoardLike);
		model.addAttribute("recipeLike", recipeLike);
		model.addAttribute("routineLike", routineLike);
		model.addAttribute("recommendLike", recommendLike);
		return "/member/myActivity";
	}
	
//	// 내가 쓴 글 목록으로 이동
//	@RequestMapping(value = "/myActivityWrite", method = RequestMethod.GET)
//	@Transactional
//	public String myActivityWrite(HttpSession session, Model model) {
//		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
//		String userid = loginVo.getUserid();
//		List<FreeVo> freeLike = myContentService.getWriteFree(userid);
//		List<GroupBoardVo> groupBoardLike = myContentService.getWriteGroupBoard(userid);
//		List<RecipeVo> recipeLike = myContentService.getWriteRecipe(userid);
//		List<RoutineVo> routineLike = myContentService.getWriteRoutine(userid);
//		List<RecommendVo> recommendLike = myContentService.getWriteRecommend(userid);
//		model.addAttribute("freeLike", freeLike);
//		model.addAttribute("groupBoardLike", groupBoardLike);
//		model.addAttribute("recipeLike", recipeLike);
//		model.addAttribute("routineLike", routineLike);
//		model.addAttribute("recommendLike", recommendLike);
//		return "/member/myActivityLike";
//	}
	
	// 프로필사진 출력
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		FileInputStream fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	// 마이페이지에서 수정폼으로
	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public String modifyForm() {
		return "/member/modifyForm";
	}
	
	// 수정 실행
	@RequestMapping(value = "/modifyRun", method = RequestMethod.POST)
	@Transactional
	public String modifyRun(MemberVo memberVo, MultipartFile file, RedirectAttributes rttr, HttpSession session, String prevImg) throws Exception {
		String originalFilename = file.getOriginalFilename();
		System.out.println(prevImg);
//		수정폼에서 프로필사진을 등록하였다면 프로필사진 변경
		if (originalFilename != null && !originalFilename.equals("")) {
			String u_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
			memberVo.setU_pic(u_pic);
//		그렇지 않다면 프로필사진 삭제
		} else {
			if (prevImg != null && !prevImg.equals("")) {
				String userid = memberVo.getUserid();
				String u_pic = memberService.getU_picById(userid);
				memberVo.setU_pic(u_pic);
			} else if (prevImg == null || prevImg.equals("")) {
				memberVo.setU_pic(null);
			}
		}
		boolean result = memberService.updateMember(memberVo);
		rttr.addFlashAttribute("modifyResult", result);
		session.setAttribute("loginVo", memberVo);
		return "redirect:/member/myPage";
	}
	
	// 회원탈퇴 폼으로 이동
	@RequestMapping(value = "/deleteForm", method = RequestMethod.GET)
	public String deleteForm() {
		return "/member/deleteForm";
	}
	
	// 회원탈퇴실행
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
	
	// 프로필사진 삭제
	@RequestMapping(value = "/deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String filename) {
		boolean result = FileUtil.deleteFile(filename);
		return String.valueOf(result);
	}
	
	// 아이디 중복 확인
	@RequestMapping(value = "/isExist", method = RequestMethod.GET)
	@ResponseBody
	public String isExist(String userid) {
		boolean result = memberService.isExist(userid);
		return String.valueOf(result);
	}
	
	// 아이디 찾기 팝업 실행
	@RequestMapping(value = "/findIdPop", method = RequestMethod.GET)
	public String findIdPop() {
		return "/member/findId";
	}
	
	// 비밀번호 찾기 팝업 실행
	@RequestMapping(value = "/findPwPop", method = RequestMethod.GET)
	public String findPwPop() {
		return "/member/findPw";
	}
	
	// 아이디를 찾을때 이메일 전송
	@RequestMapping(value = "/sendEmailByFindId", method = RequestMethod.POST)
	@ResponseBody
	public String sendEmailByFindId(String username, String email) {
		MemberVo memberVo = memberService.findId(username, email);
		if (memberVo != null && !memberVo.equals("")) {
			// id찾기 이메일 보내기
			String randNum = "";
			for (int i = 1; i <= 6; i++) {
				randNum += String.valueOf(((int)(Math.random() * 9 + 1)));
			}
			System.out.println(randNum);
			EmailVo emailVo = new EmailVo();
			emailVo.setSubject("??에서 보낸 인증번호입니다.");
			emailVo.setMessage("인증번호는 " + randNum +  " 입니다.");
			emailVo.setReceiveMail(email);
			emailService.sendMailById(emailVo);
			return randNum;
		} else {
			return "false";
		}
	}
	
	// 비밀번호를 찾을 때 이메일 전송
	@RequestMapping(value = "/sendEmailByFindPw", method = RequestMethod.POST)
	@ResponseBody
	public String sendEmailByFindPw(String userid, String email) {
		System.out.println(userid);
		System.out.println(email);
		MemberVo memberVo = memberService.findPw(userid, email);
		System.out.println(memberVo);
		if (memberVo != null && !memberVo.equals("")) {
			// pw 찾기 이메일 보내기
			String randNum = "";
			for (int i = 1; i <= 6; i++) {
				randNum += String.valueOf(((int)(Math.random() * 9 + 1)));
			}
			System.out.println(randNum);
			EmailVo emailVo = new EmailVo();
			emailVo.setSubject("??에서 보낸 인증번호입니다.");
			emailVo.setMessage("인증번호는 " + randNum +  " 입니다.");
			emailVo.setReceiveMail(email);
			emailService.sendMailById(emailVo);
			return randNum;
		} else {
			return "false";
		}
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/findIdRun", method = RequestMethod.POST)
	public String findIdRun(String username, String email, RedirectAttributes rttr, Model model) {
		MemberVo memberVo = memberService.findId(username, email);
//		rttr.addFlashAttribute("userid", memberVo.getUserid());
		model.addAttribute("userid", memberVo.getUserid());
		return "/member/findIdResult";
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public String updatePw(String userid, String email, Model model, RedirectAttributes rttr) {
		MemberVo memberVo = memberService.findPw(userid, email);
		if (memberVo != null && !memberVo.equals("")) {
			model.addAttribute("userid", userid);
		} else {
			rttr.addFlashAttribute("userid", "false");
			return "redirect:/member/updatePwPop";
		}
		return "/member/updatePwForm";
	}
	
	// 비밀번호 변경 실행
	@RequestMapping(value = "/updatePwRun", method = RequestMethod.POST)
	@ResponseBody
	public String updatePwRun(String userpw, String userid) {
		boolean result = memberService.updatePw(userid, userpw);
		return String.valueOf(result);
	}
	
}

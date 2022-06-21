package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.GroupService;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private GroupService groupService;
	
	// 채팅방
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat (HttpSession session, Model model) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		System.out.println("Chat, login 정보:" + loginVo);
		String nickname = loginVo.getNickname();
		System.out.println("Chat, 로그인 한 사람 닉네임:" + nickname);
		String userid = loginVo.getUserid();
		
		// 그룹정보
		GroupVo groupVo = (GroupVo)session.getAttribute("groupVo");
		// 그룹 가입한 회원
		List<GroupJoinVo> groupJoinMember = groupService.list(groupVo.getGno());
		
		System.out.println("groupJoinMember:" +  groupJoinMember);
		
		System.out.println("Chat, groupVo:" + groupVo);
		model.addAttribute("gno", groupVo.getGno());
		model.addAttribute("g_name", groupVo.getG_name());
		model.addAttribute("nickname", nickname);
		model.addAttribute("loginVo", loginVo);
		model.addAttribute("groupJoinMember", groupJoinMember);
		return "/chat/chat2";
	}
	
	// 채팅방 입장
//	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
//	public String viewChat(HttpSession session, Model model) throws Exception{
//		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
//		System.out.println("Chat, login 정보:" + loginVo);
//		String nickname = loginVo.getNickname();
//		model.addAttribute("nickname", nickname);
//		return "chat/chat2";
//	}
}

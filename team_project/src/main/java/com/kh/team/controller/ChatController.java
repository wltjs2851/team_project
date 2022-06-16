package com.kh.team.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	// 채팅방
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat (HttpSession session, Model model) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		System.out.println("Chat, login 정보:" + loginVo);
		String nickname = loginVo.getNickname();
		System.out.println("Chat, 로그인 한 사람 닉네임:" + nickname);
		
		model.addAttribute("nickname", nickname);
		return "/chat/chat2";
	}
}

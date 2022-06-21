package com.kh.team.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.GroupService;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	private static Map<String, Set<String>> map = new HashMap<String, Set<String>>();
	
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
		
		// 그룹 가입한 회원 닉네임 얻어오기
		List<String> g_nickname = groupService.getNickname(groupVo.getGno());
		System.out.println("chatController, 그룹 가입한 사람 닉네임:" + g_nickname);
		
		System.out.println("Chat, groupVo:" + groupVo);
		model.addAttribute("gno", groupVo.getGno());
		model.addAttribute("g_name", groupVo.getG_name());
		model.addAttribute("nickname", nickname);
		model.addAttribute("loginVo", loginVo);
		model.addAttribute("groupJoinMember", groupJoinMember);
		model.addAttribute("g_nickname", g_nickname);
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
	@RequestMapping(value = "/getChatters/{gno}/{io}", method = RequestMethod.GET)
	@ResponseBody
	public Set<String> getChatters(HttpSession session, @PathVariable("gno") int gno, @PathVariable("io") String io) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String nickname = loginVo.getNickname();
		Set<String> set = map.get(String.valueOf(gno));
		if (set == null) {
			set = new HashSet<String>();
		}
		if (io.equals("i")) {
			// 채팅방 입장하면
			set.add(nickname);
		} else if (io.equals("o")) {
			// 채팅방 퇴장하면
			set.remove(nickname);
		}
		map.put(String.valueOf(gno), set);
//		List<String> chatterList = new ArrayList<>(set);
//		Collections.sort(chatterList);
		return set;
	}
}

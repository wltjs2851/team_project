package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.GroupService;
import com.kh.team.service.MemberService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService groupService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/groupList", method = RequestMethod.GET)
	public String getGroupList(Model model) {
		List<GroupVo> list = groupService.groupList();
		model.addAttribute("groupList", list);
		return "board/groupList";
	}

	@RequestMapping(value = "/addGroupForm", method = RequestMethod.GET)
	public String addGroupForm() {
		return "board/addGroup";
	}

	@RequestMapping(value = "/addGroupRun", method = RequestMethod.POST)
	public String addGroupRun(GroupVo groupVo, MultipartFile file, HttpSession session) {
		System.out.println("GroupController, addGroupRun, groupVo: " + groupVo);
		System.out.println("GroupController, addGroupRun, file: " + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename: " + originalFilename);
		
		String g_pic;
		if (originalFilename != null && !originalFilename.equals("")) {
			try {
				g_pic = FileUtil.uploadFile("C:/gpic", originalFilename, file.getBytes());
				groupVo.setG_pic(g_pic);
				groupService.addGroup(groupVo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			groupVo.setG_pic(null);
			groupService.addGroup(groupVo);
		}
		session.removeAttribute("loginVo");
		MemberVo memberVo = memberService.memberByUserid(groupVo.getG_leader());
		session.setAttribute("loginVo", memberVo);
		return "redirect:/group/groupList";
	}

	@RequestMapping(value = "/groupForm", method = RequestMethod.GET)
	public String readGroupForm(int gno, Model model) {
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		return "board/groupForm";
	}

	@RequestMapping(value = "/modifyGroupRun", method = RequestMethod.POST)
	public String modifyGroupRun(GroupVo groupVo, MultipartFile file) {
		System.out.println("GroupController, addGroupRun, groupVo: " + groupVo);
		System.out.println("GroupController, addGroupRun, file: " + file);
		String originalFilename = file.getOriginalFilename();
		long size = file.getSize();
		System.out.println("name: " + originalFilename + " size: " + size);
		if (originalFilename != null && !originalFilename.equals("")) {
			try {
				String g_pic = FileUtil.uploadFile("//192.168.0.90/gpic", originalFilename, file.getBytes());
				groupVo.setG_pic(g_pic);
				groupService.moidfyGroup(groupVo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			GroupVo groupVo2 = groupService.groupByGno(groupVo.getGno());
			String g_pic = groupVo2.getG_pic();
			groupVo.setG_pic(g_pic);
			groupService.moidfyGroup(groupVo);
		}

		return "redirect:/group/groupForm?gno=" + groupVo.getGno();
	}
	
	@RequestMapping(value = "/removeGroup", method = RequestMethod.GET)
	public String readGroupForm(int gno) {
		groupService.removeGroup(gno);
		//user table gno값도 삭제
		return "board/groupList";
	}

	@RequestMapping(value = "/joinGroup", method = RequestMethod.POST)
	public String joinGroup(GroupVo groupVo, HttpSession session, RedirectAttributes rttr) {
		MemberVo memberVo = (MemberVo) session.getAttribute("loginVo");
		String userid = memberVo.getUserid();
		System.out.println("userid: " + userid);
		System.out.println("groupVo: " + groupVo);
		boolean result = groupService.joinGroup(groupVo.getGno(), userid);
		rttr.addFlashAttribute("joinResult", result);
		return "redirect:/group/groupList";
	}

	@RequestMapping(value = "/deleteMember/{userid}/{gno}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteMember( 
			@PathVariable("userid") String userid, 
			@PathVariable("gno") int gno) {
//		System.out.println("deleteMember, gno: " + gno);
		System.out.println("deleteMember, gno: " + gno);
		
		boolean result = groupService.banGroup(gno, userid);
//		rttr.addFlashAttribute("delete_member", result);
		
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
	
	@RequestMapping(value = "groupInfo", method = RequestMethod.GET)
	public String groupInfo(Model model, int gno, HttpSession session) {
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		
		List<GroupJoinVo> groupJoinMember = groupService.list(gno);
		model.addAttribute("groupJoinMember", groupJoinMember);
		
		session.setAttribute("g_joinVo", groupJoinMember);
		
		return "groupboard/groupInfo";
	}
	
	@RequestMapping(value = "myGroupList", method = RequestMethod.GET)
	public String myGroupList(/*int gno, */GroupVo groupVo, Model model, String userid, HttpServletRequest httpRequest, HttpSession session) { // 유저 아이디를 기준으로 가입한 그룹들 가져오는,,,
		userid = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getUserid();
		
		List<GroupJoinVo> group = groupService.list(userid);
		model.addAttribute("group", group);
		
//		groupVo = groupService.groupByGno(gno);
//		model.addAttribute("groupVo", groupVo);
		
//		session.setAttribute("g_joinVo", group);
		
		return "groupboard/myGroupList";
	}
}

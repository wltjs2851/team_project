package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.GroupService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService groupService;

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
	public String addGroupRun(GroupVo groupVo, MultipartFile file) {
//		System.out.println("GroupController, addGroupRun, groupVo: " + groupVo);
		System.out.println("GroupController, addGroupRun, file: " + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename: " + originalFilename);
		String g_pic;
		if (originalFilename != null && !originalFilename.equals("")) {
			try {
				g_pic = FileUtil.uploadFile("//192.168.0.90/gpic", originalFilename, file.getBytes());
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
		boolean result = groupService.joinGroup(groupVo, userid);
		rttr.addFlashAttribute("joinResult", result);
		return "redirect:/group/groupList";
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
}

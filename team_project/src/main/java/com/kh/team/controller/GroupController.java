package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.kh.team.service.GroupService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.GroupVo;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getGroupList(Model model) {
		List<GroupVo> list = groupService.groupList();
		model.addAttribute("groupList", list);
		return "board/list";
	}
	
	@RequestMapping(value = "/addGroupForm", method = RequestMethod.GET)
	public String addGroupForm() {
		return "board/addGroup";
	}
	
	@RequestMapping(value = "/addGroupRun", method = RequestMethod.POST)
	public String addGroupRun(GroupVo groupVo, MultipartFile file) {
//		System.out.println("GroupController, addGroupRun, groupVo: " + groupVo);
//		System.out.println("GroupController, addGroupRun, file: " + file);
		String origianlFilename = file.getOriginalFilename();
		long size = file.getSize();
		System.out.println("name: " + origianlFilename + " size: " + size);
		try {
			String g_pic = FileUtil.uploadFile("C:/gpic", origianlFilename, file.getBytes());
			groupVo.setG_pic(g_pic);
			System.out.println("GroupController, addGroupRun, groupVo: " + groupVo);
			groupService.addGroup(groupVo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/group/list";
	}
	
	@RequestMapping(value = "/groupForm", method = RequestMethod.GET)
	public String readGroupForm(int gno, Model model) {
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		return "board/groupForm";
	}
	
	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception{
		FileInputStream fis;
		fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
}

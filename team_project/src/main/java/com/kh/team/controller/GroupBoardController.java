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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.GroupBoardLikeService;
import com.kh.team.service.GroupBoardService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.GroupBoardLikeVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.MemberVo;

@Controller
@RequestMapping("/groupboard")
public class GroupBoardController {
	
	@Autowired
	private GroupBoardService groupBoardService;
	
	@Autowired
	private GroupBoardLikeService groupboardLikeService;
	
	@RequestMapping(value = "groupWriteForm", method = RequestMethod.GET)
	public String createForm() { // 글쓰기 양식
		
		return "groupboard/groupWriteForm";
	}
	
	@RequestMapping(value = "groupWriteRun", method = RequestMethod.POST)
	public String createRun(GroupBoardVo groupBoardVo, RedirectAttributes rttr, MultipartFile file){
		System.out.println("groupBoardController, groupWriteRun, file:" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename: " + originalFilename);
		
		if(originalFilename == null || originalFilename == "") {
			System.out.println("groupBoardController, writeRun, groupBoardVo: " + groupBoardVo);
			boolean result = groupBoardService.create(groupBoardVo);
			rttr.addFlashAttribute("create_result", result);
		} else {
			long size = file.getSize();
			System.out.println("size: " + size);
			try {
			String gb_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
			groupBoardVo.setGb_pic(gb_pic);
			
			System.out.println("groupBoardController, writeRun, groupBoardVo: " + groupBoardVo);
			boolean result = groupBoardService.create(groupBoardVo);
			
			System.out.println("groupBoardController, writeRun, result: " + result);
			rttr.addFlashAttribute("create_result", result);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/groupboard/groupMain";
	}
	
	@RequestMapping(value = "groupRead", method = RequestMethod.GET)
	public String read(int gbno, Model model, HttpServletRequest httpRequest) throws Exception {
		GroupBoardVo groupBoardVo = groupBoardService.read(gbno);
		model.addAttribute("groupBoardVo", groupBoardVo);
		
		// 댓글 갯수
		boolean result = groupBoardService.updateComment(gbno);
		System.out.println("groupRead, result: " + result);
		int count = groupBoardService.countComment(gbno);
		System.out.println("count: " + count);
		model.addAttribute("count", count);

		// 로그인 한 경우에만 접근 가능
		String userid = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getUserid();
		
		// 좋아요
		GroupBoardLikeVo groupBoardLikeVo = new GroupBoardLikeVo();
		groupBoardLikeVo.setGbno(gbno);
		groupBoardLikeVo.setUserid(userid);
		
		int groupBoardLike = groupboardLikeService.countLike(groupBoardLikeVo);
		System.out.println("groupBoardLike: " + groupBoardLike);
		
		model.addAttribute("heart", groupBoardLike);
		
		return "groupboard/groupRead";
	}
	
	@ResponseBody
	@RequestMapping(value = "heart", method = RequestMethod.POST)
	public int heart(HttpServletRequest httpRequest) {
		int heart = Integer.parseInt(httpRequest.getParameter("heart"));
		int gbno = Integer.parseInt(httpRequest.getParameter("gbno"));
		String userid = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getUserid();
		
		GroupBoardLikeVo groupBoardLikeVo = new GroupBoardLikeVo();
		groupBoardLikeVo.setGbno(gbno);
		groupBoardLikeVo.setUserid(userid);
		
		if(heart >= 1) {
			groupboardLikeService.deleteLike(groupBoardLikeVo);
			heart = 0;
		} else {
			groupboardLikeService.addLike(groupBoardLikeVo);
			heart = 1;
		}
		
		return heart;
	}
	
	@RequestMapping(value = "groupUpdateForm", method = RequestMethod.GET)
	public String updateForm(int gbno, Model model) {
		GroupBoardVo data = groupBoardService.read(gbno);
		model.addAttribute("data", data);
		
		return "groupboard/groupUpdateForm";
	}
	
	@RequestMapping(value = "groupUpdateRun", method = RequestMethod.POST)
	public String updateRun(GroupBoardVo groupBoardVo, RedirectAttributes rttr, MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		
		if(originalFilename == null || originalFilename == "") {
			System.out.println("groupBoardController, updateRun, groupBoardVo: " + groupBoardVo);
			boolean result = groupBoardService.update(groupBoardVo);
			
			rttr.addAttribute("gbno", groupBoardVo.getGbno());
			System.out.println("groupBoardController, updateRun, result: " + result);
			rttr.addFlashAttribute("update_result", result);
		} else {
			long size = file.getSize();
			try {
				String gb_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
				groupBoardVo.setGb_pic(gb_pic);
				
				System.out.println("groupBoardController, updateRun, groupBoardVo: " + groupBoardVo);
				boolean result = groupBoardService.update(groupBoardVo);
				
				rttr.addAttribute("gbno", groupBoardVo.getGbno());
				System.out.println("groupBoardController, updateRun, result: " + result);
				rttr.addFlashAttribute("update_result", result);
				} catch(Exception e) {
					e.printStackTrace();
				}
		}
		
		return "redirect:/groupboard/groupRead";
	}

	@RequestMapping(value = "groupDelete", method = RequestMethod.GET)
	public String delete(int gbno, RedirectAttributes rttr) {
		boolean result = groupBoardService.delete(gbno);
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/groupboard/groupMain";
	}
	
	@RequestMapping(value = "groupMain", method = RequestMethod.GET)
	public String main(Model model, String gb_notice) {
		List<GroupBoardVo> groupList = groupBoardService.list();
		model.addAttribute("groupList", groupList);
		
		List<GroupBoardVo> noticeList = groupBoardService.notice(gb_notice);
		model.addAttribute("noticeList", noticeList);
		
		return "groupboard/groupMain";
	}
	
	@RequestMapping(value = "displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		FileInputStream fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value = "groupInfo", method = RequestMethod.GET)
	public String groupInfo() {
		
		return "groupboard/groupInfo";
	}
	
	@RequestMapping(value = "like", method = RequestMethod.POST)
	public String like() {
		
		return "groupboard/like";
	}
	
	@RequestMapping(value = "updateGroupInfoForm", method = RequestMethod.GET)
	public String updateGroupInfoForm() {
		
		return "groupboard/updateGroupInfoForm";
	}
	
	@RequestMapping(value = "updateGroupInfoRun", method = RequestMethod.POST)
	public String updateGroupInfoRun() {
		
		return "redirect:/groupboard/groupInfo";
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(String gb_notice, Model model) {
		List<GroupBoardVo> noticeList = groupBoardService.notice(gb_notice);
//		GroupBoardVo groupBoardVo = groupBoardService.read(gbno);
		
		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("groupBoardVo", groupBoardVo);
		
		return "groupboard/notice";
	}
}

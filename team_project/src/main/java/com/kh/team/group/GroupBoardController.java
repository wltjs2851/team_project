package com.kh.team.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/group")
public class GroupBoardController {
	
	@Autowired
	private GroupBoardService groupService;
	
	@RequestMapping(value = "group_writeForm", method = RequestMethod.GET)
	public String createForm() { // 글쓰기 양식
		
		return "group/group_writeForm";
	}
	
	@RequestMapping(value = "group_writeRun", method = RequestMethod.POST)
	public String createRun(GroupBoardVo groupVo, RedirectAttributes rttr) {
		boolean result = groupService.create(groupVo);
		rttr.addFlashAttribute("create_result", result);
		
		return "redirect:/group/group_main";
	}
	
	@RequestMapping(value = "group_read", method = RequestMethod.GET)
	public String read(int gbno, Model model) {
		GroupBoardVo groupVo = groupService.read(gbno);
		model.addAttribute("groupVo", groupVo);
		
		return "group/group_read";
	}
	
	@RequestMapping(value = "group_updateForm", method = RequestMethod.GET)
	public String updateForm() {
		
		return "group/group_updateForm";
	}
	
	@RequestMapping(value = "group_updateRun", method = RequestMethod.POST)
	public String updateRun(GroupBoardVo groupVo, RedirectAttributes rttr) {
		boolean result = groupService.update(groupVo);
		rttr.addFlashAttribute("update_result", result);
		
		return "redirect:/group/group_read";
	}

	@RequestMapping(value = "group_delete", method = RequestMethod.POST)
	public String delete(int gbno, RedirectAttributes rttr) {
		boolean result = groupService.delete(gbno);
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/group/group_main";
	}
	
	public String main(Model model) {
		List<GroupBoardVo> groupList = groupService.list();
		model.addAttribute("groupList", groupList);
		
		return "group/group_main";
	}
}

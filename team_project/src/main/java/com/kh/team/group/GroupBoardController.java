package com.kh.team.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.vo.GroupBoardVo;

@Controller
@RequestMapping("/group")
public class GroupBoardController {
	
	@Autowired
	private GroupBoardService groupBoardService;
	
	@RequestMapping(value = "groupWriteForm", method = RequestMethod.GET)
	public String createForm() { // 글쓰기 양식
		
		return "group/groupWriteForm";
	}
	
	@RequestMapping(value = "groupWriteRun", method = RequestMethod.POST)
	public String createRun(GroupBoardVo groupVo, RedirectAttributes rttr) {
		System.out.println("groupBoardController, writeRun");
		boolean result = groupBoardService.create(groupVo);
		rttr.addFlashAttribute("create_result", result);
		
		return "redirect:/group/groupMain";
	}
	
	@RequestMapping(value = "groupRead", method = RequestMethod.GET)
	public String read(int gbno, Model model) {
		GroupBoardVo groupBoardVo = groupBoardService.read(gbno);
		model.addAttribute("groupBoardVo", groupBoardVo);
		
		return "group/groupRead";
	}
	
	@RequestMapping(value = "groupUpdateForm", method = RequestMethod.GET)
	public String updateForm() {
		
		return "group/groupUpdateForm";
	}
	
	@RequestMapping(value = "group_updateRun", method = RequestMethod.POST)
	public String updateRun(GroupBoardVo groupBoardVo, RedirectAttributes rttr) {
		boolean result = groupBoardService.update(groupBoardVo);
		rttr.addFlashAttribute("update_result", result);
		
		return "redirect:/group/group_updateRun";
	}

	@RequestMapping(value = "groupDelete", method = RequestMethod.POST)
	public String delete(int gbno, RedirectAttributes rttr) {
		boolean result = groupBoardService.delete(gbno);
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/group/groupDelete";
	}
	
	@RequestMapping(value = "groupMain", method = RequestMethod.GET)
	public String main(Model model) {
		List<GroupBoardVo> groupList = groupBoardService.list();
		model.addAttribute("groupList", groupList);
		
		return "group/groupMain";
	}
}

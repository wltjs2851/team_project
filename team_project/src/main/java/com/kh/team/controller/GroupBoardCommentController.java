package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.service.GroupBoardCommentService;
import com.kh.team.service.GroupBoardService;
import com.kh.team.vo.GroupBoardCommentVo;
import com.kh.team.vo.MemberVo;

@RestController
@RequestMapping("/groupcomment")
public class GroupBoardCommentController {
	
	@Autowired
	private GroupBoardCommentService groupBoardCommentService;
	
	@Autowired
	private GroupBoardService groupBoardService;
	
	@RequestMapping(value = "/insertGroupComment", method = RequestMethod.POST)
	public String insertGroupComment(GroupBoardCommentVo groupBoardCommentVo, int gbno, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		
		boolean result = groupBoardCommentService.insertGroupComment(groupBoardCommentVo);
		groupBoardCommentService.updateComment(gbno);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/groupCommentList/{gbno}", method = RequestMethod.GET)
	public List<GroupBoardCommentVo> groupCommentList(@PathVariable("gbno") int gbno) {
		List<GroupBoardCommentVo> groupCommentList = groupBoardCommentService.groupCommentList(gbno);
		System.out.println("groupCommentList: " + groupCommentList);
		return groupCommentList;
	}
	
	@RequestMapping(value = "/updateGroupComment", method = RequestMethod.POST)
	public String updateGroupComment(GroupBoardCommentVo groupBoardCommentVo) {
		boolean result = groupBoardCommentService.updateGroupComment(groupBoardCommentVo);
		String gbc_content = groupBoardCommentVo.getGbc_content();
		System.out.println("updateGroupComment: " + groupBoardCommentVo);
		System.out.println("gbc_content: " + gbc_content);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/deleteGroupComment/{gbcno}", method = RequestMethod.GET)
	public String deleteGroupComment(@PathVariable("gbcno") int gbcno, int gbno) {
		boolean result = groupBoardCommentService.deleteGroupComment(gbcno);
		groupBoardCommentService.updateCommentDelete(gbno);
		return String.valueOf(result);
	}

}

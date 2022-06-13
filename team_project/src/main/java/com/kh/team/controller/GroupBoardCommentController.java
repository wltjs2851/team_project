package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.team.service.GroupBoardCommentService;
import com.kh.team.service.GroupBoardService;
import com.kh.team.vo.GroupBoardCommentVo;

@RestController
@RequestMapping("/groupcomment")
public class GroupBoardCommentController {
	
	@Autowired
	private GroupBoardCommentService groupBoardCommentService;
	
	@Autowired
	private GroupBoardService groupBoardService;
	
	@RequestMapping(value = "/insertGroupComment", method = RequestMethod.POST)
	public String insertGroupComment(GroupBoardCommentVo groupBoardCommentVo) {
		boolean result = groupBoardCommentService.insertGroupComment(groupBoardCommentVo);
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
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/deleteGroupComment/{gbcno}", method = RequestMethod.GET)
	public String deleteGroupComment(@PathVariable("gbcno") int gbcno) {
		boolean result = groupBoardCommentService.deleteGroupComment(gbcno);
		return String.valueOf(result);
	}

}

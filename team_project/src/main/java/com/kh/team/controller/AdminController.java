package com.kh.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.AdminService;
import com.kh.team.service.FreeCommentService;
import com.kh.team.service.FreeService;
import com.kh.team.service.GroupBoardCommentService;
import com.kh.team.service.GroupBoardService;
import com.kh.team.service.MemberService;
import com.kh.team.service.RecipeCommentService;
import com.kh.team.service.RecipeService;
import com.kh.team.service.RecommendCommentService;
import com.kh.team.service.RoutineCommentService;
import com.kh.team.service.RoutineService;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.FreeCommentVo;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardCommentVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendCommentVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberSerive;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private FreeService freeService;
	@Autowired
	private FreeCommentService freeCommentService;
	
	@Autowired
	private RecipeService recipeService;
	@Autowired
	private RecipeCommentService recipeCommentService;
	
	@Autowired
	private GroupBoardService groupBoardService;
	@Autowired
	private GroupBoardCommentService groupBoardCommentService;
	
	@Autowired
	private RoutineService routineService;
	@Autowired
	private RoutineCommentService routineCommentService;
	
	@Autowired
	private RecommendCommentService recommendCommentService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String adminMain(Model model) {
		
		List<MemberVo> lastestMember = memberSerive.getLatestMember();
		System.out.println("최근 가입 회원 목록:" + lastestMember);
		model.addAttribute("lastestMember", lastestMember);
		return "/admin/admin";
	}
	
	// 전체 회원 목록
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String adminMember(Model model) {
		List<MemberVo> memberList = memberSerive.getMemberList();
		model.addAttribute("memberList", memberList);
		return "/admin/adminMember";
	}
	
	@RequestMapping(value="/selectMember", method = RequestMethod.GET)
	public String adminSelectMember(String userid, Model model) {
		System.out.println("userid:" + userid);
//		List<AdminVo> adminList = adminService.adminList(userid);
//		model.addAttribute("adminList", adminList);
		
		List<FreeVo> freeList = freeService.adminFreeList(userid);
		List<RecipeVo> recipeList = recipeService.adminRecipeList(userid);
		List<GroupBoardVo> groupBoardList = groupBoardService.adminGroupBoardList(userid);
		List<RoutineVo> routineList = routineService.adminRoutineList(userid);
		
		model.addAttribute("userid", userid);
		model.addAttribute("freeList", freeList);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("routineList", routineList);
		
		return "/admin/adminSelectMember";
	}
	
	// 회원이 작성한 댓글
	@RequestMapping(value="/comment", method = RequestMethod.GET)
	public String adminMemberComment(String userid, Model model) {
		
		System.out.println("AdminController, memberComment, userid:" + userid);
		
		List<FreeCommentVo> freeList = freeCommentService.adminFreeComment(userid);
		List<RecipeCommentVo> recipeList = recipeCommentService.adminRecipeComment(userid);
		List<GroupBoardCommentVo> groupBoardList = groupBoardCommentService.adminGroupBoardComment(userid);
		List<RoutineCommentVo> routineList = routineCommentService.adminRoutineComment(userid);
		List<RecommendCommentVo> recommendList = recommendCommentService.adminRecommendComment(userid);
		
		
		
		model.addAttribute("userid", userid);
		model.addAttribute("freeList", freeList);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("routineList", routineList);
		model.addAttribute("recommendList", recommendList);
		
		return "/admin/adminMemberComment";
	}
	
}

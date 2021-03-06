package com.kh.team.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.AdminService;
import com.kh.team.service.FreeCommentService;
import com.kh.team.service.FreeService;
import com.kh.team.service.GroupBoardCommentService;
import com.kh.team.service.GroupBoardService;
import com.kh.team.service.GroupService;
import com.kh.team.service.MemberService;
import com.kh.team.service.RecipeCommentService;
import com.kh.team.service.RecipeService;
import com.kh.team.service.RecommendCommentService;
import com.kh.team.service.ReportBoardService;
import com.kh.team.service.RoutineCommentService;
import com.kh.team.service.RoutineService;
import com.kh.team.service.WarningMessageService;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.FreeCommentVo;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupBoardCommentVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendCommentVo;
import com.kh.team.vo.ReportBoardVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;
import com.kh.team.vo.WarningMessageVo;
import com.kh.team.vo.testVo;

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
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ReportBoardService reportBoardService;
	
	@Autowired
	private WarningMessageService warningMessageService;
	
	// ????????? ?????? ?????? ????????????
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String adminMain(HttpSession session, Model model, RedirectAttributes rttr) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		if(memberVo == null) {
			System.out.println("if");
			rttr.addFlashAttribute("ifAdmin", "notLogin");
			return "/home";
		}
		String userid = memberVo.getUserid();
		System.out.println(memberVo);
		if (!userid.equals("admin01")) {
			rttr.addFlashAttribute("ifAdmin", "false");
			return "/home";
		}
		
		// ?????? ????????? ?????? ??????
		List<MemberVo> lastestMember = memberSerive.getLatestMember();
		System.out.println("?????? ?????? ?????? ??????:" + lastestMember);
		model.addAttribute("lastestMember", lastestMember);
		
		// ?????? ?????? ??????
		List<ReportBoardVo> lastestReport = reportBoardService.getLatestReport();
		model.addAttribute("lastestReport", lastestReport);
		return "/admin/admin";
	}
	
	// ?????? ?????? ??????
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String adminMember(Model model, PagingDto pagingDto) {
		System.out.println("AdminController, memberList, pagingDto:" + pagingDto);
		pagingDto.setCount(memberSerive.getCountMember(pagingDto));
		System.out.println(pagingDto.getCount());
		pagingDto.setPage(pagingDto.getPage());
		List<MemberVo> memberList = memberSerive.getMemberList(pagingDto);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/adminMember";
	}
	
	// ???????????? ??? ?????? ??????
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String adminSelectMember(String nickname, Model model, String userid) {
		System.out.println("adminSelectMember:" + nickname);
//		MemberVo memberVo = memberSerive.memberByUserid(userid);
		MemberVo memberVo = memberSerive.memberByNickname(nickname);
		model.addAttribute("memberVo", memberVo);
		
		List<AdminVo> adminList = adminService.adminList(nickname);
		model.addAttribute("adminList", adminList);
		
//		????????? ?????? ??????
		List<GroupVo> groupList = groupService.getGroupByUserId(userid);
		model.addAttribute("groupList", groupList);
		
		// ????????? ????????? ????????? ??????
//		List<GroupJoinVo> groupMemberList = groupService.list(userid);
//		model.addAttribute("groupMemberList", groupMemberList);
		List<testVo> groupInfo = adminService.getGroupInfo();
		System.out.println("groupInfo:" + groupInfo);
		model.addAttribute("groupInfo", groupInfo);
		
		
		
		return "/admin/adminMemberInfo";
	}
	
	// ????????? ????????? ??? 
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public String adminMemberBoard(String nickname, Model model) {
//		List<AdminVo> adminList = adminService.adminList(userid);
//		model.addAttribute("adminList", adminList);
		
		List<FreeVo> freeList = freeService.adminFreeList(nickname);
		List<RecipeVo> recipeList = recipeService.adminRecipeList(nickname);
		List<GroupBoardVo> groupBoardList = groupBoardService.adminGroupBoardList(nickname);
		List<RoutineVo> routineList = routineService.adminRoutineList(nickname);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("freeList", freeList);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("routineList", routineList);
		
		return "/admin/adminMemberBoard";
	}
	
	// ????????? ????????? ??????
	@RequestMapping(value="/comment", method = RequestMethod.GET)
	public String adminMemberComment(String nickname, Model model) {
		
		List<FreeCommentVo> freeList = freeCommentService.adminFreeComment(nickname);
		List<RecipeCommentVo> recipeList = recipeCommentService.adminRecipeComment(nickname);
		List<GroupBoardCommentVo> groupBoardList = groupBoardCommentService.adminGroupBoardComment(nickname);
		List<RoutineCommentVo> routineList = routineCommentService.adminRoutineComment(nickname);
		List<RecommendCommentVo> recommendList = recommendCommentService.adminRecommendComment(nickname);
		
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("freeList", freeList);
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("groupBoardList", groupBoardList);
		model.addAttribute("routineList", routineList);
		model.addAttribute("recommendList", recommendList);
		
		return "/admin/adminMemberComment";
	}
	
	// ????????? ?????? ????????? 
	@RequestMapping(value="/reportBoard", method = RequestMethod.GET)
	public String adminReportList(Model model) {
		List<ReportBoardVo> reportBoardVo = reportBoardService.getReportBoardList();
		System.out.println("reportBoardVo:" + reportBoardVo);
		model.addAttribute("reportBoardVo", reportBoardVo);
		return "/admin/adminReportList";
	}
	
	// ?????? ?????? ?????? ??????
	@RequestMapping(value="/reportUpdateForm", method = RequestMethod.GET)
	public String adminReportForm(int rbno, Model model) {
		ReportBoardVo reportBoardVo = reportBoardService.getReportByRbno(rbno);
		model.addAttribute("reportBoardVo", reportBoardVo);
		return "/admin/adminReportUpdateForm";
	}
	
	// ???????????? ?????? ?????? ??????
	@RequestMapping(value="/userOutRun/{nickname}", method = RequestMethod.GET)
	@ResponseBody
	public String adminUserOutRun(@PathVariable("nickname") String nickname, int rbno) {
		reportBoardService.updateRepState(rbno);
		System.out.println("userOutRun, nickname:" + nickname);
		boolean result = adminService.userOut(nickname);
		System.out.println("adminController, userOutRun2, result :" + result);
		System.out.println("rbno:" + rbno);
		return String.valueOf(result);
	}

	// ???????????? ??? ??? ?????? ??? ????????? ??????
	@RequestMapping(value="/removeArticle", method = RequestMethod.GET)
	@ResponseBody
	public String adminRemoveArticle(int rbno, int rno, int uno, int fno, int rcno, int urcno, int fcno, int recno) {
		System.out.println("fcno: " + fcno + " uno: " + uno);
		boolean boardResult = false;
		if(rno > 0) {
			boardResult = reportBoardService.updateRecipeVisible(rno);
		} else if(uno > 0) {
			boardResult = reportBoardService.updateRoutineVisible(uno);
		} else if(fno > 0) {
			boardResult = reportBoardService.updateFreeVisible(fno);
		} else if(rcno > 0) {
			boardResult = reportBoardService.updateRCommentVisible(rcno);
		} else if(urcno > 0) {
			boardResult = reportBoardService.updateURCommentVisible(urcno);
		} else if(recno > 0) {
			boardResult = reportBoardService.updateRECommentVisible(recno);
		} else if(fcno > 0) {
			boardResult = reportBoardService.updateFreeVisible(fcno);
		}
		boolean reportResult = reportBoardService.updateRepState(rbno);
		if(reportResult && boardResult) {
			return String.valueOf(true);
		}
		return String.valueOf(false);
	}
	
	// ????????????
	@RequestMapping(value="/userWarning", method = RequestMethod.POST)
	@ResponseBody
	public String adminUserWarning(WarningMessageVo warningMessageVo, int rbno) {
		reportBoardService.updateRepState(rbno);
		boolean result = warningMessageService.insertWarningMessage(warningMessageVo);
		System.out.println("adminController, userWarning, result:" + result);
		return String.valueOf(result);
	}
	
	// ??????????????? - ?????? ?????? ????????? 
	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String adminGroupList(Model model, PagingDto pagingDto) {
		System.out.println("adminController, group, pagingDto:" + pagingDto);
		
		pagingDto.setCount(groupService.getCount(pagingDto));
		
		pagingDto.setPage(pagingDto.getPage());
		
		List<GroupVo> groupList = groupService.adminGroupList(pagingDto);
		model.addAttribute("groupList", groupList);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/adminGroupList";
	}
	
}

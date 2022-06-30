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
	
	// 관리자 모드 메인 대쉬보드
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
		
		// 최근 가입한 회원 목록
		List<MemberVo> lastestMember = memberSerive.getLatestMember();
		System.out.println("최근 가입 회원 목록:" + lastestMember);
		model.addAttribute("lastestMember", lastestMember);
		
		// 최근 신고 목록
		List<ReportBoardVo> lastestReport = reportBoardService.getLatestReport();
		model.addAttribute("lastestReport", lastestReport);
		return "/admin/admin";
	}
	
	// 전체 회원 목록
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
	
	// 관리자가 본 회원 정보
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String adminSelectMember(String userid, Model model) {
		System.out.println("adminSelectMember:" + userid);
		MemberVo memberVo = memberSerive.memberByUserid(userid);
		model.addAttribute("memberVo", memberVo);
		
		List<AdminVo> adminList = adminService.adminList(userid);
		model.addAttribute("adminList", adminList);
		
//		가입한 그룹 정보
		List<GroupVo> groupList = groupService.getGroupByUserId(userid);
		model.addAttribute("groupList", groupList);
		
		// 가입한 그룹의 멤버들 정보
//		List<GroupJoinVo> groupMemberList = groupService.list(userid);
//		model.addAttribute("groupMemberList", groupMemberList);
		List<testVo> groupInfo = adminService.getGroupInfo();
		System.out.println("groupInfo:" + groupInfo);
		model.addAttribute("groupInfo", groupInfo);
		
		
		
		return "/admin/adminMemberInfo";
	}
	
	// 회원이 작성한 글 
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public String adminMemberBoard(String userid, Model model) {
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
		
		return "/admin/adminMemberBoard";
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
	
	// 게시판 신고 리스트 
	@RequestMapping(value="/reportBoard", method = RequestMethod.GET)
	public String adminReportList(Model model) {
		List<ReportBoardVo> reportBoardVo = reportBoardService.getReportBoardList();
		System.out.println("reportBoardVo:" + reportBoardVo);
		model.addAttribute("reportBoardVo", reportBoardVo);
		return "/admin/adminReportList";
	}
	
	// 신고 내역 처리 양식
	@RequestMapping(value="/reportUpdateForm", method = RequestMethod.GET)
	public String adminReportForm(int rbno, Model model) {
		ReportBoardVo reportBoardVo = reportBoardService.getReportByRbno(rbno);
		model.addAttribute("reportBoardVo", reportBoardVo);
		return "/admin/adminReportUpdateForm";
	}
	
	// 신고받은 회원 탈퇴 처리
	@RequestMapping(value="/userOutRun/{userid}", method = RequestMethod.GET)
	@ResponseBody
	public String adminUserOutRun(@PathVariable("userid") String userid, int rbno) {
		reportBoardService.updateRepState(rbno);
		boolean result = adminService.userOut(userid);
		System.out.println("adminController, userOutRun2, result :" + result);
		System.out.println("rbno:" + rbno);
		return String.valueOf(result);
	}

	// 신고받은 글 및 댓글 안 보이게 처리
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
	
	// 경고주기
	@RequestMapping(value="/userWarning", method = RequestMethod.POST)
	@ResponseBody
	public String adminUserWarning(WarningMessageVo warningMessageVo, int rbno) {
		reportBoardService.updateRepState(rbno);
		boolean result = warningMessageService.insertWarningMessage(warningMessageVo);
		System.out.println("adminController, userWarning, result:" + result);
		return String.valueOf(result);
	}
	
	// 관리자모드 - 그룹 관리 페이지 
	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String adminGroupList(Model model, PagingDto pagingDto) {
		System.out.println("adminController, group, pagingDto:" + pagingDto);
		
		pagingDto.setCount(groupService.getCount(pagingDto));
		
		pagingDto.setPage(pagingDto.getPage());
		
		List<GroupVo> groupList = groupService.groupList(pagingDto);
		model.addAttribute("groupList", groupList);
		model.addAttribute("pagingDto", pagingDto);
		return "/admin/adminGroupList";
	}
	
}

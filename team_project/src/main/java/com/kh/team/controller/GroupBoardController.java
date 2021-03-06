package com.kh.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.CalendarServcie;
import com.kh.team.service.GroupBoardCommentService;
import com.kh.team.service.GroupBoardLikeService;
import com.kh.team.service.GroupBoardService;
import com.kh.team.service.GroupService;
import com.kh.team.service.MemberService;
import com.kh.team.service.ReportService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.CalendarVo;
import com.kh.team.vo.GroupBoardLikeVo;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.ReportVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/groupboard")
public class GroupBoardController {
	
	@Autowired
	private GroupBoardService groupBoardService;
	
	@Autowired
	private GroupBoardLikeService groupboardLikeService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private CalendarServcie calendarService;
	
	@Autowired
	private ReportService reportServcie;
	
	@Autowired
	private GroupBoardCommentService gbcService;
	
	@Autowired
	private GroupBoardLikeService gblService;
	
	@RequestMapping(value = "groupWriteForm", method = RequestMethod.GET)
	public String createForm(Model model, int gno) { // ????????? ??????
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		
		return "groupboard/groupWriteForm";
	}
	
	@RequestMapping(value = "groupWriteRun", method = RequestMethod.POST)
	public String createRun(int gno, GroupBoardVo groupBoardVo, RedirectAttributes rttr, MultipartFile file){
		System.out.println("groupBoardController, groupWriteRun, file:" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("originalFilename: " + originalFilename);
		
		String content = groupBoardVo.getGb_content();
      groupBoardVo.setGb_content(content.replaceAll("\"", "\'"));
		
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
		
		return "redirect:/groupboard/groupMain/" + groupBoardVo.getGno();
	}
	
	@RequestMapping(value = "groupRead", method = RequestMethod.GET)
	public String read(HttpSession session, int gno, int gbno, Model model, HttpServletRequest httpRequest) throws Exception {
		GroupBoardVo groupBoardVo = groupBoardService.read(gbno);
		model.addAttribute("groupBoardVo", groupBoardVo);
		
		int count = groupBoardService.countComment(gbno);
		System.out.println("count: " + count);
		model.addAttribute("count", count);
		
		// ?????? ??????
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		System.out.println("groupRead, gno: " + gno);

		// ????????? ??? ???????????? ?????? ??????
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String nickname = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getNickname();
		
		// ?????????
		GroupBoardLikeVo groupBoardLikeVo = new GroupBoardLikeVo();
		groupBoardLikeVo.setGbno(gbno);
		groupBoardLikeVo.setNickname(nickname);
		
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
		int gno = Integer.parseInt(httpRequest.getParameter("gno"));
		String nickname = ((MemberVo)httpRequest.getSession().getAttribute("loginVo")).getNickname();
		
		GroupBoardLikeVo groupBoardLikeVo = new GroupBoardLikeVo();
		groupBoardLikeVo.setGbno(gbno);
		groupBoardLikeVo.setNickname(nickname);
		groupBoardLikeVo.setGno(gno);
		
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
	   public String updateRun(MultipartHttpServletRequest request, GroupBoardVo groupBoardVo, RedirectAttributes rttr, MultipartFile file, String prevImg) {
	      String originalFilename = file.getOriginalFilename();
	      System.out.println("prevImg: " + prevImg);
	      
	      String content = groupBoardVo.getGb_content();
	      groupBoardVo.setGb_content(content.replaceAll("\"", "\'"));
	      
//	         ??????????????? ????????? ?????????????????? ?????? ??????
	         try {
	            if(originalFilename != null && !originalFilename.equals("")) {
	               String gb_pic = FileUtil.uploadFile("//192.168.0.90/upic", originalFilename, file.getBytes());
	               groupBoardVo.setGb_pic(gb_pic);
	            } else { // ????????? ????????? ?????? ??????
	               if(prevImg != null && !prevImg.equals("")) {
	                  int gbno = groupBoardVo.getGbno();
	                  String gb_pic = groupBoardService.getGb_picById(gbno);
	                  groupBoardVo.setGb_pic(gb_pic);
	               } else if(prevImg == null || prevImg.equals("")) {
	                  groupBoardVo.setGb_pic(null);
	               }
	            }
	         } catch(Exception e) {
	            e.printStackTrace();
	         }
	         rttr.addAttribute("gbno", groupBoardVo.getGbno());
	         boolean result = groupBoardService.update(groupBoardVo);
	         rttr.addFlashAttribute("update_result", result);
	      
	      return "redirect:/groupboard/groupRead?gno=" + groupBoardVo.getGno() + "&gbno=" + groupBoardVo.getGbno();
	   }

	@RequestMapping(value = "groupDelete", method = RequestMethod.GET)
	public String delete(int gno, int gbno, RedirectAttributes rttr) {
		boolean deleteAllComment = gbcService.deleteAllGComment(gbno);
		boolean deleteAllLike = gblService.deleteAllLike(gbno);
		boolean result = groupBoardService.delete(gbno);
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/groupboard/groupMain/" + gno;
	}
	
	@RequestMapping(value = "groupMain/{gno}", method = RequestMethod.GET)
	public String main(HttpSession session, Model model, String gb_notice, @PathVariable("gno") int gno, PagingDto pagingDto) {
		pagingDto.setGno(gno);

		pagingDto.setCount(groupBoardService.getCountMain(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		System.out.println("main, searchDto:" + pagingDto);
		model.addAttribute("searchDto", pagingDto);

		List<GroupBoardVo> groupList = groupBoardService.list(pagingDto);
		System.out.println("groupBoardController, groupMain, groupList:" + groupList);
		model.addAttribute("groupList", groupList);
		
		System.out.println("controller, groupList: " + groupList);
		System.out.println("controller, searchDto: " + pagingDto);
		
		List<GroupBoardVo> noticeList = groupBoardService.notice(gb_notice);
		model.addAttribute("noticeList", noticeList);
		
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		
		List<GroupJoinVo> groupJoinMember = groupService.list(gno);
		model.addAttribute("groupJoinMember", groupJoinMember);
		
		List<String> nickname = groupService.getNickname(gno);
		model.addAttribute("nickname", nickname);
		
		
		
		// ?????? ?????????
		session.setAttribute("groupVo", groupVo);
		
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		
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
	
	
	
	@RequestMapping(value = "like", method = RequestMethod.POST)
	public String like() {
		
		return "groupboard/like";
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(String gb_notice, Model model, int gno, PagingDto pagingDto) {
		List<GroupBoardVo> noticeList = groupBoardService.notice(gb_notice);

		pagingDto.setCount(groupBoardService.getCount(pagingDto));
		pagingDto.setPage(pagingDto.getPage());
		System.out.println("notice, pagingDto:" + pagingDto);
		model.addAttribute("pagingDto", pagingDto);
		
		model.addAttribute("noticeList", noticeList);
		
		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		
		return "groupboard/notice";
	}
	
	@RequestMapping(value = "activityInfo/{gno}", method = RequestMethod.GET)
	public String activityInfo(Model model, HttpSession session, HttpServletRequest httpRequest, @PathVariable("gno") int gno) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		String thisYear = String.valueOf(LocalDate.now().getYear());
		String thisMonth = String.valueOf(LocalDate.now().getMonthValue());
		String month = thisYear + "_" + thisMonth;
		List<CalendarVo> calList = calendarService.getCal(month, userid);
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("jsonCal", jsonArray.fromObject(calList));

		GroupVo groupVo = groupService.groupByGno(gno);
		model.addAttribute("groupVo", groupVo);
		
		List<GroupJoinVo> groupJoinMember = groupService.list(gno);
		model.addAttribute("groupJoinMember", groupJoinMember);
		
		return "groupboard/activityInfo";
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String filename) {
		boolean result = FileUtil.deleteFile(filename);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "leave/{nickname}", method = RequestMethod.GET)
	public String leaveGroup(@PathVariable("nickname") String nickname, int gno, RedirectAttributes rttr) {
		boolean result = groupBoardService.deleteMember(nickname, gno);
		rttr.addFlashAttribute("leave_group", result);
		
		groupBoardService.updateCtnMember(gno);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		String uploadPath = "//192.168.0.90/gbpic";
		String originalFilename = multipartFile.getOriginalFilename();

		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
		return file;
	}
	
	@RequestMapping(value = "/leaveGroup/{g_leader}/{gno}", method = RequestMethod.GET)
	@ResponseBody
	public String deleteMember( 
			@PathVariable("g_leader") String userid, 
			@PathVariable("gno") int gno, GroupVo groupVo, Model model) {
		boolean result = groupBoardService.updateGLeader(groupVo);
		System.out.println("updateGLeader, result: " + result);

		System.out.println("deleteMember, gno: " + gno);
		
//		boolean result2 = groupService.banGroup(gno, g_leader);
//		rttr.addFlashAttribute("delete_member", result);
		
		List<GroupJoinVo> groupJoinMember = groupService.list(gno);
		model.addAttribute("groupJoinMember", groupJoinMember);
		
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/reportForm/{nickname}/{gno}", method = RequestMethod.GET)
	public String insertReportForm(@PathVariable("nickname") String nickname, 
			@PathVariable("gno") int gno, Model model) {
		model.addAttribute("gno", gno);
		model.addAttribute("nickname", nickname);
		
		return "groupboard/reportForm";
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	@ResponseBody
	public String report(int gno, String nickname, String rep_cause) {
		boolean result = reportServcie.insertReport(gno, nickname, rep_cause);
		
		System.out.println("rep_cause: " + rep_cause);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/reportList/{nickname}/{gno}", method = RequestMethod.GET)
	public String reportList(@PathVariable("nickname") String nickname, 
			@PathVariable("gno") int gno, Model model) {
		List<ReportVo> reportList = reportServcie.reportList(gno, nickname);
		System.out.println("reportList: " + reportList);
		
		model.addAttribute("reportList", reportList);
		
		return "groupboard/reportList";
	}
	
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public String pickGroupMember(String nickname, Model model) {
		MemberVo memberVo = groupBoardService.pickGroupMember(nickname);
		System.out.println("pickGroupMember, memberVo: " + memberVo);
		model.addAttribute("memberVo", memberVo);
		
		return "groupboard/memberInfo";
	}
}

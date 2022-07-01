package com.kh.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.ReportBoardService;
import com.kh.team.service.WarningMessageService;
import com.kh.team.vo.ReportBoardVo;
import com.kh.team.vo.WarningMessageVo;

@Controller
@RequestMapping("/reportBoard")
public class ReportBoardController {
	
	@Autowired
	ReportBoardService reportBoardService;
	
	@Autowired
	WarningMessageService warningService;
	
	@RequestMapping(value = "/reportBoardPop", method = RequestMethod.GET)
	public String reportBoardPop(ReportBoardVo reportBoardVo, Model model) {
		model.addAttribute("reportBoardVo", reportBoardVo);
		return "board/reportBoardPop";
	}
	
	@RequestMapping(value = "/addReportRun", method = RequestMethod.POST)
	public void addRoutineRun(ReportBoardVo reportBoardVo) {
		System.out.println(reportBoardVo);
		reportBoardService.addReportBoard(reportBoardVo);
	}
	
	@RequestMapping(value = "/warningMessageList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> warningMessageList(String nickname, Model model) {
		int count = warningService.warningCount(nickname);
		List<WarningMessageVo> list = warningService.listWarningMessage(nickname);
		Map<String, Object> map = new HashMap<>();
		map.put("warningList", list);
		map.put("warningCount", count);
		System.out.println("warningCount: " + count);
		System.out.println("warningList: " + list);
		return map;
	}
	
	@RequestMapping(value = "/warningList", method = RequestMethod.GET)
	public String warningList(String nickname, Model model) {
		List<WarningMessageVo> list = warningService.listWarningMessage(nickname);
		model.addAttribute("warningList", list);
		return "/board/warningMessage";
	}

}

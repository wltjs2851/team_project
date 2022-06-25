package com.kh.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.ReportBoardService;
import com.kh.team.vo.ReportBoardVo;

@Controller
@RequestMapping("/reportBoard")
public class ReportBoardController {
	
	@Autowired
	ReportBoardService reportBoardService;
	
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

}

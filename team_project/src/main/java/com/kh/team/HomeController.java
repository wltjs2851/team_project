package com.kh.team;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.RecommendService;
import com.kh.team.vo.RecommendVo;

@Controller
public class HomeController {
	
	@Autowired
	private RecommendService recommendService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<RecommendVo> listRecommend = recommendService.selectByViewCnt();
		model.addAttribute("listRecommend", listRecommend);
		return "home";
	}
	
}

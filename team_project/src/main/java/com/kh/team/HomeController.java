package com.kh.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.RecipeService;
import com.kh.team.service.RecommendService;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;

@Controller
public class HomeController {
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<RecommendVo> listRecommend = recommendService.selectByViewCnt();
		List<RecipeVo> listRecipe = recipeService.selectByViewCnt();
		model.addAttribute("listRecommend", listRecommend);
		model.addAttribute("listRecipe", listRecipe);
		return "home";
	}
	
}

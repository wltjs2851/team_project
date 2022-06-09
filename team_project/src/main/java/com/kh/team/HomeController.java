package com.kh.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.service.FreeService;
import com.kh.team.service.RecipeService;
import com.kh.team.service.RecommendService;
import com.kh.team.service.RoutineService;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineVo;

@Controller
public class HomeController {
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private RoutineService routineService;
	
	@Autowired
	private FreeService freeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@Transactional
	public String home(Model model) {
		List<RecommendVo> listRecommend = recommendService.selectByViewCnt();
		List<RecipeVo> listRecipe = recipeService.selectByViewCnt();
		List<RoutineVo> listRoutine	= routineService.selectByViewCnt();
		List<FreeVo> listFree = freeService.selectByViewCnt();
		model.addAttribute("listRecommend", listRecommend);
		model.addAttribute("listRecipe", listRecipe);
		model.addAttribute("listRoutine", listRoutine);
		model.addAttribute("listFree", listFree);
		return "home";
	}
	
}

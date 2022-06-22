package com.kh.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team.service.FreeService;
import com.kh.team.service.GroupService;
import com.kh.team.service.RecipeService;
import com.kh.team.service.RecommendService;
import com.kh.team.service.RoutineService;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RecommendVo;
import com.kh.team.vo.RoutineVo;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private RoutineService routineService;
	
	@Autowired
	private FreeService freeService;
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	@Transactional
	public String home(Model model) {
		List<RecommendVo> listRecommend = recommendService.selectByViewCnt();
		List<RecipeVo> listRecipe = recipeService.selectByViewCnt();
		List<RoutineVo> listRoutine	= routineService.selectByViewCnt();
		List<FreeVo> listFree = freeService.selectByViewCnt();
		List<GroupVo> listGroup = groupService.groupListOrder();
		List<LocationVo> listLocation = groupService.groupLocation();
		List<GroupVo> seoulGroup = groupService.groupByLocation(1);
		List<GroupVo> incheonGroup = groupService.groupByLocation(2);
		List<GroupVo> dajeonGroup = groupService.groupByLocation(3);
		List<GroupVo> daeguGroup = groupService.groupByLocation(4);
		List<GroupVo> ulsanGroup = groupService.groupByLocation(5);
		List<GroupVo> busanGroup = groupService.groupByLocation(6);
		List<GroupVo> gwangjuGroup = groupService.groupByLocation(7);
		List<GroupVo> kyeongkiGroup = groupService.groupByLocation(9);
		model.addAttribute("listRecommend", listRecommend);
		model.addAttribute("listRecipe", listRecipe);
		model.addAttribute("listRoutine", listRoutine);
		model.addAttribute("listFree", listFree);
		model.addAttribute("listGroup", listGroup);
		model.addAttribute("listLocation", listLocation);
		return "home";
	}
	
	@RequestMapping(value = "/getSno/{dno}", method = RequestMethod.GET)
	@ResponseBody
	public List<LocationVo> getUno(@PathVariable("dno") int dno) {
		List<LocationVo> s_location = groupService.groupLocationSno(dno);
		return s_location;
	}
	
	@RequestMapping(value = "/getSgno/{dno}/{sno}", method = RequestMethod.GET)
	@ResponseBody
	public List<LocationVo> getSno(@PathVariable("dno") int dno, @PathVariable("sno") int sno) {
		List<LocationVo> sg_location = groupService.groupLocationSgno(dno, sno);
		return sg_location;
	}
	
}

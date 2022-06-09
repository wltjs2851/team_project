package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.service.RoutineCommentService;
import com.kh.team.service.RoutineService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;

@Controller
@RequestMapping("/routine")
public class RoutineController {
	
	@Autowired
	RoutineService routineService;
	
	@Autowired
	RoutineCommentService routineCommentService;
	
	@RequestMapping(value = "/routineList", method = RequestMethod.GET)
	public String routineList(Model model) {
		List<RoutineVo> routineList = routineService.routineList();
		model.addAttribute("routineList", routineList);
		return "board/routineList";
	}

	@RequestMapping(value = "/addRoutineForm", method = RequestMethod.GET)
	public String addRoutineForm() {
		return "board/addRoutine";
	}
	
	@RequestMapping(value = "/addRoutineRun", method = RequestMethod.POST)
	public String addRoutineRun(RoutineVo routineVo) {
		System.out.println("RecipeController, addRecipeRun, recipeVo: " + routineVo);
		String content = routineVo.getUr_content();
		routineVo.setUr_content(content.replace("\"", "\'"));
		if(content.indexOf("filename") != -1) {
			String ur_pic = content.substring(content.indexOf("filename"));
			ur_pic = ur_pic.substring(9, ur_pic.indexOf("\""));
			routineVo.setUr_pic(ur_pic);
		}
		routineService.addRoutine(routineVo);
		return "redirect:/routine/routineList";
	}

	@RequestMapping(value = "/routineContent", method = RequestMethod.GET)
	public String routineContent(Model model, int uno) {
		RoutineVo routineVo = routineService.contentByUno(uno);
		model.addAttribute("routineVo", routineVo);
		return "board/routineContent";
	}

	@RequestMapping(value = "/modifyRoutineForm", method = RequestMethod.GET)
	public String modifyRoutineForm(Model model, int uno) {
		RoutineVo routineVo = routineService.contentByUno(uno);
		model.addAttribute("routineVo", routineVo);
		return "board/modifyRoutineForm";
	}

	@RequestMapping(value = "/modifyRoutineRun", method = RequestMethod.POST)
	public String recipeModifyRun(RoutineVo routineVo) {
		System.out.println("RecipeController, recipeModifyRun, recipeVo: " + routineVo);
		String content = routineVo.getUr_content();
		routineVo.setUr_content(content.replaceAll("\"", "\'"));
		routineService.modifyRoutine(routineVo);
		return "redirect:/routine/routineContent?uno=" + routineVo.getUno();
	}
	
	@RequestMapping(value = "/addRoutineComment", method = RequestMethod.POST)
	@ResponseBody
	public String addRecipeComment(RoutineCommentVo routineCommentVo) throws Exception {
		System.out.println(routineCommentVo);
		boolean result = routineCommentService.addRoutineComment(routineCommentVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/commentRoutineList/{uno}", method = RequestMethod.GET)
	@ResponseBody
	public List<RoutineCommentVo> commentRecipeList(@PathVariable("uno") int uno) {
		List<RoutineCommentVo> list = routineCommentService.selectRoutineCommentList(uno);
		return list;
	}

	@RequestMapping(value = "/modifyRoutineComment", method = RequestMethod.POST)
	@ResponseBody
	public String modifyComment(RoutineCommentVo routineCommentVo) {
		boolean result = routineCommentService.modifyRoutineComment(routineCommentVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		FileInputStream fis;
		fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value = "/removeRoutineComment/{urcno}", method = RequestMethod.GET)
	@ResponseBody
	public String removeRoutineComment(@PathVariable("urcno") int urcno) {
		boolean result = routineCommentService.removeRoutineComment(urcno);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		String uploadPath = "//192.168.0.90/urpic";
		String originalFilename = multipartFile.getOriginalFilename();

		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
		return file;
	}

}

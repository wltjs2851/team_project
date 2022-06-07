package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.service.RecipeService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.RecipeVo;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping(value = "/recipeList", method = RequestMethod.GET)
	public String recipeList(Model model) {
		List<RecipeVo> recipeList = recipeService.recipeList();
		model.addAttribute("recipeList", recipeList);
		return "board/recipeList";
	}
	
	@RequestMapping(value = "/addRecipeForm", method = RequestMethod.GET)
	public String addRecipeForm() {
		return "board/addRecipe";
	}
	
	@RequestMapping(value = "/addRecipeRun", method = RequestMethod.POST)
	public String addRecipeRun(RecipeVo recipeVo, MultipartFile file) {
		System.out.println("RecipeController, addRecipeRun, recipeVo: " + recipeVo);
		System.out.println("RecipeController, addRecipeRun, file: " + file);
		String originalFile = file.getOriginalFilename();
		try {
			String r_pic = FileUtil.uploadFile("//192.168.0.90/rpic", originalFile, file.getBytes());
			recipeVo.setR_pic(r_pic);
			recipeService.addRecipe(recipeVo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		recipeService.addRecipe(recipeVo);
		return "redirect:/recipe/recipeList";
	}
	
	@RequestMapping(value = "/recipeForm", method = RequestMethod.GET)
	public String recipeForm(Model model, int rno) {
		RecipeVo recipeVo = recipeService.contentByRno(rno);
		model.addAttribute("recipeVo", recipeVo);
		return "board/recipeForm";
	}
	
	@RequestMapping(value = "/recipeModifyRun", method = RequestMethod.POST)
	public String recipeModifyRun( RecipeVo recipeVo, MultipartFile file) {
		System.out.println("RecipeController, recipeModifyRun, recipeVo: " + recipeVo);
		System.out.println("RecipeController, recipeModifyRun, file: " + file);
		String originalFile = file.getOriginalFilename();
		if(originalFile != null && !originalFile.equals("")) {
			try {
				String r_pic = FileUtil.uploadFile("//192.168.0.90/rpic", originalFile, file.getBytes());
				recipeVo.setR_pic(r_pic);
				System.out.println("RecipeController, recipeModifyRun, recipeVo: " + recipeVo);
				recipeService.moidfyRecipe(recipeVo);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			RecipeVo recipeVo2 = recipeService.contentByRno(recipeVo.getRno());
			String r_pic = recipeVo2.getR_pic();
			recipeVo.setR_pic(r_pic);
			recipeService.moidfyRecipe(recipeVo);
		}
		return "redirect:/recipe/recipeList";
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
	
	@RequestMapping(value = "/summernote", method = RequestMethod.GET)
	public String summernote() {
		return "/board/summernote";
	}
} 

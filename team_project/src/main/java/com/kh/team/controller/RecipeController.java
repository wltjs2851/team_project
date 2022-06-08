package com.kh.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
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

import com.google.gson.JsonObject;
import com.kh.team.service.RecipeCommentService;
import com.kh.team.service.RecipeService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService recipeService;

	@Autowired
	private RecipeCommentService recipeCommentService;

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
	public String addRecipeRun(RecipeVo recipeVo) {
		System.out.println("RecipeController, addRecipeRun, recipeVo: " + recipeVo);
		String content = recipeVo.getR_content();
		recipeVo.setR_content(content.replaceAll("\"", "\'"));
		String target = "filename";
		int num = content.indexOf(target);
		String r_pic = content.substring(num);
		int col = r_pic.indexOf("\"");
		r_pic = r_pic.substring(9, col);
		System.out.println(r_pic);
		recipeVo.setR_pic(r_pic);
		recipeService.addRecipe(recipeVo);
		return "redirect:/recipe/recipeList";
	}

	@RequestMapping(value = "/recipeForm", method = RequestMethod.GET)
	public String recipeForm(Model model, int rno) {
		RecipeVo recipeVo = recipeService.contentByRno(rno);
		model.addAttribute("recipeVo", recipeVo);
		return "board/recipeForm";
	}

	@RequestMapping(value = "/modifyRecipeForm", method = RequestMethod.GET)
	public String modifyRecipeForm(Model model, int rno) {
		RecipeVo recipeVo = recipeService.contentByRno(rno);
		model.addAttribute("recipeVo", recipeVo);
		return "board/modifyRecipeForm";
	}

	@RequestMapping(value = "/recipeModifyRun", method = RequestMethod.POST)
	public String recipeModifyRun(RecipeVo recipeVo) {
		System.out.println("RecipeController, recipeModifyRun, recipeVo: " + recipeVo);
		String content = recipeVo.getR_content();
		recipeVo.setR_content(content.replaceAll("\"", "\'"));
		recipeService.moidfyRecipe(recipeVo);
		return "redirect:/recipe/recipeForm?rno=" + recipeVo.getRno();
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

	@RequestMapping(value = "/addRecipeComment", method = RequestMethod.POST)
	@ResponseBody
	public String addRecipeComment(RecipeCommentVo recipeCommentVo) throws Exception {
		System.out.println(recipeCommentVo);
		boolean result = recipeCommentService.addRecipeComment(recipeCommentVo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/commentRecipeList/{rno}", method = RequestMethod.GET)
	@ResponseBody
	public List<RecipeCommentVo> commentRecipeList(@PathVariable("rno") int rno) {
		List<RecipeCommentVo> list = recipeCommentService.selectRecipeCommentList(rno);
		return list;
	}

	@RequestMapping(value = "/modifyComment", method = RequestMethod.POST)
	@ResponseBody
	public String modifyComment(RecipeCommentVo recipeCommentVo) {
		boolean result = recipeCommentService.modifyRecipeComment(recipeCommentVo);
		return String.valueOf(result);
	}
	


	@RequestMapping(value = "/summernote", method = RequestMethod.GET)
	public String summernote() {
		return "/board/summernote";
	}

	@RequestMapping(value = "/summerRun", method = RequestMethod.POST)
	public String summerRun(String editordata) {
		System.out.println(editordata);
		return "/board/summernote";
	}

	@RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		String uploadPath = "//192.168.0.90/rpic";
		String originalFilename = multipartFile.getOriginalFilename();

		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
		return file;
	}
}

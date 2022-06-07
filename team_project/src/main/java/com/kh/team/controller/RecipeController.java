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
	
	@RequestMapping(value = "/summerRun", method = RequestMethod.POST)
	public String summerRun(String editordata) {
		System.out.println(editordata);
		return "/board/summernote";
	}
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		
//		JsonObject jsonObject = new JsonObject();
		
		String uploadPath = "//192.168.0.90/summernote_image";
		String originalFilename = multipartFile.getOriginalFilename();
		
		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
//		jsonObject.addProperty("file", file);
//		System.out.println(jsonObject);
//		
		return file;
	}
	
	@RequestMapping(value="/addRecipeComment", method = RequestMethod.POST)
	@ResponseBody
	public String addRecipeComment(RecipeCommentVo recipeCommentVo) throws Exception {
		System.out.println(recipeCommentVo);
		boolean result = recipeCommentService.addRecipeComment(recipeCommentVo);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/commentRecipeList/{rno}", method = RequestMethod.GET)
	@ResponseBody
	public List<RecipeCommentVo> commentRecipeList(@PathVariable("rno") int rno) {
		List<RecipeCommentVo> list = recipeCommentService.selectRecipeCommentList(rno);
		return list;
	}
} 

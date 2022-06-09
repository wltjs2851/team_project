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

import com.kh.team.service.FreeService;
import com.kh.team.service.RoutineCommentService;
import com.kh.team.service.RoutineService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineCommentVo;
import com.kh.team.vo.RoutineVo;

@Controller
@RequestMapping("/free")
public class FreeController {
	
	@Autowired
	FreeService freeService;
	
	@RequestMapping(value = "/freeList", method = RequestMethod.GET)
	public String FreeList(Model model) {
		List<FreeVo> freeList = freeService.freeList();
		model.addAttribute("freeList", freeList);
		return "board/freeList";
	}

	@RequestMapping(value = "/addFreeForm", method = RequestMethod.GET)
	public String addFreeForm(Model model) {
		List<FreeVo> categoryList = freeService.categoryList();
		model.addAttribute("categoryList", categoryList);
		return "board/addFree";
	}
	
	@RequestMapping(value = "/addFreeRun", method = RequestMethod.POST)
	public String addFreeRun(FreeVo freeVo) {
		System.out.println("FreeController, addFreeRun, freeVo: " + freeVo);
		String content = freeVo.getF_content();
		freeVo.setF_content(content.replace("\"", "\'"));
		if(content.indexOf("filename") != -1) {
			String f_pic = content.substring(content.indexOf("filename"));
			f_pic = f_pic.substring(9, f_pic.indexOf("\""));
			freeVo.setF_pic(f_pic);
		}
		freeService.addFree(freeVo);
		return "redirect:/free/freeList";
	}

	@RequestMapping(value = "/freeContent", method = RequestMethod.GET)
	public String freeContent(Model model, int fno) {
		FreeVo freeVo = freeService.contentByFno(fno);
		model.addAttribute("freeVo", freeVo);
		return "board/freeContent";
	}

	@RequestMapping(value = "/modifyFreeForm", method = RequestMethod.GET)
	public String modifyFreeForm(Model model, int fno) {
		FreeVo freeVo = freeService.contentByFno(fno);
		model.addAttribute("freeVo", freeVo);
		return "board/modifyFreeForm";
	}

	@RequestMapping(value = "/modifyFreeRun", method = RequestMethod.POST)
	public String modifyFreeRun(FreeVo freeVo) {
		System.out.println("FreeController, modifyFreeRun, FreeVo: " + freeVo);
		String content = freeVo.getF_content();
		freeVo.setF_content(content.replaceAll("\"", "\'"));
		freeService.modifyFree(freeVo);
		return "redirect:/free/freeContent?fno=" + freeVo.getFno();
	}
	
//	@RequestMapping(value = "/addFreeComment", method = RequestMethod.POST)
//	@ResponseBody
//	public String addRecipeComment(RoutineCommentVo routineCommentVo) throws Exception {
//		System.out.println(routineCommentVo);
//		boolean result = routineCommentService.addRoutineComment(routineCommentVo);
//		return String.valueOf(result);
//	}
//
//	@RequestMapping(value = "/commentRoutineList/{uno}", method = RequestMethod.GET)
//	@ResponseBody
//	public List<RoutineCommentVo> commentRecipeList(@PathVariable("uno") int uno) {
//		List<RoutineCommentVo> list = routineCommentService.selectRoutineCommentList(uno);
//		return list;
//	}
//
//	@RequestMapping(value = "/modifyRoutineComment", method = RequestMethod.POST)
//	@ResponseBody
//	public String modifyComment(RoutineCommentVo routineCommentVo) {
//		boolean result = routineCommentService.modifyRoutineComment(routineCommentVo);
//		return String.valueOf(result);
//	}
//	
//	@RequestMapping(value = "/removeRoutineComment/{urcno}", method = RequestMethod.GET)
//	@ResponseBody
//	public String removeRoutineComment(@PathVariable("urcno") int urcno) {
//		boolean result = routineCommentService.removeRoutineComment(urcno);
//		return String.valueOf(result);
//	}

	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception {
		FileInputStream fis;
		fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value = "/uploadSummernoteImageFile", method = RequestMethod.POST)
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		String uploadPath = "//192.168.0.90/fpic";
		String originalFilename = multipartFile.getOriginalFilename();

		String file = FileUtil.uploadFile(uploadPath, originalFilename, multipartFile.getBytes());
		System.out.println(file);
		return file;
	}

}

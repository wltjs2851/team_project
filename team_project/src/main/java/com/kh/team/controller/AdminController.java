package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.KcalService;
import com.kh.team.service.RecommendLikeService;
import com.kh.team.service.RecommendService;
import com.kh.team.util.FileUtil;
import com.kh.team.vo.KcalVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RecommendLikeVo;
import com.kh.team.vo.RecommendVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private KcalService kcalService;
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private RecommendLikeService recommendLikeService;
	
}

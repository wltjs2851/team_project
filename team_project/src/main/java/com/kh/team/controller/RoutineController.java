package com.kh.team.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/routine")
public class RoutineController {
	
	@Autowired
	SqlSession sqlSession;
	
	

}

package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.AdminDao;
import com.kh.team.dao.KcalDao;
import com.kh.team.service.AdminService;
import com.kh.team.service.MemberService;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.KcalVo;
import com.kh.team.vo.MemberVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class AdminDaoTest {
	
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private MemberService memberService;
	
	
	// 글 목록 조회
//	@Test
//	public void testList() {
//		List<KcalVo> kcalList = kcalDao.listKcal();
//		for (KcalVo kcalVo : kcalList) {
//			System.out.println("kcalList:" + kcalVo);
//		}
//		System.out.println("kcalList:" + kcalList);
//	}
	
	@Test
	public void testAdminList() {
		String userid = "hong1234";
		List<AdminVo> adminList = dao.adminList(userid);
		System.out.println("adminList:"+adminList);
	}
	
	@Test
	public void testMemberOut() {
		boolean result = service.userOut("test3");
		System.out.println("result: " + result);
	}
	
	@Test
	public void testMemberJoin() {
		for (int i = 1; i <= 50; i++) {
			MemberVo memberVo = new MemberVo("userTest" + i, "userTest1!", "테스트" + i, "userTest" + i + "@gmail.com", "테스트시 테스트구", "M", "테스트" + i, 22);
			memberService.joinMember(memberVo);
		}
	}
}

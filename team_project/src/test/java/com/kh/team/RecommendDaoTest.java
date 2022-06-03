package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecommendDao;
import com.kh.team.vo.RecommendVo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RecommendDaoTest {
	
	@Autowired
	private RecommendDao recommendDao;
	
	// 추천 운동 페이지 테스트  
	@Test
	public void testInsertRe() {
		RecommendVo recommendVo = new RecommendVo("주짓수 추천함", "주짓수");
		recommendDao.insertRecommend(recommendVo);
	}
	
	// 글 수정
	@Test
	public void testUpdateRe() {
		int reno = 3;
		RecommendVo recommendVo = new RecommendVo(reno, "주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 주짓수 추천 ", "주짓수");
		recommendDao.updateRecommend(recommendVo);
	}
	
	// 상세 글 조회
	@Test
	public void testSelectByRe() {
	}
	
	// 글 목록 조회
	@Test
	public void testListRe() {
//		List<KcalVo> kcalList = kcalDao.listKcal();
//		for (KcalVo kcalVo : kcalList) {
//			System.out.println("kcalList:" + kcalVo);
//		}
	}
	
	// 글 삭제 
	@Test
	public void testDeleteRe() {
	}
	
	
	
}

package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.KcalDao;
import com.kh.team.vo.KcalVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class KcalDaoTest {
	
	@Autowired
	private KcalDao kcalDao;
	
	// kcal 사전 페이지 글 추가 
	@Test
	public void testInsertKcal() {
		KcalVo kcalVo = new KcalVo("실내자전거", "30분", "100kcal", "하");
		boolean result = kcalDao.insertKcal(kcalVo);
		System.out.println("testInsertKcal, result:" + result);
	}
	
	// 가짜 데이터 넣기 
	@Test
	public void testInsertFake() {
		for (int i = 1; i <= 500; i++) {
			KcalVo kcalVo = new KcalVo("제목" + i, "30", "100", "보통");
			kcalDao.insertKcal(kcalVo);
		}
	}
	
	// 글 수정
	@Test
	public void testUpdateKcal() {
		int kno = 1;
		KcalVo kcalVo = new KcalVo(kno, "풋살", "100분", "800", "중");
		boolean result = kcalDao.updateKcal(kcalVo);
		System.out.println("testUpdateKcal, result:" + result);
	}
	
	// 상세 글 조회
	@Test
	public void testSelectByKno() {
		int kno = 2;
		KcalVo kcalVo = kcalDao.selectByKno(kno);
		System.out.println("kcalVo:" + kcalVo);
	}
	
	// 글 목록 조회
//	@Test
//	public void testList() {
//		List<KcalVo> kcalList = kcalDao.listKcal();
//		for (KcalVo kcalVo : kcalList) {
//			System.out.println("kcalList:" + kcalVo);
//		}
//		System.out.println("kcalList:" + kcalList);
//	}
	
	// 글 삭제 
	@Test
	public void testDeleteKcal() {
		int kno = 2;
		kcalDao.deleteKcal(kno);
	}
	
	
	
}

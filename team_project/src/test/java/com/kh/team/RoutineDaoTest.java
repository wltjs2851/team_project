package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecipeDao;
import com.kh.team.dao.RoutineCommentDao;
import com.kh.team.dao.RoutineDao;
import com.kh.team.service.RoutineService;
import com.kh.team.vo.RecipeVo;
import com.kh.team.vo.RoutineVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RoutineDaoTest {
	
	@Autowired
	RoutineDao routineDao;
	
	@Autowired
	RoutineService routineService;
	
	@Autowired
	RoutineCommentDao commentDao;

	
	@Test
	public void testRoutineInsert() {
		for(int i = 0; i < 112; i++) {			
			RoutineVo routineVo = new RoutineVo("루틴" + i, "내용" + i, "user1234", null);
			boolean result = routineDao.insertRoutine(routineVo);
			System.out.println("result: " + result);
		}
	}
	
	@Test
	public void testRoutineUpdate() {
		RoutineVo routineVo = new RoutineVo(2, "��ƾ2", "�ٷ� �� �ܹ���", "user01", null);
		boolean result = routineDao.updateRoutine(routineVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeDelete() {
		boolean result = commentDao.deleteRoutineCommentAll(131);
		System.out.println("result: " + result);
	}

}

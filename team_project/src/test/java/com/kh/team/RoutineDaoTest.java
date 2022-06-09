package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecipeDao;
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
	
	@Test
	public void testsRoutineInsert() {
		RoutineVo routineVo = new RoutineVo("루틴6", "내용용", "hong2", null);
		boolean result = routineService.addRoutine(routineVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRoutineInsert() {
		RoutineVo routineVo = new RoutineVo("루틴1", "내용1", "user01", null);
		boolean result = routineDao.insertRoutine(routineVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeList() {
		List<RoutineVo> list = routineDao.selectRoutine();
		System.out.println("result: " + list);
	}
	
	@Test
	public void testRoutineUpdate() {
		RoutineVo routineVo = new RoutineVo(2, "루틴2", "근력 후 단백질", "user01", null);
		boolean result = routineDao.updateRoutine(routineVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeDelete() {
		boolean result = routineDao.deleteRoutine(1);
		System.out.println("result: " + result);
	}

}

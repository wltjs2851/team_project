package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecipeDao;
import com.kh.team.service.RecipeService;
import com.kh.team.vo.RecipeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RecipeDaoTest {
	
	@Autowired
	RecipeDao recipeDao;
	
	@Autowired 
	RecipeService recipeService;
	
	@Test
	public void testRecipeInsert() {
		for(int i = 0; i < 51; i++) {			
			RecipeVo recipeVo = new RecipeVo("식단" + i, "내용" + i, "tuna11", null);
			boolean result = recipeDao.insertRecipe(recipeVo);
			System.out.println("result: " + result);
		}
	}
	
	@Test
	public void testRecipeUpdate() {
		RecipeVo recipeVo = new RecipeVo(1, "������1", "�ܹ���", "user01", null);
		boolean result = recipeDao.updateRecipe(recipeVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeDelete() {
		boolean result = recipeDao.deleteRecipe(1);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testCommentCount() {
		int result = recipeDao.countComment(7, "hong1234");
		System.out.println("result: " + result);
	}
	
	@Test
	public void testlike() {
		int like = recipeService.isLike(41, "hong1234");
		boolean result;
		if(like > 0) {
			recipeService.decreaseLike(41, 2, "hong1234");
			result = false;
		} else {
			recipeService.increaseLike(41, 1, "hong1234");
			result = true;
		}
		System.out.println("result: " + result);
	}
}
